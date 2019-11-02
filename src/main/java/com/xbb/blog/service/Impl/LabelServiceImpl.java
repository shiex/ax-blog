package com.xbb.blog.service.Impl;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.dao.LabelMapper;
import com.xbb.blog.entity.Label;
import com.xbb.blog.entity.LabelArticle;
import com.xbb.blog.service.LabelArticleService;
import com.xbb.blog.service.LabelService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author shiex-薛
 * @title: LabelServiceImpl
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\3 000323:26
 */
@Service("labelService")
public class LabelServiceImpl implements LabelService {

    @Resource
    private LabelMapper labelMapper;
    @Resource
    private LabelArticleService labelArticleService;

    @Override
    public int insertSelective(Label label) {
        return labelMapper.insertSelective(label);
    }

    @Override
    public int insertList(List<Label> labels) {
        return labelMapper.insertList(labels);
    }

    @Override
    public List<Label> select(Label label) {
        return labelMapper.select(label);
    }

    @Override
    public List<Label> selectAll() {
        return labelMapper.selectAll();
    }

    @Override
    public int deleteByPrimaryKey(Label label) {
        return labelMapper.deleteByPrimaryKey(label.getId());
    }

    @Override
    public Label selectOne(Label label) {
        return labelMapper.selectOne(label);
    }

    @Override
    public int selectCount(Label label) {
        return labelMapper.selectCount(label);
    }

    @Override
    public Label selectByPrimaryKey(Label label) {
        return labelMapper.selectByPrimaryKey(label);
    }

    @Override
    public List<Label> selectByExample(Example example) {
        return labelMapper.selectByExample(example);
    }

    @Override
    public List<Label> selectDataPageHelper(PageInfoBO pageInfoBO) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Label label) {
        return labelMapper.updateByPrimaryKeySelective(label);
    }
}
