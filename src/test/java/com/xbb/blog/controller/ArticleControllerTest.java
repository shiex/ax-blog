package com.xbb.blog.controller;

import com.xbb.blog.AxBlogApplicationTests;
import com.xbb.blog.entity.Article;
import com.xbb.blog.entity.Comment;
import com.xbb.blog.entity.Label;
import com.xbb.blog.entity.Reply;
import com.xbb.blog.service.ArticleService;
import com.xbb.blog.service.CommentService;
import com.xbb.blog.service.LabelService;
import org.junit.Test;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @author shiex-薛
 * @title: ArticleControllerTest
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\3 000320:49
 */
public class ArticleControllerTest extends AxBlogApplicationTests {

    @Resource
    private ArticleService articleService;
    @Resource
    private CommentService commentService;
    @Resource
    private LabelService labelService;

    @Test
    public void readArcitle() {
        //Article article = articleService.selectOneById(111);
        //List<Comment> commentList = commentService.selectAllAndReply(111);
        //List<Article> articleHotList = articleService.selectAllHot(article.getUserId(), 10);
        //List<Article> articleRecommendList = articleService.selectAllRecommend(article.getUserId());
        Label selectLabel = new Label();
        selectLabel.setUserId(1);
        List<Label> labelList = labelService.select(selectLabel);
        for (Label label : labelList) {
            System.out.println(label.toString());
        }
    }

    @Test
    public void add() {

    }
}