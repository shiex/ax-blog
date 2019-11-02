package com.xbb.blog.dao;

import com.xbb.blog.entity.Permission;
import com.xbb.blog.tk.mybatis.TkMapper;

import java.util.List;

public interface PermissionMapper extends TkMapper<Permission> {
    List<String> selectUserPermission(Integer userId);
}