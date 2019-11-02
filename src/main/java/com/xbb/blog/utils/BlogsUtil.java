package com.xbb.blog.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author shiex-薛
 * @title: ArticleDateUtils
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\4 000415:01
 */
public class BlogsUtil {

    private static final int TIME = 1000 * 60;   //分钟
    private static final int HOUR = 60 * TIME;  //小时
    private static final int DAY = 24 * HOUR;  //天
    private static final long WEEK = 7 * DAY;  //星期
    private static final long MONTH = 4 * WEEK;  //月（28天算一个月）

    /**
     * 计算博客发布时间到目前时间的时差
     *
     * @param start
     * @param end
     * @return: java.lang.String
     */
    public static String timeInterval(long start, long end){
        long time = (end - start) / TIME;
        if(time >= 59){
            return hourInterval(start, end);
        }
        time += 1;
        return time + "分钟前";
    }

    public static String hourInterval(long start, long end){
        long hour = (end - start) / HOUR;
        if(hour >= 23){
            return dayInterval(start, end);
        }
        hour += 1;
        return hour + "小时前";
    }

    public static String dayInterval(long start, long end){
        long day = (end - start) / DAY;
        if(day >= 6){
            return weekInterval(start, end);
        }
        day += 1;
        return day + "天前";
    }

    public static String weekInterval(long start, long end){
        long week = (end - start) / WEEK;
        if(week >= 3){
            return monthInterval(start, end);
        }
        week += 1;
        return week + "星期前";
    }

    public static String monthInterval(long start, long end){
        long month = (end - start) / MONTH;
        month += 1;
        return month + "个月前";
    }


}
