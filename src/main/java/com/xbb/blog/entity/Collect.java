package com.xbb.blog.entity;

import javax.persistence.*;

@Table(name = "ax_blogs.collect")
public class Collect {
    /**
     * 收藏表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 文章ID
     */
    @Column(name = "article_id")
    private Integer articleId;

    /**
     * 用户ID
     */
    @Column(name = "user_id")
    private Integer userId;

    /*
     * 联表查询
     */
    private Article article;

    /**
     * 获取收藏表ID
     *
     * @return id - 收藏表ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置收藏表ID
     *
     * @param id 收藏表ID
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取文章ID
     *
     * @return article_id - 文章ID
     */
    public Integer getArticleId() {
        return articleId;
    }

    /**
     * 设置文章ID
     *
     * @param articleId 文章ID
     */
    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
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

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }
}