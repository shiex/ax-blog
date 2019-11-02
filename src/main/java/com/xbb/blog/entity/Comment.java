package com.xbb.blog.entity;

import java.util.Date;
import java.util.List;
import javax.persistence.*;

@Table(name = "ax_blogs.comment")
public class Comment {
    /**
     * 评论表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 博客ID
     */
    @Column(name = "article_id")
    private Integer articleId;

    /**
     * 用户ID
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 内容
     */
    private String content;

    /**
     * 回复量
     */
    @Column(name = "reply_count")
    private Short replyCount;

    /**
     * 评论时间
     */
    @Column(name = "comment_time")
    private Date commentTime;

    /**
     * 联表查询封装Map
     */
    private User user;
    private List<Reply> replyList;

    /**
     * 获取评论表ID
     *
     * @return id - 评论表ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置评论表ID
     *
     * @param id 评论表ID
     */
    public void setId(Integer id) {
        this.id = id;
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
     * 获取回复量
     *
     * @return reply_count - 回复量
     */
    public Short getReplyCount() {
        return replyCount;
    }

    /**
     * 设置回复量
     *
     * @param replyCount 回复量
     */
    public void setReplyCount(Short replyCount) {
        this.replyCount = replyCount;
    }

    /**
     * 获取评论时间
     *
     * @return comment_time - 评论时间
     */
    public Date getCommentTime() {
        return commentTime;
    }

    /**
     * 设置评论时间
     *
     * @param commentTime 评论时间
     */
    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Reply> getReplyList() {
        return replyList;
    }

    public void setReplyList(List<Reply> replyList) {
        this.replyList = replyList;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", articleId=" + articleId +
                ", userId=" + userId +
                ", content='" + content + '\'' +
                ", replyCount=" + replyCount +
                ", commentTime=" + commentTime +
                ", user=" + user +
                ", replyList=" + replyList +
                '}';
    }
}