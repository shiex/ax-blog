package com.xbb.blog.service.base;

/**
 * @author shiex-薛
 * @title: BaseCrudService
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\24 002419:37
 */
public interface BaseCrudService<T> extends
        BaseInsertService<T>,
        BaseDeleteService<T>,
        BaseUpdateService<T>,
        BaseSelectService<T> {
}
