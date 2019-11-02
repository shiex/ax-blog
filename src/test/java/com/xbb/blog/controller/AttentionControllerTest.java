package com.xbb.blog.controller;

import com.xbb.blog.AxBlogApplicationTests;
import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.entity.Attention;
import com.xbb.blog.service.AttentionService;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;

import static org.junit.Assert.*;

/**
 * @author shiex-薛
 * @title: AttentionControllerTest
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\14 001414:49
 */
public class AttentionControllerTest extends AxBlogApplicationTests {

    @Resource
    private AttentionService attentionService;

    @Test
    public void followList() {
        PageInfoBO pageInfoBO = new PageInfoBO(1, "1", 0, 30);
        List<Attention> attentionList = attentionService.selectPageHelperData(pageInfoBO);
        int total = attentionService.selectCountByUserId(pageInfoBO.getId(), pageInfoBO.getQueryType());
    }
}