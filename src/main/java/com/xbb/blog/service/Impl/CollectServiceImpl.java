package com.xbb.blog.service.Impl;

import com.github.pagehelper.PageInfo;
import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.dao.CollectMapper;
import com.xbb.blog.entity.Article;
import com.xbb.blog.entity.Collect;
import com.xbb.blog.service.CollectService;
import com.xbb.blog.service.base.BaseSelectService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author shiex-薛
 * @title: CollectServiceImpl
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\10 001021:52
 */
@Service("collectService")
public class CollectServiceImpl implements CollectService {

    @Resource
    private CollectMapper collectMapper;

    @Override
    public int insertSelective(Collect collect) {
        return collectMapper.insertSelective(collect);
    }

    @Override
    public int insertList(List<Collect> collects) {
        return 0;
    }

    @Override
    public int deleteByPrimaryKey(Collect collect) {
        return collectMapper.deleteByPrimaryKey(collect.getId());
    }

    @Override
    public List<Collect> selectPageHelperData(PageInfoBO pageInfoBO) {
        return collectMapper.selectPageHelperData(pageInfoBO);
    }

    @Override
    public int selectCountByUserId(int userId) {
        return collectMapper.selectCountByUserId(userId);
    }

    @Override
    public PageInfoBO<Collect> selectPageHelper(PageInfoBO pageInfoBO) {
        List<Collect> collectList = this.selectPageHelperData(pageInfoBO);
        int total = this.selectCountByUserId(pageInfoBO.getId());
        pageInfoBO.setList(collectList);
        pageInfoBO.setTotal(total);
        return pageInfoBO;
    }

}
