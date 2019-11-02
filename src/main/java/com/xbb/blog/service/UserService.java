package com.xbb.blog.service;

import com.xbb.blog.entity.User;
import com.xbb.blog.service.base.BaseCrudService;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * @author shiex-薛
 * @title: UserService
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\4 000414:51
 */
public interface UserService extends BaseCrudService<User> {

    int updateCountIncreasing(User user);

    int updateCountDegression(User user);

    User selectOneByUserId(int userId, int userId2);

}
