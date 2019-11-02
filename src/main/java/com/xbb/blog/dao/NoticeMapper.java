package com.xbb.blog.dao;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.entity.Leave;
import com.xbb.blog.entity.Notice;
import com.xbb.blog.tk.mybatis.TkMapper;

import java.util.List;

/**
 * @author shiex-薛
 * @title: NoticeMapper
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\28 002816:43
 */
public interface NoticeMapper extends TkMapper<Notice> {
    List<Notice> selectDataPageHelper(PageInfoBO pageInfoBO);
}
