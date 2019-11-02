package com.xbb.blog.controller;

import com.github.pagehelper.PageInfo;
import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.bo.RestMapBO;
import com.xbb.blog.constant.SessionConstant;
import com.xbb.blog.entity.Attention;
import com.xbb.blog.entity.User;
import com.xbb.blog.service.AttentionService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @author shiex-薛
 * @title: AttentionController
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\4 000420:58
 */
@Controller
@RequestMapping("/attention")
public class AttentionController {

    @Resource
    private AttentionService attentionService;

    @ModelAttribute("user")
    public User getSessionUser(HttpSession session) {
        return (User) session.getAttribute(SessionConstant.KEY_USER);
    }

    @ResponseBody
    @RequestMapping("/isAttention")
    public Map<String, Object> isAttention(@RequestBody Attention attention, @ModelAttribute("user") User user){
        Map<String, Object> restMap = RestMapBO.getRestMap();
        attention.setFansId(user.getId());
        if (attention.getId() == 0) {
            attention.setId(null);
            attentionService.insertSelective(attention);
            restMap.put("data", attention.getId());
        } else {
            attentionService.deleteByPrimaryKey(attention);
        }

        return restMap;
    }

    @RequestMapping("/list/{queryType}")
    public String followList(@PathVariable("queryType") String queryType, @ModelAttribute("user") User user, Model model) {
        PageInfoBO pageInfoBO = new PageInfoBO(user.getId(), queryType, 0, 30);
        List<Attention> attentionList = attentionService.selectPageHelperData(pageInfoBO);
        int total = attentionService.selectCountByUserId(user.getId(), queryType);
        model.addAttribute("attentionList", attentionList);
        model.addAttribute("total", total);
        model.addAttribute("queryType", queryType);
        return "user_attention";
    }

}
