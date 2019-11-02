package com.xbb.blog.entity;

import javax.persistence.*;

@Table(name = "ax_blogs.attention")
public class Attention {
    /**
     * 关注表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 被关注者ID
     */
    @Column(name = "follow_id")
    private Integer followId;

    /**
     * 粉丝ID
     */
    @Column(name = "fans_id")
    private Integer fansId;

    /**
     * 联表查询
     */
    private User user;

    /**
     * 获取关注表ID
     *
     * @return id - 关注表ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置关注表ID
     *
     * @param id 关注表ID
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取被关注者ID
     *
     * @return follow_id - 被关注者ID
     */
    public Integer getFollowId() {
        return followId;
    }

    /**
     * 设置被关注者ID
     *
     * @param followId 被关注者ID
     */
    public void setFollowId(Integer followId) {
        this.followId = followId;
    }

    /**
     * 获取粉丝ID
     *
     * @return fans_id - 粉丝ID
     */
    public Integer getFansId() {
        return fansId;
    }

    /**
     * 设置粉丝ID
     *
     * @param fansId 粉丝ID
     */
    public void setFansId(Integer fansId) {
        this.fansId = fansId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}