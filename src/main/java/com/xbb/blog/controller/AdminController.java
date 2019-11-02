package com.xbb.blog.controller;

import com.xbb.blog.bo.RestMapBO;
import com.xbb.blog.dao.*;
import com.xbb.blog.entity.*;
import com.xbb.blog.service.*;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author shiex-薛
 * @title: AdminController
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\15 001523:29
 */
@RestController
public class AdminController {

    @Resource
    private ClassifyService classifyService;
    @Resource
    private ArticleService articleService;
    @Resource
    private UserService userService;
    @Resource
    private UserRoleMapper userRoleMapper;
    @Resource
    private RoleService roleService;
    @Resource
    private PermissionService permissionService;
    @Resource
    private RolePermissionService rolePermissionService;
    @Resource
    private NoticeService noticeService;
    @Resource
    private PageHelperService pageHelperService;
    @Resource
    private ShiroService shiroService;

    @RequestMapping("/admin/classify/select")
    public Map<String, Object> selectAllClassify() {
        Map<String, Object> restMap = RestMapBO.getRestMap();
        restMap.put("data", classifyService.selectAll());
        return restMap;
    }

    @RequestMapping("/admin/classify/add")
    public Map<String, Object> insertClassify(@RequestBody Classify classify) {
        Map<String, Object> restMap = RestMapBO.getRestMap();
        int nameIsExist = classifyService.selectCount(classify);
        if (nameIsExist != 0) {
            RestMapBO.setErrorRestMap(restMap, "添加失败，该分类名称已存在!");
            return restMap;
        }
        classifyService.insertSelective(classify);
        restMap.put("data", classify);
        return restMap;
    }

    @RequestMapping("/admin/classify/save")
    public Map<String, Object> saveClassify(@RequestBody Classify classify) {
        classifyService.updateByPrimaryKeySelective(classify);
        Map<String, Object> restMap = RestMapBO.getRestMap();
        restMap.put("data", classify);
        return restMap;
    }

    @RequestMapping("/admin/classify/delete")
    public Map<String, Object> deleteClassify(@RequestBody Short classifyId) {
        Classify classify = new Classify();
        classify.setId(classifyId);
        classifyService.deleteByPrimaryKey(classify);
        return RestMapBO.getRestMap();
    }

    @RequestMapping("/admin/article/select")
    public Map<String, Object> selectPageHelperArticle(@RequestParam("page") Integer page,
                                                @RequestParam("limit") Integer limit) {
        Map<String, Object> restMap = pageHelperService.getPageInfoRestMap(
                articleService,
                new Example(Article.class),
                page,
                limit
        );
        return restMap;
    }

    @RequestMapping("/admin/article/delete")
    public Map<String, Object> deleteArticle(@RequestBody Integer articleId) {
        Article article = new Article();
        article.setId(articleId);
        articleService.deleteByPrimaryKey(article);
        return RestMapBO.getRestMap();
    }

    @RequestMapping("/admin/user/select")
    public Map<String, Object> selectPageHelperUser(@RequestParam("page") Integer page,
                                             @RequestParam("limit") Integer limit) {
        Map<String, Object> restMap = pageHelperService.getPageInfoRestMap(
                userService,
                new Example(User.class),
                page,
                limit
        );
        return restMap;
    }

    @RequestMapping("/admin/user/delete")
    public Map<String, Object> deleteUser(@RequestBody Integer userId) {
        User user = new User();
        user.setId(userId);
        userService.deleteByPrimaryKey(user);
        return RestMapBO.getRestMap();
    }

    @ResponseBody
    @RequestMapping("/admin/notice/select")
    public Map<String, Object> selectPageHelperNotice(@RequestParam("page") Integer page,
                                          @RequestParam("limit") Integer limit) {
        Map<String, Object> restMap = pageHelperService.getPageInfoRestMap(
                noticeService,
                new Example(Notice.class),
                page,
                limit
        );
        return restMap;
    }

    @ResponseBody
    @RequestMapping("/admin/notice/add")
    public Map<String, Object> insertNotice(@RequestBody Notice notice) {
        notice.setNoticeTime(new Date());
        noticeService.insertSelective(notice);
        Map<String, Object> restMap = RestMapBO.getRestMap();
        return restMap;
    }

    @ResponseBody
    @RequestMapping("/admin/notice/delete")
    public Map<String, Object> deleteNotice(@RequestBody Notice notice) {
       noticeService.deleteByPrimaryKey(notice);
        return RestMapBO.getRestMap();
    }

    @RequestMapping("/governor/role/add")
    public Map<String, Object> insertRole(@RequestBody Role role) {
        Map<String, Object> restMap = RestMapBO.getRestMap();
        int nameIsExist = roleService.selectCount(role);
        if (nameIsExist != 0) {
            RestMapBO.setErrorRestMap(restMap, "添加失败，该角色已存在!");
            return restMap;
        }
        roleService.insertSelective(role);
        restMap.put("data", role);
        return restMap;
    }

    @RequestMapping("/governor/role/save")
    public Map<String, Object> saveRole(@RequestBody Role role) {
        roleService.updateByPrimaryKeySelective(role);
        Map<String, Object> restMap = RestMapBO.getRestMap();
        restMap.put("data", role);
        return restMap;
    }

    @RequestMapping("/governor/role/delete")
    public Map<String, Object> deleteRole(@RequestBody Short roleId) {
        Role role = new Role();
        role.setId(roleId);
        roleService.deleteByPrimaryKey(role);
        return RestMapBO.getRestMap();
    }

    @RequestMapping("/governor/permission/add")
    public Map<String, Object> insertPermission(@RequestBody Permission permission) {
        Map<String, Object> restMap = RestMapBO.getRestMap();

        Permission selectPermission = new Permission();
        selectPermission.setPermissionUri(permission.getPermissionUri());
        int nameIsExist = permissionService.selectCount(selectPermission);
        if (nameIsExist != 0) {
            RestMapBO.setErrorRestMap(restMap, "添加失败，该拦截路径已存在对应权限!");
            return restMap;
        }

        permissionService.insertSelective(permission);
        RolePermission permissionRole = new RolePermission();
        permissionRole.setRoleId((short) 1);
        permissionRole.setPermissionId(permission.getId());
        rolePermissionService.insertSelective(permissionRole);
        shiroService.updatePermission();

        restMap.put("data", permission);
        return restMap;
    }

    @RequestMapping("/governor/permission/save")
    public Map<String, Object> saveRole(@RequestBody Permission permission) {
        permissionService.updateByPrimaryKeySelective(permission);
        shiroService.updatePermission();
        Map<String, Object> restMap = RestMapBO.getRestMap();
        restMap.put("data", permission);
        return restMap;
    }

    @RequestMapping("/governor/permission/delete")
    public Map<String, Object> deletePermission(@RequestBody Short permissionId) {
        Permission permission = new Permission();
        permission.setId(permissionId);
        permissionService.deleteByPrimaryKey(permission);
        shiroService.updatePermission();
        return RestMapBO.getRestMap();
    }

    @RequestMapping("/governor/authorization/select")
    public Map<String, Object> selectAllAuthorization() {
        Map<String, Object> data = new HashMap<>();
        data.put("roleList", roleService.selectAll());
        data.put("permissionList", permissionService.selectAll());
        Map<String, Object> restMap = RestMapBO.getRestMap();
        restMap.put("data", data);
        return restMap;
    }

    @RequestMapping("/governor/authorization/save")
    public Map<String, Object> addAuthorization(@RequestBody List<RolePermission> permissionRoles) {
        if (permissionRoles.size() > 0) {
            RolePermission rolePermission = new RolePermission();
            rolePermission.setRoleId(permissionRoles.get(0).getRoleId());
            rolePermissionService.deleteByPrimaryKey(rolePermission);
            rolePermissionService.insertList(permissionRoles);
        }
        return RestMapBO.getRestMap();
    }

}
