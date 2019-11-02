package com.xbb.blog.service.Impl;

import com.xbb.blog.dao.ReplyMapper;
import com.xbb.blog.entity.Reply;
import com.xbb.blog.service.CommentService;
import com.xbb.blog.service.ReplyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author shiex-薛
 * @title: ReplyServiceImpl
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\5 000518:56
 */
@Service("replyService")
public class ReplyServiceImpl implements ReplyService {

    @Resource
    private ReplyMapper replyMapper;
    @Resource
    private CommentService commentService;

    @Override
    public int insertSelective(Reply reply) {
        int count = replyMapper.insertSelective(reply);
        commentService.updateReplyCountIncreasing(reply.getCommentId());
        return count;
    }
}
