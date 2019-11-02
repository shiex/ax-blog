package com.xbb.blog.shiro;

import com.xbb.blog.AxBlogApplicationTests;
import com.xbb.blog.entity.User;
import org.junit.Test;

import javax.annotation.Resource;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static org.junit.Assert.*;

/**
 * @author shiex-薛
 * @title: AxShiroRealmTest
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\5 000521:29
 */
public class AxShiroRealmTest extends AxBlogApplicationTests {

    @Test
    public void doGetAuthenticationInfo() {

    }

    @Test
    public void doGetAuthorizationInfo() {
        /*User user = (User) principalCollection.getPrimaryPrincipal();
        List<String> roleList = userRoleService.selectByUserId(user.getId());
        List<String> permissionList = permissionService.selectByUserId(user.getId());

        Set<String> roleSet = new HashSet<>();
        Set<String> permissionSet = new HashSet<>();
        for(String roleName : roleList){
            roleSet.add(roleName);
        }
        for(String permissionName : permissionList){
            permissionSet.add(permissionName);
        }*/
    }
}