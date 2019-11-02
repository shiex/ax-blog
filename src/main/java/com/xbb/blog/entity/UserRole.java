package com.xbb.blog.entity;

import javax.persistence.*;

@Table(name = "ax_blogs.user_role")
public class UserRole {
    /**
     * 用户角色表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Short id;

    /**
     * 用户ID
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 角色ID
     */
    @Column(name = "role_id")
    private Short roleId;

    /**
     * 获取用户角色表ID
     *
     * @return id - 用户角色表ID
     */
    public Short getId() {
        return id;
    }

    /**
     * 设置用户角色表ID
     *
     * @param id 用户角色表ID
     */
    public void setId(Short id) {
        this.id = id;
    }

    /**
     * 获取用户ID
     *
     * @return user_id - 用户ID
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置用户ID
     *
     * @param userId 用户ID
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取角色ID
     *
     * @return role_id - 角色ID
     */
    public Short getRoleId() {
        return roleId;
    }

    /**
     * 设置角色ID
     *
     * @param roleId 角色ID
     */
    public void setRoleId(Short roleId) {
        this.roleId = roleId;
    }
}