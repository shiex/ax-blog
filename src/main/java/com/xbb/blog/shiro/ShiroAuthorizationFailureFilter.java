package com.xbb.blog.shiro;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.web.filter.authz.PermissionsAuthorizationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author shiex-薛
 * @title: ShiroAuthorizationFailureFilter
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\22 002220:51
 */
public class ShiroAuthorizationFailureFilter extends PermissionsAuthorizationFilter {

    /**
     * 授权失败：请求为ajax时返回Json数据，反之则进行重定向
     * @param servletRequest
     * @param servletResponse
     * @return true-继续往下执行，false-该filter过滤器已经处理，不继续执行其他过滤器
     * @throws Exception
     */
    @Override
    protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse servletResponse) throws IOException {
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        if (isAjax(servletRequest)) {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json");
            JSONObject json = new JSONObject();
            json.put("error", -1);
            json.put("reason","无权访问!");
            response.getWriter().write(json.toString());
        } else {
            response.sendRedirect("/login.html");
            return false;
        }
        return false;
    }

    private boolean isAjax(ServletRequest servletRequest){
        String requestedWith = ((HttpServletRequest) servletRequest).getHeader("X-Requested-With");
        if(requestedWith != null && StringUtils.equals(requestedWith, "XMLHttpRequest")){
            return true;
        }
        return false;
    }

}
