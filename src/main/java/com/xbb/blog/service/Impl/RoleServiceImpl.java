package com.xbb.blog.service.Impl;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.dao.RoleMapper;
import com.xbb.blog.entity.Role;
import com.xbb.blog.service.RoleService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author shiex-薛
 * @title: UserRoleServiceImpl
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\4 000421:25
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Resource private RoleMapper roleMapper;

    @Override
    public int insertSelective(Role role) {
        return roleMapper.insertSelective(role);
    }

    @Override
    public int insertList(List<Role> roles) {
        return roleMapper.insertList(roles);
    }

    @Override
    public int updateByPrimaryKeySelective(Role role) {
        return roleMapper.updateByPrimaryKeySelective(role);
    }

    @Override
    public int deleteByPrimaryKey(Role role) {
        return roleMapper.deleteByPrimaryKey(role.getId());
    }

    @Override
    public Role selectOne(Role role) {
        return roleMapper.selectOne(role);
    }

    @Override
    public Role selectByPrimaryKey(Role role) {
        return roleMapper.selectByPrimaryKey(role.getId());
    }

    @Override
    public List<Role> select(Role role) {
        return roleMapper.select(role);
    }

    @Override
    public List<Role> selectAll() {
        return roleMapper.selectAll();
    }

    @Override
    public List<Role> selectByExample(Example example) {
        return roleMapper.selectByExample(example);
    }

    @Override
    public int selectCount(Role role) {
        return roleMapper.selectCount(role);
    }

    @Override
    public List<Role> selectDataPageHelper(PageInfoBO pageInfoBO) {
        return null;
    }

    @Override
    public List<String> selectUserRole(Integer userId) {
        return roleMapper.selectUserRole(userId);
    }
}
