package com.xbb.blog.service;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.entity.Label;
import com.xbb.blog.entity.LabelArticle;
import com.xbb.blog.service.base.BaseDeleteService;
import com.xbb.blog.service.base.BaseInsertService;
import com.xbb.blog.service.base.BaseUpdateService;

import java.util.List;

/**
 * @author shiex-薛
 * @title: LabelArticleService
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\16 001621:35
 */
public interface LabelArticleService extends
        BaseInsertService<LabelArticle>,
        BaseUpdateService<LabelArticle>,
        BaseDeleteService<LabelArticle> {

    PageInfoBO<LabelArticle> selectPageHelper(PageInfoBO pageInfoBO);


    Integer selectCount(LabelArticle labelArticle);

    List<LabelArticle> selectDataPageHelper(PageInfoBO pageInfoBO);

}
