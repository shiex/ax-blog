package com.xbb.blog.service.Impl;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.dao.UserMapper;
import com.xbb.blog.entity.User;
import com.xbb.blog.service.UserService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author shiex-薛
 * @title: UserServiceImpl
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\4 000414:52
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;

    @Override
    public int insertSelective(User user) {
        return userMapper.insertSelective(user);
    }

    @Override
    public int insertList(List<User> users) {
        return userMapper.insertList(users);
    }

    @Override
    public int updateByPrimaryKeySelective(User user) {
        return userMapper.updateByPrimaryKeySelective(user);
    }

    @Override
    public int updateCountIncreasing(User user) {
        return userMapper.updateCountIncreasing(user);
    }

    @Override
    public int updateCountDegression(User user) {
        return userMapper.updateCountDegression(user);
    }

    @Override
    public int deleteByPrimaryKey(User user) {
        return userMapper.deleteByPrimaryKey(user.getId());
    }

    @Override
    public User selectOne(User user) {
        return userMapper.selectOne(user);
    }

    @Override
    public User selectByPrimaryKey(User user) {
        return userMapper.selectByPrimaryKey(user.getId());
    }

    @Override
    public User selectOneByUserId(int userId, int userId2) {
        return userMapper.selectOneByUserId(userId, userId2);
    }

    @Override
    public List<User> select(User user) {
        return userMapper.select(user);
    }

    @Override
    public List<User> selectAll() {
        return userMapper.selectAll();
    }

    @Override
    public List<User> selectByExample(Example example) {
        return userMapper.selectByExample(example);
    }

    @Override
    public List<User> selectDataPageHelper(PageInfoBO pageInfoBO) {
        return null;
    }

    @Override
    public int selectCount(User user) {
        return userMapper.selectCount(user);
    }

}
