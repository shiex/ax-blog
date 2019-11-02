package com.xbb.blog.service.base;

/**
 * @author shiex-薛
 * @title: BaseUpdateService
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\24 002419:33
 */
public interface BaseUpdateService<T> {

    int updateByPrimaryKeySelective(T t);

}
