package com.xbb.blog.service.Impl;

import com.xbb.blog.entity.Permission;
import com.xbb.blog.entity.Role;
import com.xbb.blog.service.PermissionService;
import com.xbb.blog.service.ShiroService;
import com.xbb.blog.service.RoleService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.mgt.DefaultFilterChainManager;
import org.apache.shiro.web.filter.mgt.PathMatchingFilterChainResolver;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @author shiex-薛
 * @title: ShiroServiceImpl
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\8 000821:09
 */
@Service("shiroService")
public class ShiroServiceImpl implements ShiroService {

    @Resource
    private ShiroFilterFactoryBean shiroFilterFactoryBean;
    @Resource
    private PermissionService permissionService;

    @Override
    public Map<String, String> loadFilterChainDefinitions() {
        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<>();
        filterChainDefinitionMap.put("/logout", "logout");
        filterChainDefinitionMap.put("/frontend/**", "anon");
        filterChainDefinitionMap.put("/", "anon");
        filterChainDefinitionMap.put("/login.*", "anon");
        filterChainDefinitionMap.put("/register.*", "anon");
        filterChainDefinitionMap.put("/article/read/**", "anon");
        filterChainDefinitionMap.put("/issue.html", "anon");

        // 权限拦截对应路径
        List<Permission> permissionList = permissionService.selectAll();
        if (permissionList != null) {
            StringBuilder permissionStr;
            for (Permission permission : permissionList) {
                if (StringUtils.isNotEmpty(permission.getPermissionUri())) {
                    permissionStr = new StringBuilder()
                            .append("perms[")
                            .append(permission.getPermissionName())
                            .append("]");
                    filterChainDefinitionMap.put(permission.getPermissionUri(), permissionStr.toString());
                }
            }
        }
        filterChainDefinitionMap.put("/**", "authc");
        return filterChainDefinitionMap;
    }

    @Override
    public void updatePermission() {
        synchronized (shiroFilterFactoryBean) {
            AbstractShiroFilter shiroFilter = null;
            try {
                shiroFilter = (AbstractShiroFilter) shiroFilterFactoryBean.getObject();
            } catch (Exception e) {
                throw new RuntimeException("get ShiroFilter from shiroFilterFactoryBean error!");
            }

            PathMatchingFilterChainResolver filterChainResolver =
                    (PathMatchingFilterChainResolver) shiroFilter.getFilterChainResolver();
            DefaultFilterChainManager manager =
                    (DefaultFilterChainManager) filterChainResolver.getFilterChainManager();
            // 清空老的权限控制
            manager.getFilterChains().clear();

            shiroFilterFactoryBean.getFilterChainDefinitionMap().clear();
            shiroFilterFactoryBean.setFilterChainDefinitionMap(loadFilterChainDefinitions());

            // 重新构建生成
            Map<String, String> chains = shiroFilterFactoryBean.getFilterChainDefinitionMap();
            for (Map.Entry<String, String> entry : chains.entrySet()) {
                String url = entry.getKey();
                String chainDefinition = entry.getValue().trim().replace(" ", "");
                manager.createChain(url, chainDefinition);
            }
            System.out.println("更新权限成功！！");
        }
    }
}
