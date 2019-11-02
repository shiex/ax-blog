package com.xbb.blog.dao;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.entity.Label;
import com.xbb.blog.entity.LabelArticle;
import com.xbb.blog.tk.mybatis.TkMapper;

import java.util.List;

public interface LabelArticleMapper extends TkMapper<LabelArticle> {
    List<LabelArticle> selectDataPageHelper(PageInfoBO pageInfoBO);
}