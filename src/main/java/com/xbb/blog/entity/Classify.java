package com.xbb.blog.entity;

import javax.persistence.*;

@Table(name = "ax_blogs.classify")
public class Classify {
    /**
     * 分类表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Short id;

    /**
     * 名称
     */
    private String name;

    /**
     * 获取分类表ID
     *
     * @return id - 分类表ID
     */
    public Short getId() {
        return id;
    }

    /**
     * 设置分类表ID
     *
     * @param id 分类表ID
     */
    public void setId(Short id) {
        this.id = id;
    }

    /**
     * 获取名称
     *
     * @return name - 名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置名称
     *
     * @param name 名称
     */
    public void setName(String name) {
        this.name = name;
    }
}