package com.xbb.blog.controller;

import com.xbb.blog.AxBlogApplicationTests;
import com.xbb.blog.entity.Article;
import com.xbb.blog.entity.Classify;
import com.xbb.blog.entity.User;
import com.xbb.blog.service.ArticleService;
import com.xbb.blog.service.ClassifyService;
import com.xbb.blog.service.UserService;
import org.junit.Test;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * @author shiex-薛
 * @title: IndexControllerTest
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\1 000111:50
 */
public class IndexControllerTest extends AxBlogApplicationTests {

    @Resource
    private ClassifyService classifyService;
    @Resource
    private ArticleService articleService;
    @Resource
    private UserService userService;

    @Test
    public void index() {
        List<Classify> classifyList = new ArrayList<>();
        List<User> userList = new ArrayList<>();
        Classify classify = null;
        User user = null;
        for (int i=1; i<=5; i++) {
            classify = new Classify();
            classify.setName("分类" + i);
            classifyList.add(classify);

            user = new User();
            user.setUsername("用户" + i);
            userList.add(user);
            userService.insertSelective(user);
        }

        Random random = new Random();
        List<Article> articleList = new ArrayList<>();
        Article article = null;
        for (int i=50; i<350; i++) {
            int n = random.nextInt(4) + 1;
            article = new Article();
            article.setTitle("博客标题" + i);
            article.setClassifyId((short)n);
            article.setContent("这里是文章的内容：" + i);
            article.setUserId(n);
            article.setIssueTime(new Date());
            article.setAppluadCount(i);
            article.setReadCount(i);
            article.setCommentCount(i);
            article.setOriginal(true);
            article.setSynopsis("摘要" + i);
            article.setStick(true);
            articleList.add(article);
        }

        //userService.insertList(userList);
        classifyService.insertList(classifyList);
        articleService.insertList(articleList);
    }

    @Test
    public void indexInitData() {

    }
}