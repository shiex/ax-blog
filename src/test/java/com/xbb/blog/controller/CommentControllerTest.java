package com.xbb.blog.controller;

import com.xbb.blog.AxBlogApplicationTests;
import com.xbb.blog.dao.CommentMapper;
import com.xbb.blog.entity.Comment;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.Date;

import static org.junit.Assert.*;

/**
 * @author shiex-薛
 * @title: CommentControllerTest
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\27 002719:52
 */
public class CommentControllerTest extends AxBlogApplicationTests {

    @Resource
    CommentMapper commentMapper;

    @Test
    public void addComment() {
        Comment comment = new Comment();
        comment.setCommentTime(new Date());
        comment.setUserId(4);
        comment.setArticleId(501);
        comment.setContent("#21321321");
        commentMapper.insert(comment);
        //commentMapper.insertSelective(comment);
    }
}