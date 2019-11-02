package com.xbb.blog.controller;

import com.xbb.blog.bo.RestMapBO;
import com.xbb.blog.constant.SessionConstant;
import com.xbb.blog.entity.Reply;
import com.xbb.blog.entity.User;
import com.xbb.blog.service.ReplyService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Map;

/**
 * @author shiex-薛
 * @title: ReplyController
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\5 000518:55
 */
@RestController
@RequestMapping("/reply")
public class ReplyController {

    @Resource
    private ReplyService replyService;

    @RequestMapping("/add")
    public Map<String, Object> insertReply(@RequestBody Reply reply, HttpSession session){
        User user = (User) session.getAttribute(SessionConstant.KEY_USER);
        reply.setUserId(user.getId());
        reply.setReplyTime(new Date());
        replyService.insertSelective(reply);

        Map<String, Object> restMap = RestMapBO.getRestMap();
        reply.setUser(user);
        restMap.put("data", reply);
        return restMap;
    }
}
