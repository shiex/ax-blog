package com.xbb.blog.service;

import com.xbb.blog.entity.Comment;
import com.xbb.blog.service.base.BaseCrudService;
import com.xbb.blog.service.base.BaseDeleteService;
import com.xbb.blog.service.base.BaseInsertService;

import java.util.List;

/**
 * @author shiex-薛
 * @title: CommentService
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\3 000320:33
 */
public interface CommentService extends BaseInsertService<Comment>, BaseDeleteService<Comment> {
    List<Comment> selectAllAndReply(Integer articleId);

    int updateReplyCountIncreasing(int commentId);
}
