package com.xbb.blog.service.base;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.entity.Article;
import com.xbb.blog.entity.User;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author shiex-薛
 * @title: CrudService
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\3 000321:20
 */
public interface BaseSelectService<T> {

    int selectCount(T t);

    T selectByPrimaryKey(T t);

    T selectOne(T t);

    List<T> select(T t);

    List<T> selectAll();

    List<T> selectByExample(Example example);

    List<T> selectDataPageHelper(PageInfoBO pageInfoBO);

}
