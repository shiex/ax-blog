package com.xbb.blog.controller;

import com.xbb.blog.bo.RestMapBO;
import com.xbb.blog.constant.SessionConstant;
import com.xbb.blog.dao.CommentMapper;
import com.xbb.blog.entity.Comment;
import com.xbb.blog.entity.User;
import com.xbb.blog.service.CommentService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Map;

/**
 * @author shiex-薛
 * @title: CommentController
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\4 000422:08
 */
@RestController
@RequestMapping("/comment")
public class CommentController {

    @Resource
    private CommentService commentService;

    @RequestMapping("/add")
    public Map<String, Object> addComment(@RequestBody Comment comment, HttpSession session){
        User user = (User) session.getAttribute(SessionConstant.KEY_USER);
        comment.setUserId(user.getId());
        comment.setCommentTime(new Date());
        commentService.insertSelective(comment);

        Map<String, Object> restMap = RestMapBO.getRestMap();
        comment.setUser(user);
        restMap.put("data", comment);
        return restMap;
    }
}
