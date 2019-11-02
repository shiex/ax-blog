package com.xbb.blog.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * @author shiex-薛
 * @title: Nocice
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\28 002816:38
 */

@Table(name = "ax_blogs.notice")
public class Notice {
    /**
     * 公告表ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 标题
     */
    private String title;

    /**
     * 内容
     */
    private String content;

    /**
     * 公告日期
     */
    @Column(name = "notice_time")
    private Date noticeTime;

    /**
     * 获取公告表ID
     *
     * @return id - 公告表ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置公告表ID
     *
     * @param id 公告表ID
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取内容
     *
     * @return title - 内容
     */
    public String getTitle() {
        return title;
    }

    /**
     * 设置内容
     *
     * @param title 内容
     */
    public void setTitle(String title) {
        this.title = title;
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
     * 获取公告日期
     *
     * @return noticeTime - 公告日期
     */
    public Date getNoticeTime() {
        return noticeTime;
    }

    /**
     * 设置公告日期
     *
     * @param noticeTime 公告日期
     */
    public void setNoticeTime(Date noticeTime) {
        this.noticeTime = noticeTime;
    }
}
