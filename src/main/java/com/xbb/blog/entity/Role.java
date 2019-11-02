package com.xbb.blog.entity;

import javax.persistence.*;

@Table(name = "ax_blogs.role")
public class Role {
    /**
     * 角色表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Short id;

    /**
     * 名称
     */
    @Column(name = "role_name")
    private String roleName;

    /**
     * 获取角色表ID
     *
     * @return id - 角色表ID
     */
    public Short getId() {
        return id;
    }

    /**
     * 设置角色表ID
     *
     * @param id 角色表ID
     */
    public void setId(Short id) {
        this.id = id;
    }

    /**
     * 获取名称
     *
     * @return role_name - 名称
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * 设置名称
     *
     * @param roleName 名称
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}