package com.xbb.blog.entity;

import javax.persistence.*;

@Table(name = "ax_blogs.private_letter")
public class PrivateLetter {
    /**
     * 私信ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 用户1ID
     */
    @Column(name = "user_id_one")
    private Integer userIdOne;

    /**
     * 用户2ID
     */
    @Column(name = "user_id_two")
    private Integer userIdTwo;

    /**
     * 用户1消息
     */
    @Column(name = "message_one")
    private String messageOne;

    /**
     * 用户2消息
     */
    @Column(name = "message_two")
    private String messageTwo;

    /**
     * 获取私信ID
     *
     * @return id - 私信ID
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置私信ID
     *
     * @param id 私信ID
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取用户1ID
     *
     * @return user_id_one - 用户1ID
     */
    public Integer getUserIdOne() {
        return userIdOne;
    }

    /**
     * 设置用户1ID
     *
     * @param userIdOne 用户1ID
     */
    public void setUserIdOne(Integer userIdOne) {
        this.userIdOne = userIdOne;
    }

    /**
     * 获取用户2ID
     *
     * @return user_id_two - 用户2ID
     */
    public Integer getUserIdTwo() {
        return userIdTwo;
    }

    /**
     * 设置用户2ID
     *
     * @param userIdTwo 用户2ID
     */
    public void setUserIdTwo(Integer userIdTwo) {
        this.userIdTwo = userIdTwo;
    }

    /**
     * 获取用户1消息
     *
     * @return message_one - 用户1消息
     */
    public String getMessageOne() {
        return messageOne;
    }

    /**
     * 设置用户1消息
     *
     * @param messageOne 用户1消息
     */
    public void setMessageOne(String messageOne) {
        this.messageOne = messageOne;
    }

    /**
     * 获取用户2消息
     *
     * @return message_two - 用户2消息
     */
    public String getMessageTwo() {
        return messageTwo;
    }

    /**
     * 设置用户2消息
     *
     * @param messageTwo 用户2消息
     */
    public void setMessageTwo(String messageTwo) {
        this.messageTwo = messageTwo;
    }
}