package com.xbb.blog.controller;

import com.xbb.blog.bo.UploadFileBO;
import com.xbb.blog.bo.RestMapBO;
import com.xbb.blog.constant.SessionConstant;
import com.xbb.blog.entity.User;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Map;

/**
 * @author shiex-薛
 * @title: FileUploadController
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\12 001221:37
 */
@RestController
public class FileUploadController {

    // 支持的上传图片类型
    private static final String FILE_TYPE = "png,jpeg,jpg,bmp,psd,swf,svg";
    // 文件上传限制大小
    private static final int FILE_SIZE_MAX = 10 * 1024 * 1024;

    @RequestMapping(value = "/fileUpload", produces = "application/json;charset=utf-8")
    public Map<String, Object> fileUpload(@RequestParam("file") MultipartFile multipartFile, HttpSession session) {
        Map<String, Object> restMap = RestMapBO.getRestMap();

        UploadFileBO fileUploadBO = new UploadFileBO(multipartFile.getOriginalFilename());
        if (uploadValidation(restMap, fileUploadBO.getSuffix(), multipartFile.getSize())){
            return restMap;
        }

        User user = (User) session.getAttribute(SessionConstant.KEY_USER);
        File tmpFilePath = new File(user.getFileDir(), fileUploadBO.getTmpFileName());
        try {
            multipartFile.transferTo(tmpFilePath);
            String imgUrl = user.getFileRequestPath() + "/" + fileUploadBO.getTmpFileName();
            restMap.put("url", imgUrl);
            restMap.put("data", imgUrl);
        } catch (IOException e) {
            restMap.put("error", 1);
            restMap.put("message", e.getMessage());
            e.printStackTrace();
        }

        return restMap;
    }

    /**
     * 文件上传验证
     * @param restMap
     * @param suffix 后缀
     * @param fileSize 文件大小
     * @return: boolean
     */
    private boolean uploadValidation(Map restMap, String suffix, long fileSize){
        // 文件后缀验证
        if (!FILE_TYPE.contains(suffix)) {
            RestMapBO.setErrorRestMap(restMap, "上传失败：请上传格式为[" + FILE_TYPE + "]文件格式的图片");
            return true;
        }
        // 文件大小限制验证
        if (fileSize > FILE_SIZE_MAX) {
            RestMapBO.setErrorRestMap(restMap, "上传失败：文件大小不得超过10MB");
            return true;
        }
        return false;
    }

}
