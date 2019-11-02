package com.xbb.blog.entity;

import javax.persistence.*;

@Table(name = "ax_blogs.appluad")
public class Appluad {
    /**
     * 点赞表ID
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
     * 博客ID
     */
    @Column(name = "article_id")
    private Integer articleId;

    /**
     * 获取点赞表ID
     *
     * @return id - 点赞表ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置点赞表ID
     *
     * @param id 点赞表ID
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
     * 获取博客ID
     *
     * @return article_id - 博客ID
     */
    public Integer getArticleId() {
        return articleId;
    }

    /**
     * 设置博客ID
     *
     * @param articleId 博客ID
     */
    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }
}