package com.xbb.blog.service.Impl;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.dao.RolePermissionMapper;
import com.xbb.blog.entity.RolePermission;
import com.xbb.blog.service.RolePermissionService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author shiex-薛
 * @title: RolePermissionServiceImpl
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\24 002419:58
 */
@Service("rolePermissionService")
public class RolePermissionServiceImpl implements RolePermissionService {

    @Resource
    private RolePermissionMapper rolePermissionMapper;

    @Override
    public int insertSelective(RolePermission rolePermission) {
        return rolePermissionMapper.insertSelective(rolePermission);
    }

    @Override
    public int insertList(List<RolePermission> rolePermissions) {
        return rolePermissionMapper.insertList(rolePermissions);
    }

    @Override
    public int deleteByPrimaryKey(RolePermission rolePermission) {
        return rolePermissionMapper.deleteByPrimaryKey(rolePermission.getId());
    }

    @Override
    public RolePermission selectOne(RolePermission rolePermission) {
        return rolePermissionMapper.selectOne(rolePermission);
    }

    @Override
    public RolePermission selectByPrimaryKey(RolePermission rolePermission) {
        return rolePermissionMapper.selectByPrimaryKey(rolePermission.getId());
    }

    @Override
    public int updateByPrimaryKeySelective(RolePermission rolePermission) {
        return 0;
    }

    @Override
    public List<RolePermission> select(RolePermission rolePermission) {
        return rolePermissionMapper.select(rolePermission);
    }

    @Override
    public List<RolePermission> selectAll() {
        return rolePermissionMapper.selectAll();
    }

    @Override
    public List<RolePermission> selectByExample(Example example) {
        return rolePermissionMapper.selectByExample(example);
    }

    @Override
    public List<RolePermission> selectDataPageHelper(PageInfoBO pageInfoBO) {
        return null;
    }

    @Override
    public int selectCount(RolePermission rolePermission) {
        return rolePermissionMapper.selectCount(rolePermission);
    }

}
