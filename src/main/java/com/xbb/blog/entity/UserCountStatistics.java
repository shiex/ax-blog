package com.xbb.blog.entity;

import javax.persistence.*;

/**
 * @author shiex-薛
 * @title: CountStatistics
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\3 000318:46
 */
@Table(name = "ax_blogs.count_statistics")
public class UserCountStatistics {

    /**
     * 数量统计表ID
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
     * 关注量
     */
    @Column(name = "follow_count")
    private Integer followCount;

    /**
     * 粉丝量
     */
    @Column(name = "fans_count")
    private Integer fansCount;

    /**
     * 博客量
     */
    @Column(name = "article_count")
    private Integer articleCount;

    /**
     * 人气量
     */
    @Column(name = "popularity_count")
    private Integer popularityCount;

    /**
     * 获取数量统计表ID
     *
     * @return id - 数量统计表ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置数量统计表ID
     *
     * @param id 数量统计表ID
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取用户ID
     *
     * @return userId - 用户ID
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
     * 获取关注量
     *
     * @return followCount - 关注量
     */
    public Integer getFollowCount() {
        return followCount;
    }

    /**
     * 设置关注量
     *
     * @param followCount 关注量
     */
    public void setFollowCount(Integer followCount) {
        this.followCount = followCount;
    }

    /**
     * 获取粉丝量
     *
     * @return fansCount - 粉丝量
     */
    public Integer getFansCount() {
        return fansCount;
    }

    /**
     * 设置粉丝量
     *
     * @param fansCount 粉丝量
     */
    public void setFansCount(Integer fansCount) {
        this.fansCount = fansCount;
    }

    /**
     * 获取博客量
     *
     * @return articleCount - 博客量
     */
    public Integer getArticleCount() {
        return articleCount;
    }

    /**
     * 设置博客量
     *
     * @param articleCount 博客量
     */
    public void setArticleCount(Integer articleCount) {
        this.articleCount = articleCount;
    }

    /**
     * 获取人气量
     *
     * @return popularityCount - 人气量
     */
    public Integer getPopularityCount() {
        return popularityCount;
    }

    /**
     * 设置人气量
     *
     * @param popularityCount 人气量
     */
    public void setPopularityCount(Integer popularityCount) {
        this.popularityCount = popularityCount;
    }
}
