package com.xbb.blog.service.Impl;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.dao.ArticleMapper;
import com.xbb.blog.dao.CommentMapper;
import com.xbb.blog.entity.Article;
import com.xbb.blog.entity.Comment;
import com.xbb.blog.service.ArticleService;
import com.xbb.blog.service.CommentService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author shiex-薛
 * @title: CommentServiceImpl
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\3 000320:34
 */
@Service("commentService")
public class CommentServiceImpl implements CommentService {

    @Resource
    private CommentMapper commentMapper;
    @Resource
    private ArticleService articleService;

    @Override
    public List<Comment> selectAllAndReply(Integer articleId) {
        return commentMapper.selectAllAndReply(articleId);
    }

    @Override
    public int insertSelective(Comment comment) {
        int count = commentMapper.insertSelective(comment);

        Article article = new Article();
        article.setId(comment.getArticleId());
        article.setCommentCount(1);
        articleService.updateCountIncreasing(article);

        return count;
    }

    @Override
    public int updateReplyCountIncreasing(int commentId) {
        return commentMapper.updateReplyCountIncreasing(commentId);
    }

    @Override
    public int deleteByPrimaryKey(Comment comment) {
        return commentMapper.deleteByPrimaryKey(comment.getId());
    }

    @Override
    public int insertList(List<Comment> comments) {
        return 0;
    }



}
