package com.xbb.blog.service.Impl;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.dao.ClassifyMapper;
import com.xbb.blog.entity.Classify;
import com.xbb.blog.service.ClassifyService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author shiex-薛
 * @title: ClassifyServiceImpl
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\24 002420:10
 */
@Service("classifyService")
public class ClassifyServiceImpl implements ClassifyService {

    @Resource
    private ClassifyMapper classifyMapper;

    @Override
    public int insertSelective(Classify classify) {
        return classifyMapper.insertSelective(classify);
    }

    @Override
    public int insertList(List<Classify> classifies) {
        return classifyMapper.insertList(classifies);
    }

    @Override
    public int updateByPrimaryKeySelective(Classify classify) {
        return classifyMapper.updateByPrimaryKeySelective(classify);
    }

    @Override
    public int deleteByPrimaryKey(Classify classify) {
        return classifyMapper.deleteByPrimaryKey(classify.getId());
    }

    @Override
    public Classify selectByPrimaryKey(Classify classify) {
        return classifyMapper.selectByPrimaryKey(classify.getId());
    }

    @Override
    public Classify selectOne(Classify classify) {
        return classifyMapper.selectOne(classify);
    }

    @Override
    public List<Classify> select(Classify classify) {
        return classifyMapper.select(classify);
    }

    @Override
    public List<Classify> selectAll() {
        return classifyMapper.selectAll();
    }

    @Override
    public List<Classify> selectByExample(Example example) {
        return classifyMapper.selectByExample(example);
    }

    @Override
    public int selectCount(Classify classify) {
        return classifyMapper.selectCount(classify);
    }

    @Override
    public List<Classify> selectDataPageHelper(PageInfoBO pageInfoBO) {
        return null;
    }
}
