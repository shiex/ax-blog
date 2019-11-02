package com.xbb.blog.dao;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.entity.Article;
import com.xbb.blog.entity.Collect;
import com.xbb.blog.tk.mybatis.TkMapper;

import java.util.List;

public interface CollectMapper extends TkMapper<Collect> {
    List<Collect> selectPageHelperData(PageInfoBO pageInfoBO);

    int selectCountByUserId(int userId);
}