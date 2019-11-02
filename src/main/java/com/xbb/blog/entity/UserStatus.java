package com.xbb.blog.entity;

/**
 * @author shiex-薛
 * @title: UserStatus
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\8 000813:19
 */
public class UserStatus extends User {

    /**
     * 用户当前状态
     */
    private Integer attentionId;  // ID不为null表示关注了此博主
    private Integer appluadId;    // ID不为null表示点赞了此博客

    public Integer getAttentionId() {
        return attentionId;
    }

    public void setAttentionId(Integer attentionId) {
        this.attentionId = attentionId;
    }

    public Integer getAppluadId() {
        return appluadId;
    }

    public void setAppluadId(Integer appluadId) {
        this.appluadId = appluadId;
    }

}
