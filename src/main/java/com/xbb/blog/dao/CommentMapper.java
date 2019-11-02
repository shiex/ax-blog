package com.xbb.blog.dao;

import com.xbb.blog.entity.Comment;
import com.xbb.blog.tk.mybatis.TkMapper;

import java.util.List;

public interface CommentMapper extends TkMapper<Comment> {

    /**
     * 按博客ID查询所有评论以及回复
     * @param articleId
     * @return: java.util.List<com.xbb.blog.entity.Comment>
     */
    List<Comment> selectAllAndReply(Integer articleId);

    /**
     * 回复数量递增
     * @param commentId
     * @return: int
     */
    int updateReplyCountIncreasing(int commentId);
}