package com.xbb.blog.service;

import com.xbb.blog.entity.Reply;

/**
 * @author shiex-薛
 * @title: ReplyService
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\5 000518:56
 */
public interface ReplyService {
    int insertSelective(Reply reply);
}
