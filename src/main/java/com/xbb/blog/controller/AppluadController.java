package com.xbb.blog.controller;

import com.xbb.blog.bo.RestMapBO;
import com.xbb.blog.constant.SessionConstant;
import com.xbb.blog.entity.Appluad;
import com.xbb.blog.entity.User;
import com.xbb.blog.service.AppluadService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @author shiex-薛
 * @title: AppluadController
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\7 000720:31
 */
@RestController
@RequestMapping("/appluad")
public class AppluadController {

    @Resource
    private AppluadService appluadService;

    /**
     * id=0：添加关注，反之为取消
     * @param appluad
     * @param session
     * @return: java.util.Map<java.lang.String,java.lang.Object>
     */
    @RequestMapping("/isAppluad")
    public Map<String, Object> isAppluad(@RequestBody Appluad appluad, HttpSession session) {
        User user = (User) session.getAttribute(SessionConstant.KEY_USER);
        Map<String, Object> restMap = RestMapBO.getRestMap();
        if (appluad.getId() == 0) {
            appluad.setId(null);
            appluad.setUserId(user.getId());
            appluadService.insertSelective(appluad);
            restMap.put("data", appluad.getId());
        } else {
            appluadService.deleteByPrimaryKey(appluad);
        }

        return restMap;
    }
}
