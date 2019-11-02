package com.xbb.blog.entity;

import java.util.Date;
import javax.persistence.*;

@Table(name = "ax_blogs.user")
public class User {
    /**
     * 用户表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 名称
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 手机号
     */
    private String cellphone;

    /**
     * 头像路径
     */
    @Column(name = "head_portrait")
    private String headPortrait;

    /**
     * 头像路径
     */
    @Column(name = "intro")
    private String intro;

    /**
     * 文件存储目录
     */
    @Column(name = "file_dir")
    private String fileDir;

    /**
     * 角色ID
     */
    @Column(name = "role_id")
    private Short roleId;

    /**
     * 文件请求路径
     */
    @Column(name = "file_request_path")
    private String fileRequestPath;

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
     * 性别[0：男，1：女]
     */
    private Boolean sex;

    /**
     * 注册时间
     */
    @Column(name = "register_time")
    private Date registerTime;

    private Appluad appluad;
    private Attention attention;

    /**
     * 获取用户表ID
     *
     * @return id - 用户表ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置用户表ID
     *
     * @param id 用户表ID
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取名称
     *
     * @return username - 名称
     */
    public String getUsername() {
        return username;
    }

    /**
     * 设置名称
     *
     * @param username 名称
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * 获取密码
     *
     * @return password - 密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置密码
     *
     * @param password 密码
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 获取邮箱
     *
     * @return email - 邮箱
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置邮箱
     *
     * @param email 邮箱
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 获取手机号
     *
     * @return cellphone - 手机号
     */
    public String getCellphone() {
        return cellphone;
    }

    /**
     * 设置手机号
     *
     * @param cellphone 手机号
     */
    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
    }

    /**
     * 获取头像路径
     *
     * @return head_portrait - 头像路径
     */
    public String getHeadPortrait() {
        return headPortrait;
    }

    /**
     * 设置头像路径
     *
     * @param headPortrait 头像路径
     */
    public void setHeadPortrait(String headPortrait) {
        this.headPortrait = headPortrait;
    }

    /**
     * 获取文件存储目录
     *
     * @return file_dir - 文件存储目录
     */
    public String getFileDir() {
        return fileDir;
    }

    /**
     * 设置文件存储目录
     *
     * @param fileDir 文件存储目录
     */
    public void setFileDir(String fileDir) {
        this.fileDir = fileDir;
    }

    /**
     * 获取角色ID
     *
     * @return role_id - 角色ID
     */
    public Short getRoleId() {
        return roleId;
    }

    /**
     * 设置角色ID
     *
     * @param roleId 角色ID
     */
    public void setRoleId(Short roleId) {
        this.roleId = roleId;
    }

    /**
     * 获取文件请求路径
     *
     * @return file_request_path - 文件请求路径
     */
    public String getFileRequestPath() {
        return fileRequestPath;
    }

    /**
     * 设置文件请求路径
     *
     * @param fileRequestPath 文件请求路径
     */
    public void setFileRequestPath(String fileRequestPath) {
        this.fileRequestPath = fileRequestPath;
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

    /**
     * 获取注册时间
     *
     * @return register_time - 注册时间
     */
    public Date getRegisterTime() {
        return registerTime;
    }

    /**
     * 设置注册时间
     *
     * @param registerTime 注册时间
     */
    public void setRegisterTime(Date registerTime) {
        this.registerTime = registerTime;
    }

    /**
     * 获取性别[0：男，1：女]
     *
     * @return sex - 性别[0：男，1：女]
     */
    public Boolean getSex() {
        return sex;
    }

    /**
     * 设置性别[0：男，1：女]
     *
     * @param sex 性别[0：男，1：女]
     */
    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public Appluad getAppluad() {
        return appluad;
    }

    public void setAppluad(Appluad appluad) {
        this.appluad = appluad;
    }

    public Attention getAttention() {
        return attention;
    }

    public void setAttention(Attention attention) {
        this.attention = attention;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", cellphone='" + cellphone + '\'' +
                ", headPortrait='" + headPortrait + '\'' +
                ", fileDir='" + fileDir + '\'' +
                ", roleId=" + roleId +
                ", fileRequestPath='" + fileRequestPath + '\'' +
                ", followCount=" + followCount +
                ", fansCount=" + fansCount +
                ", articleCount=" + articleCount +
                ", popularityCount=" + popularityCount +
                ", sex=" + sex +
                ", registerTime=" + registerTime +
                '}';
    }
}