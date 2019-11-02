package com.xbb.blog.controller;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.bo.RestMapBO;
import com.xbb.blog.constant.SessionConstant;
import com.xbb.blog.entity.*;
import com.xbb.blog.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author shiex-薛
 * @title: ArticleController
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\3 000321:09
 */
@Controller
@RequestMapping("/article")
public class ArticleController {

    @Resource
    private ArticleService articleService;
    @Resource
    private CommentService commentService;
    @Resource
    private LabelService labelService;
    @Resource
    private PageHelperService pageHelperService;
    @Resource
    private ClassifyService classifyService;

    @ModelAttribute("user")
    public User getSessionUser(HttpSession session) {
        return (User) session.getAttribute(SessionConstant.KEY_USER);
    }

    @RequestMapping("/read/{articleId}")
    public String readArcitle(@PathVariable("articleId") Integer articleId,
                              @ModelAttribute("user") User user, Model model){
        Article updateArticle = new Article();
        updateArticle.setId(articleId);
        updateArticle.setReadCount(1);
        articleService.updateCountIncreasing(updateArticle);

        Article article = null;
        if (user == null) {
            article = articleService.selectOneById(articleId, 0);
        } else {
            article = articleService.selectOneById(articleId, user.getId());
        }

        List<Comment> commentList = commentService.selectAllAndReply(articleId);
        List<Article> articleHotList = articleService.selectAllHot(article.getUserId());
        List<Article> articleRecommendList = articleService.selectAllRecommend(article.getUserId());

        Label label = new Label();
        label.setUserId(article.getUser().getId());
        List<Label> labelList = labelService.select(label);

        model.addAttribute("article", article);
        model.addAttribute("commentList", commentList);
        model.addAttribute("articleHotList", articleHotList);
        model.addAttribute("articleRecommendList", articleRecommendList);
        model.addAttribute("labelList", labelList);
        return "article_read";
    }

    @ResponseBody
    @RequestMapping("/save")
    public Map<String , Object> insert(@RequestBody Article article, @ModelAttribute("user") User user){
        if (article.getId() == null) {
            article.setUserId(user.getId());
            article.setIssueTime(new Date());
            articleService.insertSelective(article);
        }

        if (article.getId() != null) {
            articleService.updateByPrimaryKeySelective(article);
        }

        Map<String, Object> restMap = RestMapBO.getRestMap();
        restMap.put("data", "/article/read/" + article.getId());
        return restMap;
    }

    @RequestMapping("/issue.html")
    public String articleIssue(@ModelAttribute("user") User user, Model model) {
        List<Classify> classifyList = classifyService.selectAll();

        if (user != null) {
            Label label = new Label();
            label.setUserId(user.getId());
            List<Label> labelList = labelService.select(label);
            model.addAttribute("labelList", labelList);
        }

        model.addAttribute("classifyList", classifyList);
        model.addAttribute("classifyId", 0);
        model.addAttribute("labelId", 0);
        return "issue";
    }

    @RequestMapping("/{articleId}/edit.html")
    public String articleEdit(@PathVariable("articleId") int articleId,
                              @ModelAttribute("user") User user, Model model) {
        Article selectArticle = new Article();
        selectArticle.setId(articleId);
        Article article = articleService.selectOne(selectArticle);

        Label label = new Label();
        label.setUserId(user.getId());
        List<Label> labelList = labelService.select(label);

        List<Classify> classifyList = classifyService.selectAll();

        model.addAttribute("classifyList", classifyList);
        model.addAttribute("labelList", labelList);
        model.addAttribute("article", article);
        model.addAttribute("classifyId", article.getClassifyId());
        model.addAttribute("labelId", article.getLabel().getId() == null?0:article.getLabel().getId());
        return "issue";
    }

    @RequestMapping("/manage")
    public String userArticleManage (@ModelAttribute("user") User user, Model model) {
        PageInfoBO pageInfoBO = new PageInfoBO(user.getId(), 0, 15);
        PageInfoBO<Article> articlePageInfoBO = articleService.selectPageHelper(pageInfoBO);
        Label label = new Label();
        label.setUserId(user.getId());
        List<Label> labelList = labelService.select(label);

        model.addAttribute("articleList", articlePageInfoBO.getList());
        model.addAttribute("total", articlePageInfoBO.getTotal());
        model.addAttribute("labelList", labelList);
        return "user_article";
    }

    @ResponseBody
    @RequestMapping("/manage/load/data")
    public Map<String, Object> articleManageLoadData(@RequestBody PageInfoBO pageInfoBO, @ModelAttribute("user") User user) {
        Map<String, Object> restMap = RestMapBO.getRestMap();
        pageInfoBO.setId(user.getId());
        restMap.put("data", articleService.selectDataPageHelper2(pageInfoBO));
        return restMap;
    }

    @ResponseBody
    @RequestMapping("/manage/status/update")
    public Map<String, Object> articleManageIsRecommend(@RequestBody Article article) {
        articleService.updateStatus(article);
        return RestMapBO.getRestMap();
    }

    @ResponseBody
    @RequestMapping("/manage/delete")
    public Map<String, Object> articleManageDelete(@RequestBody Article article) {
        articleService.deleteByPrimaryKey(article);
        return RestMapBO.getRestMap();
    }

    @ResponseBody
    @RequestMapping("/label/add")
    public Map<String , Object> addArticleLabel(@RequestBody Article article) {
        articleService.updateStatus(article);
        return RestMapBO.getRestMap();
    }
}
