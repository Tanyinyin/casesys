package com.gxuwz.casesys.business.service.impl;


import com.gxuwz.casesys.business.service.IOssUploadFileService;
import com.gxuwz.core.oss.api.IUploadFileService;
import com.gxuwz.core.oss.constant.FileCategory;
import com.gxuwz.core.oss.constant.ImgCategory;
import com.gxuwz.core.oss.helper.CommonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

@Service("IOssUploadFileService")
public class OssUploadFileServiceImpl implements IOssUploadFileService {


    private Logger logger = LoggerFactory.getLogger(OssUploadFileServiceImpl.class);
    @Autowired
    private IUploadFileService uploadFileService;


    /**
     * 上传图片
     *
     * @param file
     * @param ic
     * @return
     */
    @Override
    public String uploadContent(File file, ImgCategory ic) {
        String imgUrl = null;
        try {
            imgUrl = uploadFileService.uploadImg(CommonUtil.inputStreamToByteArray(new FileInputStream(file)), ic);
        } catch (IOException e) {
            logger.error("上传失败，原因是" + e.getMessage());
            e.printStackTrace();
        }
        return imgUrl;
    }

    @Override
    public void downloadFile(String key) {

    }

    /**
     * 上传文件
     *
     * @param file
     * @param ic
     * @return
     */
    @Override
    public String uploadContent(File file, FileCategory ic) {
        String fileUrl = null;
        try {
            String fileType = CommonUtil.getFileType(file.getName());
            fileUrl = uploadFileService.uploadFile(CommonUtil.inputStreamToByteArray(new FileInputStream(file)), fileType, ic);
        } catch (IOException e) {
            logger.error("上传失败，原因是" + e.getMessage());
            e.printStackTrace();
        }
        return fileUrl;
    }

}
