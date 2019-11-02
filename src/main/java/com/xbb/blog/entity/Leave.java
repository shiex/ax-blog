package com.xbb.blog.entity;

import java.util.Date;
import javax.persistence.*;

@Table(name = "ax_blogs.leave")
public class Leave {
    /**
     * 留言表ID
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
     * 内容
     */
    private String content;

    /**
     * 留言时间
     */
    @Column(name = "leave_time")
    private Date leaveTime;

    /**
     * 获取留言表ID
     *
     * @return id - 留言表ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置留言表ID
     *
     * @param id 留言表ID
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
     * 获取留言时间
     *
     * @return leave_time - 留言时间
     */
    public Date getLeaveTime() {
        return leaveTime;
    }

    /**
     * 设置留言时间
     *
     * @param leaveTime 留言时间
     */
    public void setLeaveTime(Date leaveTime) {
        this.leaveTime = leaveTime;
    }
}