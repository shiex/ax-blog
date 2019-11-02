package com.xbb.blog.service;

import java.util.Map;

/**
 * @author shiex-薛
 * @title: ShiroService
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\8 000818:47
 */
public interface ShiroService {
    Map<String, String> loadFilterChainDefinitions();
    void updatePermission();
}
