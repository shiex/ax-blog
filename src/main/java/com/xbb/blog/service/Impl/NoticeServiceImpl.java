package com.xbb.blog.service.Impl;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.dao.NoticeMapper;
import com.xbb.blog.entity.Notice;
import com.xbb.blog.service.NoticeService;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author shiex-薛
 * @title: NoticeServiceImpl
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\28 002816:43
 */

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

    @Resource
    private NoticeMapper noticeMapper;

    @Override
    public int deleteByPrimaryKey(Notice notice) {
        return noticeMapper.deleteByPrimaryKey(notice);
    }

    @Override
    public int insertSelective(Notice notice) {
        return noticeMapper.insertSelective(notice);
    }

    @Override
    public int insertList(List<Notice> notices) {
        return noticeMapper.insertList(notices);
    }

    @Override
    public int selectCount(Notice notice) {
        return noticeMapper.selectCount(notice);
    }

    @Override
    public Notice selectByPrimaryKey(Notice notice) {
        return noticeMapper.selectByPrimaryKey(notice);
    }

    @Override
    public Notice selectOne(Notice notice) {
        return noticeMapper.selectOne(notice);
    }

    @Override
    public List<Notice> select(Notice notice) {
        return noticeMapper.select(notice);
    }

    @Override
    public List<Notice> selectAll() {
        return noticeMapper.selectAll();
    }

    @Override
    public List<Notice> selectByExample(Example example) {
        return noticeMapper.selectByExample(example);
    }

    @Override
    public List<Notice> selectDataPageHelper(PageInfoBO pageInfoBO) {
        return noticeMapper.selectDataPageHelper(pageInfoBO);
    }

    @Override
    public int updateByPrimaryKeySelective(Notice notice) {
        return noticeMapper.updateByPrimaryKeySelective(notice);
    }
}
