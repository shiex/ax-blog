package com.xbb.blog.service;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.entity.Article;
import com.xbb.blog.entity.Collect;
import com.xbb.blog.service.base.BaseCrudService;
import com.xbb.blog.service.base.BaseDeleteService;
import com.xbb.blog.service.base.BaseInsertService;

import java.util.List;

/**
 * @author shiex-薛
 * @title: CollectService
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\10 001021:51
 */
public interface CollectService extends BaseInsertService<Collect>, BaseDeleteService<Collect> {

    List<Collect> selectPageHelperData(PageInfoBO pageInfoBO);

    int selectCountByUserId(int userId);

    PageInfoBO<Collect> selectPageHelper(PageInfoBO pageInfoBO);
}
