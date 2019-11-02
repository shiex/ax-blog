package com.xbb.blog.controller;

import com.xbb.blog.bo.RestMapBO;
import com.xbb.blog.bo.UploadFileBO;
import com.xbb.blog.constant.SessionConstant;
import com.xbb.blog.entity.User;
import com.xbb.blog.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Map;

/**
 * @author shiex-薛
 * @title: UploadFileController
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\9\1 000121:31
 */
@RestController
public class UploadFileController {

    @Resource
    private UserService userService;

    private static final String IMG_TYPE_VERIFY = "png,jpeg,jpg,bmp,psd,swf,svg"; // 支持上传的图片类型
    private static final int IMG_SIZE_MAX = 10 * 1024 * 1024;    // 图片上传限制大小

    @RequestMapping("/upload/file/{type}")
    public Map<String, Object> uploadFile(@RequestParam("file") MultipartFile multipartFile,
                                          @PathVariable("type") String type, HttpSession session) {
        Map<String, Object> restMap = RestMapBO.getRestMap();
        if (multipartFile != null) {
            UploadFileBO uploadFileBO = new UploadFileBO(multipartFile.getOriginalFilename());

            // 图片上传验证
            if (!IMG_TYPE_VERIFY.contains(uploadFileBO.getSuffix())) {
                RestMapBO.setErrorRestMap(restMap, "上传失败：请上传格式为[" + IMG_TYPE_VERIFY + "]的图片");
                return restMap;
            }
            if (multipartFile.getSize() > IMG_SIZE_MAX) {
                RestMapBO.setErrorRestMap(restMap, "上传失败：图片大小不得超过10MB");
                return restMap;
            }

            User user = (User) session.getAttribute(SessionConstant.KEY_USER);
            File tmpFile = new File(user.getFileDir(), uploadFileBO.getTmpFileName());
            String imgRequestPath = user.getFileRequestPath() + "/" + uploadFileBO.getTmpFileName();

            if (StringUtils.equals(type, "user")) {
                // 用户修改头像，删除之前的本地头像
                int p = user.getHeadPortrait().lastIndexOf("/");
                File headPortraitFile = new File(user.getFileDir(), user.getHeadPortrait().substring(p));
                headPortraitFile.delete();
                user.setHeadPortrait(imgRequestPath);
                userService.updateByPrimaryKeySelective(user);
            }

            try{
                multipartFile.transferTo(tmpFile); // 写入图片
                restMap.put("errno", 0);
                restMap.put("imgUrl", imgRequestPath);
            }catch (IOException e) {
                e.printStackTrace();
            }
        }

        return restMap;
    }
}
