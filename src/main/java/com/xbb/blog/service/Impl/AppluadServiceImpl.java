package com.xbb.blog.service.Impl;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.dao.AppluadMapper;
import com.xbb.blog.entity.Appluad;
import com.xbb.blog.entity.Article;
import com.xbb.blog.service.AppluadService;
import com.xbb.blog.service.ArticleService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author shiex-薛
 * @title: AppluadServiceImpl
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\7 000720:33
 */
@Service("appluadService")
public class AppluadServiceImpl implements AppluadService {

    @Resource
    private AppluadMapper appluadMapper;
    @Resource
    private ArticleService articleService;

    @Override
    public int insertSelective(Appluad appluad) {
        int count = appluadMapper.insertSelective(appluad);
        articleService.updateCountIncreasing(getArticle(appluad.getArticleId()));
        return count;
    }

    @Override
    public int insertList(List<Appluad> appluads) {
        return 0;
    }

    @Override
    public int deleteByPrimaryKey(Appluad appluad) {
        int count = appluadMapper.deleteByPrimaryKey(appluad.getId());
        articleService.updateCountDegression(getArticle(appluad.getArticleId()));
        return count;
    }

    private Article getArticle(int articleId) {
        Article article = new Article();
        article.setId(articleId);
        article.setAppluadCount(1);
        return article;
    }
}
