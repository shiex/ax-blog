package com.xbb.blog.controller;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.bo.RestMapBO;
import com.xbb.blog.constant.SessionConstant;
import com.xbb.blog.entity.Article;
import com.xbb.blog.entity.Label;
import com.xbb.blog.entity.LabelArticle;
import com.xbb.blog.entity.User;
import com.xbb.blog.service.ArticleService;
import com.xbb.blog.service.LabelArticleService;
import com.xbb.blog.service.LabelService;
import com.xbb.blog.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @author shiex-薛
 * @title: LabelController
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\16 001621:24
 */
@Controller
@RequestMapping("/label")
public class LabelController {

    @Resource
    private LabelService labelService;
    @Resource
    private LabelArticleService labelArticleService;
    @Resource
    private ArticleService articleService;
    @Resource
    private UserService userService;

    @ModelAttribute("user")
    public User getSessionUser(HttpSession session) {
        return (User) session.getAttribute(SessionConstant.KEY_USER);
    }

    @RequestMapping("/index")
    public String lableIndex(@ModelAttribute("user") User user, Model model) {
        Label label = new Label();
        label.setUserId(user.getId());
        List<Label> labelList = labelService.select(label);
        model.addAttribute("labelList", labelList);
        return "user_label";
    }

    @RequestMapping("/list")
    public String labelList(@RequestParam("labelId") int labelId, @RequestParam("labelName") String labelName,
                            @ModelAttribute("user") User user, Model model) {
        PageInfoBO pageInfoBO = new PageInfoBO(labelId, 0, 20);
        PageInfoBO<LabelArticle> labelPageInfoBO = labelArticleService.selectPageHelper(pageInfoBO);

        if (labelPageInfoBO.getList().size() > 0) {
            // 判断当前用户是否为博主身份，博主身份具备操作权限
            int articleUserId = labelPageInfoBO.getList().get(0).getArticle().getUserId();
            if (user.getId() == articleUserId) {
                model.addAttribute("isUser", true);
            } else {
                User articleUser = userService.selectOneByUserId(articleUserId, user.getId());
                model.addAttribute("articleUser", articleUser);
            }
        }

        List<Article> articleHotList = articleService.selectAllHot(user.getId());
        List<Article> articleRecommendList = articleService.selectAllRecommend(user.getId());

        Label label = new Label();
        label.setUserId(1);
        List<Label> labelList = labelService.select(label);

        model.addAttribute("user", user);
        model.addAttribute("articleHotList", articleHotList);
        model.addAttribute("articleRecommendList", articleRecommendList);
        model.addAttribute("labelList", labelList);
        model.addAttribute("labelArticleList", labelPageInfoBO.getList());
        model.addAttribute("total", labelPageInfoBO.getTotal());
        model.addAttribute("labelId", labelId);
        model.addAttribute("labelName", labelName);
        return "label_list";
    }

    @ResponseBody
    @RequestMapping("/article/load/data")
    public Map<String, Object> labelArticleLoadData(@RequestBody PageInfoBO pageInfoBO) {
        Map<String, Object> restMap = RestMapBO.getRestMap();
        restMap.put("data", labelArticleService.selectDataPageHelper(pageInfoBO));
        return restMap;
    }

    @ResponseBody
    @RequestMapping("/save")
    public Map<String, Object> saveLabel(@RequestBody Label label, @ModelAttribute("user") User user) {
        if (label.getId() == null) {
            label.setUserId(user.getId());
            labelService.insertSelective(label);
        }
        if (label.getId() != null) {
            labelService.updateByPrimaryKeySelective(label);
        }
        Map<String, Object> restMap = RestMapBO.getRestMap();
        restMap.put("data", label);
        return restMap;
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Map<String, Object> deleteLabelAericle(@RequestBody Label label) {
        labelService.deleteByPrimaryKey(label);
        return RestMapBO.getRestMap();
    }


    @ResponseBody
    @RequestMapping("/article/save")
    public Map<String, Object> addLabelAericle(@RequestBody LabelArticle labelArticle) {

        if (labelArticle.getId() == null) {
            labelArticleService.insertSelective(labelArticle);
        }
        if (labelArticle.getId() != null) {
            labelArticleService.updateByPrimaryKeySelective(labelArticle);
        }

        Label selectLabel = new Label();
        selectLabel.setId(labelArticle.getLabelId());
        Label label = labelService.selectByPrimaryKey(selectLabel);

        Map<String, Object> restMap = RestMapBO.getRestMap();
        restMap.put("data", label);
        return restMap;
    }

    @ResponseBody
    @RequestMapping("/article/delete")
    public Map<String, Object> deleteLabelAericle(@RequestBody LabelArticle labelArticle) {
        labelArticleService.deleteByPrimaryKey(labelArticle);
        return RestMapBO.getRestMap();
    }
}
