package com.xbb.blog.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author shiex-薛
 * @title: DateUtil
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\6 000622:09
 */
public class DateUtil {

    private static final String FORMAT_DATE_TIME = "yyyy-MM-dd HH:mm:ss";
    private static final String FORMAT_DATE = "yyyy-MM-dd";
    private static final String FORMAT_DATE2 = "yyyy/MM/dd";
    private static final String FORMAT_TIME = "HH:mm:ss";

    public static String getFormatDateTime(){
        return new SimpleDateFormat(FORMAT_DATE_TIME).format(new Date());
    }

    public static String getFormatDate(){
        return new SimpleDateFormat(FORMAT_DATE).format(new Date());
    }

    public static String getFormatDate2(){
        return new SimpleDateFormat(FORMAT_DATE2).format(new Date());
    }

    public static String getFormatTime(){
        return new SimpleDateFormat(FORMAT_TIME).format(new Date());
    }
}
