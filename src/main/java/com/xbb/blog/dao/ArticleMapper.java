package com.xbb.blog.dao;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.entity.Article;
import com.xbb.blog.tk.mybatis.TkMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleMapper extends TkMapper<Article> {

    /**
     * 主页博客下拉分页数据
     * @param pageInfoBO 查询条件
     * @return: java.util.List<com.xbb.blog.entity.Article>
     */
    List<Article> selectDataPageHelper(PageInfoBO pageInfoBO);

    /**
     * 查询博客以及用户对应信息
     * @param articleId
     * @param articleId
     * @return: com.xbb.blog.entity.Article
     */
    Article selectOneById(@Param("articleId") int articleId,
                          @Param("userId") int userId);

    /**
     * 在推荐博客随机抽取
     * @param userId
     * @param count 返回数量
     * @return: java.util.List<com.xbb.blog.entity.Article>
     */
    List<Article> selectAllRecommend(int userId);

    /**
     * 用户热门博客，按阅读量排序
     * @param userId
     * @return: java.util.List<com.xbb.blog.entity.Article>
     */
    List<Article> selectAllHot(int userId);

    /**
     * 首页热门博客，按阅读量排序
     * @param count 返回数量
     * @return: java.util.List<com.xbb.blog.entity.Article>
     */
    List<Article> selectAllIndexHot(int count);

    /**
     * 阅读量、点赞量、评论量递增
     * @param article
     * @return: int
     */
    int updateCountIncreasing(Article article);

    /**
     * 阅读量、点赞量、评论量递减
     * @param article
     * @return: int
     */
    int updateCountDegression(Article article);

    /**
     * 修改博客状态
     * @param article
     * @return: int
     */
    int updateStatus(Article article);

    /**
     * 博客管理界面，博客标签分页数据
     * @param pageInfoBO
     * @return: java.util.List<com.xbb.blog.entity.Article>
     */
    List<Article> selectDataPageHelper2(PageInfoBO pageInfoBO);
}