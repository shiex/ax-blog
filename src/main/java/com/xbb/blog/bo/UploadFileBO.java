package com.xbb.blog.bo;

import com.xbb.blog.utils.FileUploadUtil;

/**
 * @author shiex-薛
 * @title: FileUploadBO
 * @projectName ax-blog
 * @description: TODO
 * @date 2019\8\5 00050:05
 */
public class UploadFileBO {

    private String originalFilename;
    private String suffix;
    private String tmpFileName;

    private UploadFileBO(){}

    public UploadFileBO(String originalFilename){
        this.originalFilename = originalFilename;
        this.suffix = FileUploadUtil.fileSuffix(this.originalFilename);
        this.tmpFileName = FileUploadUtil.createTmpFileName(this.suffix);
    }

    public String getOriginalFilename() {
        return originalFilename;
    }

    public String getSuffix() {
        return suffix;
    }

    public String getTmpFileName() {
        return tmpFileName;
    }

}
