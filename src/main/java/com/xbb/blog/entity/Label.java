package com.xbb.blog.entity;

import javax.persistence.*;

@Table(name = "ax_blogs.label")
public class Label {
    /**
     * 用户博客标签表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 用户ID
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 标签名称
     */
    @Column(name = "label_name")
    private String labelName;

    /**
     * 获取用户博客标签表ID
     *
     * @return id - 用户博客标签表ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置用户博客标签表ID
     *
     * @param id 用户博客标签表ID
     */
    public void setId(Integer id) {
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
     * 获取标签名称
     *
     * @return label_name - 标签名称
     */
    public String getLabelName() {
        return labelName;
    }

    /**
     * 设置标签名称
     *
     * @param labelName 标签名称
     */
    public void setLabelName(String labelName) {
        this.labelName = labelName;
    }

    @Override
    public String toString() {
        return "Label{" +
                "id=" + id +
                ", userId=" + userId +
                ", labelName='" + labelName + '\'' +
                '}';
    }
}