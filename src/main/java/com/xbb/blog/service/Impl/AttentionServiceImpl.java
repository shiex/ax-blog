package com.xbb.blog.service.Impl;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.dao.AttentionMapper;
import com.xbb.blog.entity.Attention;
import com.xbb.blog.entity.User;
import com.xbb.blog.service.AttentionService;
import com.xbb.blog.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author shiex-薛
 * @title: AttentionServiceImpl
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\4 000421:00
 */
@Service("attentionService")
public class AttentionServiceImpl implements AttentionService {

    @Resource
    private AttentionMapper attentionMapper;
    @Resource
    private UserService userService;

    @Override
    public int deleteByPrimaryKey(Attention attention) {
        int count = attentionMapper.deleteByPrimaryKey(attention.getId());
        // 被关注者粉丝数量减1
        userService.updateCountDegression(getUser(attention.getFollowId(), true));
        // 用户关注数量减1
        userService.updateCountDegression(getUser(attention.getFansId(), false));
        return count;
    }

    @Override
    public int insertSelective(Attention attention) {
        int count = attentionMapper.insertSelective(attention);
        // 被关注者粉丝数量加1
        userService.updateCountIncreasing(getUser(attention.getFollowId(), true));
        // 用户关注数量加1
        userService.updateCountIncreasing(getUser(attention.getFansId(), false));
        return count;
    }

    @Override
    public int insertList(List<Attention> attentions) {
        return 0;
    }

    @Override
    public List<Attention> selectPageHelperData(PageInfoBO pageInfoBO) {
        return attentionMapper.selectPageHelperData(pageInfoBO);
    }

    @Override
    public int selectCountByUserId(int userId, String queryType) {
        return attentionMapper.selectCountByUserId(userId, queryType);
    }

    private User getUser(int userId, boolean isFollow){
        User user = new User();
        user.setId(userId);
        if (isFollow) {
            user.setFollowCount(1);
        } else {
            user.setFansCount(1);
        }
        return user;
    }

}
