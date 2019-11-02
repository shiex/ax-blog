package com.xbb.blog.utils;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;

import java.io.*;

/**
 * @author shiex-薛
 * @title: GenerateHtml
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\6 000623:05
 */
public class GenerateHtmlUtil {

    public static GenerateHtmlUtil i = new GenerateHtmlUtil(); // 单例

    protected Configuration frmkConfig;
    protected File appDir;

    /**
     * @param appDir 模板根目录
     * @description: 初始化frmkConfig
     * @return: void
     */
    public synchronized void init(File appDir) {
        if (this.appDir != null) return;  //只加载一次
        this.appDir = appDir;
        try {
            frmkConfig = new Configuration(Configuration.VERSION_2_3_28);
            frmkConfig.setDirectoryForTemplateLoading(appDir); // 设置模板根目录
            frmkConfig.setDefaultEncoding("UTF-8");
            frmkConfig.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
            frmkConfig.setLogTemplateExceptions(false);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成静态页面
     *
     * @param template 模板文件路径
     * @param model    数据
     * @param htmlPath 页面存储位置
     * @return: java.lang.String
     */
    public void generateHtml(String template, Object model, String htmlPath) throws Exception {
        if (appDir == null) throw new Exception("init()初始化启动失败!");

        File htmlFile = new File(appDir, htmlPath);
        FileOutputStream fileOut = new FileOutputStream(htmlFile);
        OutputStreamWriter out = new OutputStreamWriter(fileOut, "UTF-8");
        try {
            Template tp = frmkConfig.getTemplate(template);
            if (tp == null) throw new Exception("[error] -----> 模板路径不存在!");
            tp.process(model, out);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 确保文件句柄被关闭
            try {
                out.close();
            } catch (Exception e) {
            }
        }
    }

}
