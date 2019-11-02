package com.xbb.blog.service.Impl;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.dao.LeaveMapper;
import com.xbb.blog.entity.Leave;
import com.xbb.blog.service.LeaveService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author shiex-薛
 * @title: LeaveServiceImpl
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\24 002420:16
 */
@Service("leaveService")
public class LeaveServiceImpl implements LeaveService {

    @Resource
    private LeaveMapper leaveMapper;

    @Override
    public int insertSelective(Leave leave) {
        return leaveMapper.insertSelective(leave);
    }

    @Override
    public int insertList(List<Leave> leaves) {
        return leaveMapper.insertList(leaves);
    }

    @Override
    public int updateByPrimaryKeySelective(Leave leave) {
        return leaveMapper.updateByPrimaryKeySelective(leave);
    }

    @Override
    public int deleteByPrimaryKey(Leave leave) {
        return 0;
    }

    @Override
    public Leave selectOne(Leave leave) {
        return null;
    }

    @Override
    public Leave selectByPrimaryKey(Leave leave) {
        return null;
    }

    @Override
    public List<Leave> select(Leave leave) {
        return leaveMapper.select(leave);
    }

    @Override
    public List<Leave> selectAll() {
        return leaveMapper.selectAll();
    }

    @Override
    public int selectCount(Leave leave) {
        return leaveMapper.selectCount(leave);
    }

    @Override
    public List<Leave> selectByExample(Example example) {
        return null;
    }

    @Override
    public List<Leave> selectDataPageHelper(PageInfoBO pageInfoBO) {
        return null;
    }
}
