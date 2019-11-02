package com.xbb.blog.controller;

import com.xbb.blog.AxBlogApplicationTests;
import com.xbb.blog.entity.Article;
import com.xbb.blog.service.ArticleService;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import static org.junit.Assert.*;

/**
 * @author shiex-薛
 * @title: ClassifyControllerTest
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\22 002219:02
 */
public class ClassifyControllerTest extends AxBlogApplicationTests {

    @Resource
    private ArticleService articleService;

    @Test
    public void index() {
        // 测试数据
        Random random = new Random();
        List<Article> articleList = new ArrayList<>();
        Article article = null;
        for (int i=0; i<500; i++) {
            int classifyId = random.nextInt(4) + 1;
            article = new Article();
            article.setUserId(1);
            article.setAppluadCount(i);
            article.setCommentCount(i);
            article.setReadCount(i);
            article.setTitle("测试标题 --- " + i);
            article.setContent("测试内容 --- " + i);
            article.setIssueTime(new Date());
            article.setClassifyId((short)classifyId);
            article.setSynopsis("测试摘要 --- " + i);
            article.setOriginal(true);
            article.setRecommend(false);
            article.setStick(false);
            articleList.add(article);
        }
        articleService.insertList(articleList);
    }

    @Test
    public void indexInitData() {
    }

    @Test
    public void loadArticlePageData() {
    }

    @Test
    public void issueInitData() {
    }
}