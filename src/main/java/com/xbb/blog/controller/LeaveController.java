package com.xbb.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author shiex-薛
 * @title: LeaveController
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\28 002811:42
 */
@Controller
@RequestMapping("/leave")
public class LeaveController {

    @RequestMapping("/index")
    public String leaveIndex() {
        return "leave";
    }
}
