package com.xbb.blog.service;

import com.xbb.blog.bo.PageInfoBO;
import com.xbb.blog.entity.Attention;
import com.xbb.blog.service.base.BaseCrudService;
import com.xbb.blog.service.base.BaseDeleteService;
import com.xbb.blog.service.base.BaseInsertService;
import org.springframework.ui.Model;

import java.util.List;

/**
 * @author shiex-薛
 * @title: AttentionService
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\4 000421:00
 */
public interface AttentionService extends BaseInsertService<Attention>, BaseDeleteService<Attention> {
    List<Attention> selectPageHelperData(PageInfoBO pageInfoBO);

    int selectCountByUserId(int userId, String queryType);

}
