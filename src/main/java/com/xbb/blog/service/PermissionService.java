package com.xbb.blog.service;

import com.xbb.blog.entity.Permission;
import com.xbb.blog.service.base.BaseCrudService;
import sun.dc.path.PathError;

import java.util.List;

/**
 * @author shiex-薛
 * @title: PermissionService
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\4 000421:43
 */
public interface PermissionService extends BaseCrudService<Permission> {
    List<String> selectUserPermission(Integer userId);
}
