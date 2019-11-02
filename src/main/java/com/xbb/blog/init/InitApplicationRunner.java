package com.xbb.blog.init;

import com.xbb.blog.constant.WebPathConstant;
import com.xbb.blog.utils.GenerateHtmlUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;
import org.springframework.util.ResourceUtils;

import java.io.File;
import java.io.IOException;

/**
 * @author shiex-薛
 * @title: InitApplicationRunner
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\2 000220:55
 */
@Component
public class InitApplicationRunner implements ApplicationRunner {

    private static Logger log = LoggerFactory.getLogger(InitApplicationRunner.class);

    /**
     * 初始化加载
     * @param args
     * @return: void
     */
    @Override
    public void run(ApplicationArguments args) throws Exception {
        try{
            WebPathConstant.STORAGE_PATH = ResourceUtils.getURL("classpath:").getPath().substring(1);
            WebPathConstant.STATIC_PATH = WebPathConstant.STORAGE_PATH + "static";
            WebPathConstant.TEMPLATES_PATH = WebPathConstant.STORAGE_PATH + "templates";
            GenerateHtmlUtil.i.init(new File(WebPathConstant.TEMPLATES_PATH));
            log.info(WebPathConstant.STORAGE_PATH);
            log.info(WebPathConstant.STATIC_PATH);
            log.info(WebPathConstant.TEMPLATES_PATH);
        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
