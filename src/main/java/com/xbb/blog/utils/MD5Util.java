package com.xbb.blog.utils;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

/**
 * @author shiex-薛
 * @title: MD5Utils
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\6 000622:05
 */
public class MD5Util {

    public static String ALGORITHM_NAME = "MD5";
    public static int HASH_ITERATIONS = 5;

    /**
     * 用户名称作为盐值，对密码进行MD5加密
     * @param username
     * @param password
     * @return: java.lang.String
     */
    public static String encrypt(String username, String password){
        Object usernameSalt = ByteSource.Util.bytes(username);
        Object result = new SimpleHash(ALGORITHM_NAME,
                password,
                usernameSalt,
                HASH_ITERATIONS);
        return result.toString();
    }
}
