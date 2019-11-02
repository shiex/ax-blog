package com.xbb.blog.dao;

import com.xbb.blog.entity.Role;
import com.xbb.blog.tk.mybatis.TkMapper;

import java.util.List;

public interface RoleMapper extends TkMapper<Role> {
    List<String> selectUserRole(Integer userId);
}