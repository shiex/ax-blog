package com.xbb.blog.service.Impl;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.dao.PermissionMapper;
import com.xbb.blog.entity.Permission;
import com.xbb.blog.service.PermissionService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author shiex-薛
 * @title: UserPermissionServiceImpl
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\4 000423:47
 */
@Service("permissionService")
public class PermissionServiceImpl implements PermissionService {

    @Resource private PermissionMapper permissionMapper;

    @Override
    public int insertSelective(Permission permission) {
        return permissionMapper.insertSelective(permission);
    }

    @Override
    public int insertList(List<Permission> permissions) {
        return permissionMapper.insertList(permissions);
    }

    @Override
    public int updateByPrimaryKeySelective(Permission permission) {
        return permissionMapper.updateByPrimaryKeySelective(permission);
    }

    @Override
    public int deleteByPrimaryKey(Permission permission) {
        return permissionMapper.deleteByPrimaryKey(permission.getId());
    }

    @Override
    public Permission selectOne(Permission permission) {
        return permissionMapper.selectOne(permission);
    }

    @Override
    public Permission selectByPrimaryKey(Permission permission) {
        return permissionMapper.selectByPrimaryKey(permission.getId());
    }

    @Override
    public List<Permission> select(Permission role) {
        return permissionMapper.select(role);
    }

    @Override
    public List<Permission> selectAll() {
        return permissionMapper.selectAll();
    }

    @Override
    public List<Permission> selectByExample(Example example) {
        return permissionMapper.selectByExample(example);
    }

    @Override
    public int selectCount(Permission permission) {
        return permissionMapper.selectCount(permission);
    }

    @Override
    public List<String> selectUserPermission(Integer userId) {
        return permissionMapper.selectUserPermission(userId);
    }

    @Override
    public List<Permission> selectDataPageHelper(PageInfoBO pageInfoBO) {
        return null;
    }
}
