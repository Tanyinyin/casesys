package com.gxuwz.casesys.business.service;

import com.gxuwz.core.oss.constant.FileCategory;
import com.gxuwz.core.oss.constant.ImgCategory;

import java.io.File;

/**
 * 上传文件内容
 */
public interface IOssUploadFileService {

    /**
     * 上传文件内容
     */
    public String uploadContent(File file, ImgCategory ic);


    /**
     * 下载文件
     */
    public void downloadFile(String key);

    /**
     * 上传文件内容
     */
    public String uploadContent(File file, FileCategory ic);

}
