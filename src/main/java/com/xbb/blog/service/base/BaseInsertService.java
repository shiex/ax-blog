package com.xbb.blog.service.base;

import java.util.List;

/**
 * @author shiex-薛
 * @title: BaseInsertService
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\24 002419:33
 */
public interface BaseInsertService<T> {

    int insertSelective(T t);

    int insertList(List<T> tList);

}
