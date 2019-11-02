package com.xbb.blog.entity;

import java.util.Date;
import javax.persistence.*;

@Table(name = "ax_blogs.reply")
public class Reply {
    /**
     * 回复表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 评论ID
     */
    @Column(name = "comment_id")
    private Integer commentId;

    /**
     * 回复者ID
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 被回复者ID
     */
    @Column(name = "by_username")
    private String byUsername;

    /**
     * 内容
     */
    private String content;

    /**
     * 回复时间
     */
    @Column(name = "reply_time")
    private Date replyTime;

    /**
     * 联表查询封装Map
     */
    private User user;

    /**
     * 获取回复表ID
     *
     * @return id - 回复表ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置回复表ID
     *
     * @param id 回复表ID
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取评论ID
     *
     * @return comment_id - 评论ID
     */
    public Integer getCommentId() {
        return commentId;
    }

    /**
     * 设置评论ID
     *
     * @param commentId 评论ID
     */
    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    /**
     * 获取回复者ID
     *
     * @return user_id - 回复者ID
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置回复者ID
     *
     * @param userId 回复者ID
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取被回复者ID
     *
     * @return by_username - 被回复者ID
     */
    public String getByUsername() {
        return byUsername;
    }

    /**
     * 设置被回复者ID
     *
     * @param byUsername 被回复者ID
     */
    public void setByUsername(String byUsername) {
        this.byUsername = byUsername;
    }

    /**
     * 获取内容
     *
     * @return content - 内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置内容
     *
     * @param content 内容
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 获取回复时间
     *
     * @return reply_time - 回复时间
     */
    public Date getReplyTime() {
        return replyTime;
    }

    /**
     * 设置回复时间
     *
     * @param replyTime 回复时间
     */
    public void setReplyTime(Date replyTime) {
        this.replyTime = replyTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Reply{" +
                "id=" + id +
                ", commentId=" + commentId +
                ", userId=" + userId +
                ", byUserId=" + byUsername +
                ", content='" + content + '\'' +
                ", replyTime=" + replyTime +
                ", user=" + user +
                '}';
    }
}