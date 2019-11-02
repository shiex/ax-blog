package com.xbb.blog.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xbb.blog.AxBlogApplicationTests;
import com.xbb.blog.constant.WebPathConstant;
import com.xbb.blog.dao.ArticleMapper;
import com.xbb.blog.dao.ClassifyMapper;
import com.xbb.blog.dao.UserMapper;
import com.xbb.blog.entity.Article;
import com.xbb.blog.entity.Classify;
import com.xbb.blog.entity.User;
import com.xbb.blog.service.ArticleService;
import com.xbb.blog.service.PageHelperService;
import com.xbb.blog.service.UserService;
import com.xbb.blog.utils.BlogsUtil;
import com.xbb.blog.utils.DateUtil;
import com.xbb.blog.utils.MD5Util;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.junit.Test;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;

import java.awt.print.Book;
import java.io.File;
import java.util.List;

/**
 * @author shiex-薛
 * @title: UserControllerTest
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\4 000415:22
 */
public class UserControllerTest extends AxBlogApplicationTests {

    @Resource
    private UserService userService;
    @Resource
    private PageHelperService pageHelperService;
    @Resource
    private ArticleService articleService;

    @Test
    public void login() {
        pageHelperService.getPageInfoData(
                articleService,
                new Example(Article.class),
                0,
                10
        );
    }

    @Test
    public void register(){
        User registerUser = new User();
        registerUser.setUsername("用户1");
        registerUser.setPassword("1");

        User selectUser = new User();
        selectUser.setUsername(registerUser.getUsername());
        User user = userService.selectOne(selectUser);
        System.out.println(user.toString());
        /*if(user == null){
            String encryptPassword = MD5Util.encrypt(
                    registerUser.getUsername(), registerUser.getPassword());
            registerUser.setPassword(encryptPassword);
            userService.insertSelective(registerUser);

            // 生成用户上传文件存储目录
            String filePath = DateUtil.getFormatDate2();
            WebPathConstant.WEB_CONTEXT_PATH = "e:/";
            StringBuilder fileDirPath = new StringBuilder(WebPathConstant.WEB_CONTEXT_PATH)
                    .append(filePath)
                    .append("/")
                    .append(registerUser.getId());
            File fileDir = new File(fileDirPath.toString());
            fileDir.mkdirs();
        }*/

    }

    /**
     * 测试分页查询
     */
    @Test
    public void testPage() {
        int count = articleService.selectCount(new Article());
        System.out.println(count);
        // PageHelper 使用非常简单，只需要设置页码和每页显示笔数即可
        PageHelper.startPage(0, 10);

        // 设置分页查询条件
        Example example = new Example(Article.class);
        PageInfo<Article> pageInfo = new PageInfo<>(articleService.selectByExample(example));

        // 获取查询结果
        List<Article> articleList = pageInfo.getList();
        for (Article article : articleList) {
            System.out.println(article.getId());
        }
    }

    @Test
    public void m1(){
        User user = new User();
        user.setId(1);
        user.setFollowCount(1);
        user.setFansCount(1);
        userService.updateCountIncreasing(user);
    }

    @Test
    public void userIndex(){
        /*Article article = new Article();
        article.setUserId(1);
        List<Article> articleList = articleService.select(article);
        System.out.println(articleList.size());

        User user = userService.selectByPrimaryKey(1);
        System.out.println(user.toString());*/

        /*Example example = new Example(Article.class);
        example.createCriteria().andEqualTo("userId", 1);
        PageHelper.startPage(0, 10);
        PageInfo<Article> pageInfo = new PageInfo<>(articleService.selectByExample(example));
        List<Article> articleList1 = pageInfo.getList();
        for (Article article : articleList1) {
            System.out.println(article.getReadCount());
        }*/
    }

    @Test
    public void editData() {
        User user = new User();
    }
}