package com.xbb.blog.controller;

import com.github.pagehelper.PageInfo;
import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.constant.SessionConstant;
import com.xbb.blog.constant.WebPathConstant;
import com.xbb.blog.entity.Article;
import com.xbb.blog.entity.Label;
import com.xbb.blog.entity.User;
import com.xbb.blog.bo.RestMapBO;
import com.xbb.blog.service.ArticleService;
import com.xbb.blog.service.LabelService;
import com.xbb.blog.service.PageHelperService;
import com.xbb.blog.service.UserService;
import com.xbb.blog.utils.DateUtil;
import com.xbb.blog.utils.MD5Util;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author shiex-薛
 * @title: UserController
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\4 000414:48
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;
    @Resource
    private ArticleService articleService;
    @Resource
    private LabelService labelService;
    @Resource
    private PageHelperService pageHelperService;

    @ResponseBody
    @PostMapping("/register.do")
    public Map<String, Object> checkRegister(@RequestBody User registerUser){
        Map<String, Object> restMap = RestMapBO.getRestMap();

        User selectUser = new User();
        selectUser.setUsername(registerUser.getUsername());
        User user = userService.selectOne(selectUser);

        if (user == null){
            String encryptPassword = MD5Util.encrypt(registerUser.getUsername(), registerUser.getPassword());
            registerUser.setPassword(encryptPassword);
            registerUser.setRegisterTime(new Date());
            userService.insertSelective(registerUser);

            try{
                String fileDate = DateUtil.getFormatDate2();
                String fileRequestPath = "/frontend/user/" + fileDate + "/" + registerUser.getId();
                File fileDir = new File(WebPathConstant.STATIC_PATH, fileRequestPath);
                if (!fileDir.exists()){
                    fileDir.mkdirs();
                    registerUser.setFileDir(fileDir.toString());
                    registerUser.setFileRequestPath(fileRequestPath);
                    userService.updateByPrimaryKeySelective(registerUser);
                }
            }catch (Exception e){}

        }else {
            RestMapBO.setErrorRestMap(restMap, "用户名已存在，请直接登录");
        }

        return restMap;
    }

    @PostMapping("/login.do")
    @ResponseBody
    public Map<String, Object> checkLogin(@RequestBody User u) {
        Map<String, Object> restMap = RestMapBO.getRestMap();

        if (StringUtils.isBlank(u.getUsername()) || StringUtils.isBlank(u.getPassword())){
            RestMapBO.setErrorRestMap(restMap, "用户名/密码不得为空!");
            return restMap;
        }

        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(u.getUsername(),u.getPassword());
        // token.setRememberMe(true); // 记住我
        try{
            subject.login(token);
        }catch (UnknownAccountException e){
            RestMapBO.setErrorRestMap(restMap, e.getMessage());
        }catch (AuthenticationException e){
            subject.getSession().removeAttribute(SessionConstant.KEY_USER);
            RestMapBO.setErrorRestMap(restMap, "密码错误!");
        }

        restMap.put("data", subject.getSession().getAttribute(SessionConstant.KEY_USER));
        return restMap;
    }


    @RequestMapping("/index/{userId}")
    public String userIndex(@PathVariable("userId") int userId, Model model, HttpSession session){
        Example example = new Example(Article.class);
        example.setOrderByClause("is_stick DESC");
        example.createCriteria().andEqualTo("userId", userId);
        PageInfo<Article> articlePageInfo = pageHelperService.getPageInfoData(
                articleService,
                example,
                0,
                15
        );

        User user = (User) session.getAttribute(SessionConstant.KEY_USER);
        User articleUser = null;
        if (user == null) {
            articleUser = userService.selectOneByUserId(userId, 0);
        } else {
            articleUser = userService.selectOneByUserId(userId, user.getId());
        }

        List<Article> articleHotList = articleService.selectAllHot(userId);
        List<Article> articleRecommendList = articleService.selectAllRecommend(userId);

        Label label = new Label();
        label.setUserId(userId);
        List<Label> labelList = labelService.select(label);

        model.addAttribute("user", user);
        model.addAttribute("articleUser", articleUser);
        model.addAttribute("articleList", articlePageInfo.getList());
        model.addAttribute("total", articlePageInfo.getTotal());
        model.addAttribute("articleHotList", articleHotList);
        model.addAttribute("articleRecommendList", articleRecommendList);
        model.addAttribute("labelList", labelList);

        return "user_index";
    }

    @ResponseBody
    @RequestMapping("/page/data")
    public Map<String, Object> pageData (@RequestBody PageInfoBO articlePageInfoBO){
        Example example = new Example(Article.class);
        example.createCriteria().andEqualTo("userId", articlePageInfoBO.getId());

        String queryTpye = articlePageInfoBO.getQueryType();
        if (StringUtils.equals(queryTpye, "阅读数")) {
            example.setOrderByClause("read_count DESC");
        } else if (StringUtils.equals(queryTpye, "点赞量")) {
            example.setOrderByClause("appluad_count DESC");
        } else if (StringUtils.equals(queryTpye, "发布时间")) {
            example.setOrderByClause("id DESC");
        } else {
            example.setOrderByClause("is_stick DESC");
        }

        PageInfo<Article> articlePageInfo = pageHelperService.getPageInfoData(
                articleService,
                example,
                articlePageInfoBO.getPage(),
                15
        );

        Map<String, Object> restMap = RestMapBO.getRestMap();
        restMap.put("data", articlePageInfo.getList());
        return restMap;
    }

    @RequestMapping("/center")
    public String userCenter(Model model, HttpSession session) {
        User user = (User) session.getAttribute(SessionConstant.KEY_USER);
        model.addAttribute("user", user);
        return "user_center";
    }

    @ResponseBody
    @RequestMapping("/edit/data")
    public Map<String, Object> userEditData (HttpSession session) {
        Map<String, Object> restMap = RestMapBO.getRestMap();
        restMap.put("data", (User) session.getAttribute(SessionConstant.KEY_USER));
        return restMap;
    }

    @ResponseBody
    @RequestMapping("/edit/save")
    public Map<String, Object> userEditSave (@RequestBody User user, HttpSession session) {
        User sessionUser = (User) session.getAttribute(SessionConstant.KEY_USER);
        user.setId(sessionUser.getId());
        userService.updateByPrimaryKeySelective(user);

        // 更新会话数据
        sessionUser.setIntro(user.getIntro());
        sessionUser.setUsername(user.getUsername());
        sessionUser.setEmail(user.getEmail());
        sessionUser.setCellphone(user.getCellphone());
        sessionUser.setSex(user.getSex());
        sessionUser.setIntro(user.getIntro());

        Map<String, Object> restMap = RestMapBO.getRestMap();
        restMap.put("data", user);
        return restMap;
    }
}
