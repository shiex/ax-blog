package com.xbb.blog.entity;

import javax.persistence.*;

@Table(name = "ax_blogs.role_permission")
public class RolePermission {
    /**
     * 角色权限关系表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Short id;

    /**
     * 角色ID
     */
    @Column(name = "role_id")
    private Short roleId;

    /**
     * 权限ID
     */
    @Column(name = "permission_id")
    private Short permissionId;

    private String permissionIds;

    /**
     * 获取角色权限关系表ID
     *
     * @return id - 角色权限关系表ID
     */
    public Short getId() {
        return id;
    }

    /**
     * 设置角色权限关系表ID
     *
     * @param id 角色权限关系表ID
     */
    public void setId(Short id) {
        this.id = id;
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

    /**
     * 获取权限ID
     *
     * @return permission_id - 权限ID
     */
    public Short getPermissionId() {
        return permissionId;
    }

    /**
     * 设置权限ID
     *
     * @param permissionId 权限ID
     */
    public void setPermissionId(Short permissionId) {
        this.permissionId = permissionId;
    }

    public String getPermissionIds() {
        return permissionIds;
    }

    public void setPermissionIds(String permissionIds) {
        this.permissionIds = permissionIds;
    }
}