package com.xbb.blog.service;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.entity.Article;
import com.xbb.blog.service.base.BaseCrudService;

import java.util.List;

/**
 * @author shiex-薛
 * @title: ArticleService
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\3 000321:18
 */
public interface ArticleService extends BaseCrudService<Article> {

    Article selectOneById(int articleId, int userId);

    List<Article> selectAllHot(int userId);

    List<Article> selectAllRecommend(int userId);

    List<Article> selectAllIndexHot(int count);

    List<Article> selectDataPageHelper2(PageInfoBO pageInfoBO);

    PageInfoBO<Article> selectPageHelper(PageInfoBO pageInfoBO);

    int updateCountIncreasing(Article article);

    int updateCountDegression(Article article);

    int updateStatus(Article article);
}
