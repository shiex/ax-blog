package com.xbb.blog.shiro;

import com.xbb.blog.constant.SessionConstant;
import com.xbb.blog.entity.User;
import com.xbb.blog.service.PermissionService;
import com.xbb.blog.service.RoleService;
import com.xbb.blog.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.apache.shiro.util.ByteSource;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author shiex-薛
 * @title: MyShiroRealm
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\4 000417:19
 */
public class ShiroRealm extends AuthorizingRealm {

    @Resource
    private UserService userService;
    @Resource
    private RoleService roleService;
    @Resource
    private PermissionService permissionService;

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        UsernamePasswordToken upToken = (UsernamePasswordToken) token;
        String username = upToken.getUsername();

        User selectUser = new User();
        selectUser.setUsername(username);
        User user = userService.selectOne(selectUser);

        if (user == null) {
            throw new UnknownAccountException("用户不存在!");
        }

        Session loginSession = SecurityUtils.getSubject().getSession();
        loginSession.setAttribute(SessionConstant.KEY_USER, user);
        System.out.println(loginSession.getId());

        // 单用户登录
        // 处理session
        /*DefaultWebSecurityManager securityManager = (DefaultWebSecurityManager) SecurityUtils.getSecurityManager();
        DefaultWebSessionManager sessionManager = (DefaultWebSessionManager) securityManager.getSessionManager();
        // 获取当前已登录的用户session列表
        Collection<Session> sessions = sessionManager.getSessionDAO().getActiveSessions();
        User u;
        for(Session session : sessions){
            // 清除该用户以前登录时保存的session，强制退出
            Object attribute = session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
            if (attribute == null) {
                continue;
            }
            // u = (User) ((SimplePrincipalCollection) attribute).getPrimaryPrincipal();
            u = (User) session.getAttribute(SessionConstant.KEY_USER);
            if (StringUtils.equals(u.getUsername(), username)) {
                sessionManager.getSessionDAO().delete(session);
            }
        }*/

        // 将信息封装到SimpleAuthenticationInfo对象，密码比对由Shiro完成
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(
                user,
                user.getPassword(),
                ByteSource.Util.bytes(user.getUsername()),
                this.getName()
        );
        return info;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        User user = (User) principalCollection.getPrimaryPrincipal();

        List<String> roleList = roleService.selectUserRole(user.getId());
        Set<String> roleSet = new HashSet<>();
        for (String roleName : roleList) {
            roleSet.add(roleName);
        }

        List<String> permissionList = permissionService.selectUserPermission(user.getId());
        Set<String> permissionSet = new HashSet<>();
        for (String permissionName : permissionList) {
            permissionSet.add(permissionName);
        }

        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        info.setRoles(roleSet);
        info.setStringPermissions(permissionSet);

        return info;
    }

}
