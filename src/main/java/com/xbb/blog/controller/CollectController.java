package com.xbb.blog.controller;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.bo.RestMapBO;
import com.xbb.blog.constant.SessionConstant;
import com.xbb.blog.entity.Article;
import com.xbb.blog.entity.Attention;
import com.xbb.blog.entity.Collect;
import com.xbb.blog.entity.User;
import com.xbb.blog.service.CollectService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author shiex-薛
 * @title: CollectController
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\12 001219:22
 */
@Controller
@RequestMapping("/collect")
public class CollectController {

    @Resource
    private CollectService collectService;

    @ModelAttribute("user")
    public User getSessionUser(HttpSession session) {
        return (User) session.getAttribute(SessionConstant.KEY_USER);
    }

    @RequestMapping("/index")
    public String collectIndex(@ModelAttribute("user") User user, Model model) {
        PageInfoBO pageInfoBO = new PageInfoBO(user.getId(), 0, 15);

        List<Collect> collectList = collectService.selectPageHelperData(pageInfoBO);
        int total = collectService.selectCountByUserId(user.getId());
        model.addAttribute("collectList", collectList);
        model.addAttribute("total", total);
        return "user_collect";
    }

    @ResponseBody
    @RequestMapping("/load/data")
    public Map<String , Object> loadCollectData(@RequestBody PageInfoBO pageInfoBO,
                                                @ModelAttribute("user") User user) {
        pageInfoBO.setId(user.getId());
        List<Collect> collectList = collectService.selectPageHelperData(pageInfoBO);
        Map<String, Object> restMap = RestMapBO.getRestMap();
        restMap.put("data", collectList);
        return restMap;
    }

    /**
     * 是否收藏博客，ID为0：收藏，不为0：取消收藏
     * @param collect
     * @param user
     * @return: java.util.Map<java.lang.String,java.lang.Object>
     */
    @ResponseBody
    @RequestMapping("/isCollect")
    public Map<String, Object> isCollect(@RequestBody Collect collect, @ModelAttribute("user") User user){
        Map<String, Object> restMap = RestMapBO.getRestMap();

        if (collect.getId() == 0) {
            collect.setId(null);
            collect.setUserId(user.getId());
            collectService.insertSelective(collect);
            restMap.put("data", collect.getId());
        } else {
            collectService.deleteByPrimaryKey(collect);
        }

        return restMap;
    }
}
