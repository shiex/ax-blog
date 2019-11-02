package com.xbb.blog.bo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author shiex-薛
 * @title: RestMap
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\3 000321:13
 */
public class RestMapBO {

    private static final String ERROR = "error";
    private static final String REASON = "reason";
    private static final String OK = "ok";
    private static final int SUCCEED = 0;
    private static final int FAILER = -1;

    /**
     * restMap默认应答成功
     * @param
     * @return: java.util.Map
     */
    public static Map<String, Object> getRestMap() {
        Map <String, Object> restMap = new HashMap<>();
        restMap.put(ERROR, SUCCEED);
        restMap.put(REASON, OK);
        return restMap;
    }

    /**
     * 出错时，修改restMap应答状态
     * @param restMap
     * @param error
     * @param message
     * @return: void
     */
    public static void setErrorRestMap(Map restMap, String error, String message) {
        restMap.put(error, FAILER);
        restMap.put(REASON, message);
    }

    /**
     * 出错时，修改restMap应答状态
     * @param message
     * @return: void
     */
    public static void setErrorRestMap(Map <String, Object> restMap, String message) {
        restMap.put(ERROR, FAILER);
        restMap.put(REASON, message);
    }

}
