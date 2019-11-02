package com.xbb.blog.dao;

import com.xbb.blog.entity.User;
import com.xbb.blog.tk.mybatis.TkMapper;
import org.apache.ibatis.annotations.Param;

public interface UserMapper extends TkMapper<User> {

    int updateCountIncreasing(User user);

    int updateCountDegression(User user);

    User selectOneByUserId(@Param("userId") int userId,
                           @Param("userId2") int userId2);
}