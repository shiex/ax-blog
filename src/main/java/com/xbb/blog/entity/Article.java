package com.xbb.blog.entity;

import java.util.Date;
import javax.persistence.*;

@Table(name = "ax_blogs.article")
public class Article {
    /**
     * 文章表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 分类ID
     */
    @Column(name = "classify_id")
    private Short classifyId;

    /**
     * 用户ID
     */
    @Column(name = "user_id")
    private Integer userId;

    /**
     * 标题
     */
    private String title;

    /**
     * 内容摘要
     */
    private String synopsis;

    /**
     * 点赞量
     */
    @Column(name = "appluad_count")
    private Integer appluadCount;

    /**
     * 阅读量
     */
    @Column(name = "read_count")
    private Integer readCount;

    /**
     * 评论量
     */
    @Column(name = "comment_count")
    private Integer commentCount;

    /**
     * [0：转载，1：原创]
     */
    @Column(name = "is_original")
    private Boolean original;

    /**
     * [0：未置顶，1：置顶]
     */
    @Column(name = "is_stick")
    private Boolean stick;

    /**
     * [0：未推荐，1：推荐]
     */
    @Column(name = "is_recommend")
    private Boolean recommend;

    /**
     * 发布时间
     */
    @Column(name = "issue_time")
    private Date issueTime;

    /**
     * 内容
     */
    private String content;

    /**
     * 联表查询封装Map
     */
    private User user;
    private Classify classify;
    private UserCountStatistics userCountStatistics;
    private Label label;

    /**
     * 获取文章表ID
     *
     * @return id - 文章表ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置文章表ID
     *
     * @param id 文章表ID
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取分类ID
     *
     * @return classify_id - 分类ID
     */
    public Short getClassifyId() {
        return classifyId;
    }

    /**
     * 设置分类ID
     *
     * @param classifyId 分类ID
     */
    public void setClassifyId(Short classifyId) {
        this.classifyId = classifyId;
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
     * 获取标题
     *
     * @return title - 标题
     */
    public String getTitle() {
        return title;
    }

    /**
     * 设置标题
     *
     * @param title 标题
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * 获取内容摘要
     *
     * @return synopsis - 内容摘要
     */
    public String getSynopsis() {
        return synopsis;
    }

    /**
     * 设置内容摘要
     *
     * @param synopsis 内容摘要
     */
    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }

    /**
     * 获取点赞量
     *
     * @return appluad_count - 点赞量
     */
    public Integer getAppluadCount() {
        return appluadCount;
    }

    /**
     * 设置点赞量
     *
     * @param appluadCount 点赞量
     */
    public void setAppluadCount(Integer appluadCount) {
        this.appluadCount = appluadCount;
    }

    /**
     * 获取阅读量
     *
     * @return read_count - 阅读量
     */
    public Integer getReadCount() {
        return readCount;
    }

    /**
     * 设置阅读量
     *
     * @param readCount 阅读量
     */
    public void setReadCount(Integer readCount) {
        this.readCount = readCount;
    }

    /**
     * 获取评论量
     *
     * @return comment_count - 评论量
     */
    public Integer getCommentCount() {
        return commentCount;
    }

    /**
     * 设置评论量
     *
     * @param commentCount 评论量
     */
    public void setCommentCount(Integer commentCount) {
        this.commentCount = commentCount;
    }

    /**
     * 获取[0：转载，1：原创]
     *
     * @return original - [0：转载，1：原创]
     */
    public Boolean getOriginal() {
        return original;
    }

    /**
     * 设置[0：转载，1：原创]
     *
     * @param original [0：转载，1：原创]
     */
    public void setOriginal(Boolean original) {
        this.original = original;
    }

    /**
     * 获取[0：未置顶，1：置顶]
     *
     * @return stick - [0：未置顶，1：置顶]
     */
    public Boolean getStick() {
        return stick;
    }

    /**
     * 设置[0：未置顶，1：置顶]
     *
     * @param stick [0：未置顶，1：置顶]
     */
    public void setStick(Boolean stick) {
        this.stick = stick;
    }

    /**
     * 获取[0：未推荐，1：推荐]
     *
     * @return recommend - [0：未推荐，1：推荐]
     */
    public Boolean getRecommend() {
        return recommend;
    }

    /**
     * 设置[0：未推荐，1：推荐]
     *
     * @param recommend [0：未推荐，1：推荐]
     */
    public void setRecommend(Boolean recommend) {
        this.recommend = recommend;
    }

    /**
     * 获取发布时间
     *
     * @return issue_time - 发布时间
     */
    public Date getIssueTime() {
        return issueTime;
    }

    /**
     * 设置发布时间
     *
     * @param issueTime 发布时间
     */
    public void setIssueTime(Date issueTime) {
        this.issueTime = issueTime;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Classify getClassify() {
        return classify;
    }

    public void setClassify(Classify classify) {
        this.classify = classify;
    }

    public UserCountStatistics getUserCountStatistics() {
        return userCountStatistics;
    }

    public void setUserCountStatistics(UserCountStatistics userCountStatistics) {
        this.userCountStatistics = userCountStatistics;
    }

    public Label getLabel() {
        return label;
    }

    public void setLabel(Label label) {
        this.label = label;
    }

    @Override
    public String toString() {
        return "Article{" +
                "id=" + id +
                ", classifyId=" + classifyId +
                ", userId=" + userId +
                ", title='" + title + '\'' +
                ", synopsis='" + synopsis + '\'' +
                ", appluadCount=" + appluadCount +
                ", readCount=" + readCount +
                ", original=" + original +
                ", stick=" + stick +
                ", issueTime=" + issueTime +
                ", content='" + content + '\'' +
                ", user=" + user +
                ", classify=" + classify +
                '}';
    }
}