package com.xbb.blog.service;

import com.xbb.blog.entity.Role;
import com.xbb.blog.entity.User;
import com.xbb.blog.service.base.BaseCrudService;

import java.util.List;

/**
 * @author shiex-薛
 * @title: UserRoleService
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\4 000421:24
 */
public interface RoleService extends BaseCrudService<Role> {
    List<String> selectUserRole(Integer userId);
}
