package com.xbb.blog.entity;

import javax.persistence.*;

@Table(name = "ax_blogs.permission")
public class Permission {
    /**
     * 权限表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Short id;

    /**
     * 权限名称
     */
    @Column(name = "permission_name")
    private String permissionName;

    /**
     * 权限对应拦截uri
     */
    @Column(name = "permission_uri")
    private String permissionUri;

    /**
     * 获取权限表ID
     *
     * @return id - 权限表ID
     */
    public Short getId() {
        return id;
    }

    /**
     * 设置权限表ID
     *
     * @param id 权限表ID
     */
    public void setId(Short id) {
        this.id = id;
    }

    /**
     * 获取权限名称
     *
     * @return permission_name - 权限名称
     */
    public String getPermissionName() {
        return permissionName;
    }

    /**
     * 设置权限名称
     *
     * @param permissionName 权限名称
     */
    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

    /**
     * 获取权限对应拦截uri
     *
     * @return permission_uri - 权限对应拦截uri
     */
    public String getPermissionUri() {
        return permissionUri;
    }

    /**
     * 设置权限对应拦截uri
     *
     * @param permissionUri 权限对应拦截uri
     */
    public void setPermissionUri(String permissionUri) {
        this.permissionUri = permissionUri;
    }

}