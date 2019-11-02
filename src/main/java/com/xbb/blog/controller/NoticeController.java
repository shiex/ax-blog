package com.xbb.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author shiex-薛
 * @title: NoticeController
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\23 002318:42
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {

    @RequestMapping("/index")
    public String noticeIndex(Model model) {
        return "notice";
    }

}
