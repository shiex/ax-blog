package com.xbb.blog.service.Impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xbb.blog.bo.RestMapBO;
import com.xbb.blog.service.PageHelperService;
import com.xbb.blog.service.base.BaseSelectService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Map;

/**
 * @author shiex-薛
 * @title: PageInfoServiceImpl
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\25 00250:19
 */
@Service("pageHelperService")
public class PageHelperImpl<T> implements PageHelperService<T> {

    @Override
    public PageInfo<T> getPageInfoData(BaseSelectService baseSelectService, Example example,
                                       int page, int limit) {
        PageHelper.startPage(page, limit);
        PageInfo<T> pageInfo = new PageInfo<>(baseSelectService.selectByExample(example));
        return pageInfo;
    }

    @Override
    public Map<String, Object> getPageInfoRestMap(BaseSelectService baseSelectService, Example example,
                                                  int page, int limit) {
        PageInfo<T> pageInfoData = getPageInfoData(baseSelectService, example, page, limit);
        Map<String, Object> restMap = RestMapBO.getRestMap();
        restMap.put("code", 0);
        restMap.put("count", pageInfoData.getTotal());
        restMap.put("data", pageInfoData.getList());
        return restMap;
    }

}
