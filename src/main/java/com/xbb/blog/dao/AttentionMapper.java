package com.xbb.blog.dao;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.entity.Attention;
import com.xbb.blog.tk.mybatis.TkMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AttentionMapper extends TkMapper<Attention> {
    List<Attention> selectPageHelperData(PageInfoBO pageInfoBO);

    int selectCountByUserId(@Param("userId") int userId,
                            @Param("queryType") String queryType);
}