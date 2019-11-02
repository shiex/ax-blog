package com.xbb.blog.service;

import com.github.pagehelper.PageInfo;
import com.xbb.blog.service.base.BaseSelectService;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
import java.util.Map;

/**
 * @author shiex-薛
 * @title: PageInfoService
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\25 00250:22
 */
public interface PageHelperService<T> {

    PageInfo<T> getPageInfoData(BaseSelectService baseSelectService, Example example, int page, int limit);

    Map<String, Object> getPageInfoRestMap(BaseSelectService baseSelectService, Example example, int page, int limit);

}
