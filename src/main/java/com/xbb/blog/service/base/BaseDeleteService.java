package com.xbb.blog.service.base;

/**
 * @author shiex-薛
 * @title: BaseDeleteService
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\24 002419:33
 */
public interface BaseDeleteService<T> {

    int deleteByPrimaryKey(T t);

}
