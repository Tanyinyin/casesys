package com.gxuwz.core.oss.api;

import com.gxuwz.core.oss.constant.FileCategory;
import com.gxuwz.core.oss.constant.ImgCategory;


/**
 * Created by Administrator on 2017/9/27/027.
 */
public interface IUploadFileService {

    /**
     * 下载文件
     * @param name
     */
    public void downloadContent(String name);

    /**
     * 上传图片
     * 
     * @param imgByte		图片文件字节数组
     * @param ic			使用范畴
     * 	
     * @return 成功上传url
     */
    public String uploadImg(byte[] imgByte, ImgCategory ic);

    /**
     * 上传图片
     *
     * @param imgByte		图片文件字节数组
     * @param fileName		文件名， 不带后缀(用作覆盖图片用户)
     * @param ic			使用范畴
     *
     * @return 成功上传url
     */
    public String uploadImg(byte[] imgByte, String fileName, ImgCategory ic);

    /**
    * 上传文件
    * 
    * @param fileByte		文件字节数组
    * @param fileType		文件类型（后缀）
    * @param fc				使用范畴
    * 	
    * @return 成功上传url
    */
   public String uploadFile(byte[] fileByte, String fileType, FileCategory fc);

}
