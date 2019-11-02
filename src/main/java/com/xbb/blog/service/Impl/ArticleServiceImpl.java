package com.xbb.blog.service.Impl;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.dao.ArticleMapper;
import com.xbb.blog.entity.Article;
import com.xbb.blog.entity.LabelArticle;
import com.xbb.blog.service.ArticleService;
import com.xbb.blog.service.LabelArticleService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author shiex-薛
 * @title: ArticleServiceImpl
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\3 000321:18
 */
@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

    @Resource
    private ArticleMapper articleMapper;
    @Resource
    private LabelArticleService labelArticleService;

    @Override
    public int insertSelective(Article article) {
        int count = articleMapper.insertSelective(article);
        if (article.getLabel().getId() != null) {
            LabelArticle labelArticle = new LabelArticle();
            labelArticle.setArticleId(article.getId());
            labelArticle.setLabelId(article.getLabel().getId());
            labelArticleService.insertSelective(labelArticle);
        }
        return count;
    }

    @Override
    public int insertList(List<Article> articles) {
        return articleMapper.insertList(articles);
    }

    @Override
    public int updateByPrimaryKeySelective(Article article) {
        LabelArticle labelArticle = new LabelArticle();
        labelArticle.setArticleId(article.getId());
        labelArticle.setLabelId(article.getLabel().getId());
        labelArticleService.deleteByPrimaryKey(labelArticle);

        if (article.getLabel().getId() != null) {
            labelArticleService.insertSelective(labelArticle);
        }

        return articleMapper.updateByPrimaryKeySelective(article);
    }

    @Override
    public List<Article> selectByExample(Example example) {
        return articleMapper.selectByExample(example);
    }

    @Override
    public int updateCountIncreasing(Article article) {
        return articleMapper.updateCountIncreasing(article);
    }

    @Override
    public int updateCountDegression(Article article) {
        return articleMapper.updateCountDegression(article);
    }

    @Override
    public int updateStatus(Article article) {
        return articleMapper.updateStatus(article);
    }

    @Override
    public int deleteByPrimaryKey(Article article) {
        return articleMapper.deleteByPrimaryKey(article);
    }

    @Override
    public Article selectOne(Article article) {
        return articleMapper.selectOne(article);
    }

    @Override
    public Article selectByPrimaryKey(Article article) {
        return articleMapper.selectByPrimaryKey(article.getId());
    }

    @Override
    public Article selectOneById(int articleId, int userId) {
        return articleMapper.selectOneById(articleId, userId);
    }

    @Override
    public List<Article> selectAllIndexHot(int count) {
        return articleMapper.selectAllIndexHot(count);
    }

    @Override
    public List<Article> select(Article article) {
        return articleMapper.select(article);
    }

    @Override
    public List<Article> selectAll() {
        return articleMapper.selectAll();
    }

    @Override
    public List<Article> selectDataPageHelper(PageInfoBO pageInfoBO) {
        return articleMapper.selectDataPageHelper(pageInfoBO);
    }

    @Override
    public List<Article> selectDataPageHelper2(PageInfoBO pageInfoBO) {
        return articleMapper.selectDataPageHelper2(pageInfoBO);
    }

    @Override
    public PageInfoBO<Article> selectPageHelper(PageInfoBO pageInfoBO) {
        PageInfoBO<Article> articlePageInfoBO = new PageInfoBO<>();
        articlePageInfoBO.setList(this.selectDataPageHelper2(pageInfoBO));
        Article article = new Article();
        article.setUserId(pageInfoBO.getId());
        articlePageInfoBO.setTotal(this.selectCount(article));

        return articlePageInfoBO;
    }

    @Override
    public List<Article> selectAllHot(int userId) {
        return articleMapper.selectAllHot(userId);
    }

    @Override
    public List<Article> selectAllRecommend(int userId) {
        return articleMapper.selectAllRecommend(userId);
    }

    @Override
    public int selectCount(Article article) {
        return articleMapper.selectCount(article);
    }

}
