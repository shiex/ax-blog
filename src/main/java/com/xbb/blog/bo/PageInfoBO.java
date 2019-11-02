package com.xbb.blog.bo;

import java.util.List;

/**
 * @author shiex-薛
 * @title: ArticlePageInfoBO
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\1 000114:31
 */
public class PageInfoBO<T> {

    private Integer page; // 页码
    private Integer limit; // 数量
    private Integer id; // 查询条件
    private String queryType; // 查询类型
    private Integer total; // 总数量
    private List<T> list; // 结果集

    public PageInfoBO(){
    }

    public PageInfoBO(int id, int page, int limit) {
        this.id = id;
        this.page = page;
        this.limit = limit;
    }

    public PageInfoBO(int id, String queryType, int page, int limit) {
        this.id = id;
        this.queryType = queryType;
        this.page = page;
        this.limit = limit;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQueryType() {
        return queryType;
    }

    public void setQueryType(String queryType) {
        this.queryType = queryType;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
