package com.xbb.blog.controller;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.bo.RestMapBO;
import com.xbb.blog.constant.SessionConstant;
import com.xbb.blog.entity.Article;
import com.xbb.blog.entity.Classify;
import com.xbb.blog.entity.User;
import com.xbb.blog.service.ArticleService;
import com.xbb.blog.service.ClassifyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author shiex-薛
 * @title: ClassifyController
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\14 001423:06
 */
@Controller
public class ClassifyController {
    @Resource
    private ClassifyService classifyService;
    @Resource
    private ArticleService articleService;

    @RequestMapping("/")
    public String index(HttpSession session, Model model) {
        User user = (User) session.getAttribute(SessionConstant.KEY_USER);
        PageInfoBO articlePageInfoBO = new PageInfoBO(0, 0, 30);
        List<Article> articleList = articleService.selectDataPageHelper(articlePageInfoBO);
        List<Classify> classifyList = classifyService.selectAll();
        List<Article> articleHotList = articleService.selectAllIndexHot(15);
        model.addAttribute("user", user);
        model.addAttribute("articleList", articleList);
        model.addAttribute("classifyList", classifyList);
        model.addAttribute("articleHotList", articleHotList);

        return "index";
    }

    @ResponseBody
    @RequestMapping("/index/load/data")
    public Map<String, Object> indexInitData(@RequestBody Integer classifyId) {
        Map<String, Object> data = new HashMap<>();

        PageInfoBO articlePageInfoBO = new PageInfoBO(classifyId, 0, 30);
        List<Article> articleList = articleService.selectDataPageHelper(articlePageInfoBO);
        data.put("articleList", articleList);
        data.put("classifyId", classifyId);

        for (Article article : articleList) {
            article.getClassify().setName(null);
        }

        Map<String, Object> restMap = RestMapBO.getRestMap();
        restMap.put("data", data);
        return restMap;
    }

    @ResponseBody
    @RequestMapping("/classify/article/load/data")
    public Map<String, Object> loadArticlePageData(@RequestBody PageInfoBO articlePageInfoBO) {
        int page = articlePageInfoBO.getPage() + 1;
        articlePageInfoBO.setPage(articlePageInfoBO.getPage() * 30);
        articlePageInfoBO.setLimit(30);
        List<Article> articleList = articleService.selectDataPageHelper(articlePageInfoBO);

        if (articlePageInfoBO.getId() != 0) {
            for (Article article : articleList) {
                article.getClassify().setName(null);
            }
        }

        Map<String, Object> data = new HashMap<>();
        data.put("articleList", articleList);
        data.put("page", page);

        Map<String, Object> restMap = RestMapBO.getRestMap();
        restMap.put("data", data);
        return restMap;
    }

    @ResponseBody
    @RequestMapping("/classify/issue/init/data")
    public Map<String, Object> issueInitData() {
        List<Classify> classifyList = classifyService.selectAll();
        Map<String, Object> restMap = RestMapBO.getRestMap();
        restMap.put("data", classifyList);
        return restMap;
    }
}
