package com.xbb.blog.service.Impl;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.dao.LabelArticleMapper;
import com.xbb.blog.entity.Label;
import com.xbb.blog.entity.LabelArticle;
import com.xbb.blog.service.LabelArticleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author shiex-薛
 * @title: LabelArticleServiceImpl
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\16 001621:38
 */
@Service("labelArticleService")
public class LabelArticleServiceImpl implements LabelArticleService {

    @Resource
    private LabelArticleMapper labelArticleMapper;

    @Override
    public int deleteByPrimaryKey(LabelArticle labelArticle) {
        return labelArticleMapper.deleteByPrimaryKey(labelArticle);
    }

    @Override
    public int insertSelective(LabelArticle labelArticle) {
        return labelArticleMapper.insertSelective(labelArticle);
    }

    @Override
    public int insertList(List<LabelArticle> labelArticles) {
        return labelArticleMapper.insertList(labelArticles);
    }

    @Override
    public int updateByPrimaryKeySelective(LabelArticle labelArticle) {
        return labelArticleMapper.updateByPrimaryKeySelective(labelArticle);
    }

    @Override
    public PageInfoBO<LabelArticle> selectPageHelper(PageInfoBO pageInfoBO) {
        PageInfoBO<LabelArticle> labelPageInfoBO = new PageInfoBO<>();

        LabelArticle labelArticle = new LabelArticle();
        labelArticle.setLabelId(pageInfoBO.getId());
        labelPageInfoBO.setTotal(this.selectCount(labelArticle));
        labelPageInfoBO.setList(this.selectDataPageHelper(pageInfoBO));

        return labelPageInfoBO;
    }

    @Override
    public List<LabelArticle> selectDataPageHelper(PageInfoBO pageInfoBO) {
        return labelArticleMapper.selectDataPageHelper(pageInfoBO);
    }

    @Override
    public Integer selectCount(LabelArticle labelArticle) {
        return labelArticleMapper.selectCount(labelArticle);
    }


}
