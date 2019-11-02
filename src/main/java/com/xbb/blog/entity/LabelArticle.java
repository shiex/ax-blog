package com.xbb.blog.entity;

import javax.persistence.*;

@Table(name = "ax_blogs.label_article")
public class LabelArticle {
    /**
     * 标签列表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 博客标签ID
     */
    @Column(name = "label_id")
    private Integer labelId;

    /**
     * 博客ID
     */
    @Column(name = "article_id")
    private Integer articleId;

    /**
     * 博客ID
     */
    private Article article;

    /**
     * 获取标签列表ID
     *
     * @return id - 标签列表ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置标签列表ID
     *
     * @param id 标签列表ID
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取博客标签ID
     *
     * @return label_id - 博客标签ID
     */
    public Integer getLabelId() {
        return labelId;
    }

    /**
     * 设置博客标签ID
     *
     * @param labelId 博客标签ID
     */
    public void setLabelId(Integer labelId) {
        this.labelId = labelId;
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

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }
}