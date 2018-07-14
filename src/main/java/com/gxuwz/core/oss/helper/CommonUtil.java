package com.gxuwz.core.oss.helper;

import java.io.IOException;
import java.io.InputStream;

/**
 * Created by Administrator on 2017/9/27/027.
 */
public class CommonUtil {

    /**
     * 输入流转字节数组
     * @param input
     * @return
     * @throws IOException
     */
    public static byte[] inputStreamToByteArray(InputStream input) throws IOException {
        byte[] byt = new byte[input.available()];
        input.read(byt);
        return byt;
    }

    /**
     * Description: 判断OSS服务文件上传时文件的contentType
     *
     * @param FilenameExtension 文件后缀
     * @return String
     */
    public static String getContentType(String FilenameExtension) {
        if (FilenameExtension.equalsIgnoreCase("bmp")) {
            return "image/bmp";
        }
        if (FilenameExtension.equalsIgnoreCase("gif")) {
            return "image/gif";
        }
        if (FilenameExtension.equalsIgnoreCase("jpeg") ||
                FilenameExtension.equalsIgnoreCase("jpg") ||
                FilenameExtension.equalsIgnoreCase("png")) {
            return "image/jpeg";
        }
        if (FilenameExtension.equalsIgnoreCase("pdf")){
            return "application/pdf";
        }
        if (FilenameExtension.equalsIgnoreCase("html")) {
            return "text/html";
        }
        if (FilenameExtension.equalsIgnoreCase("txt")) {
            return "text/plain";
        }
        if (FilenameExtension.equalsIgnoreCase("vsd")) {
            return "application/vnd.visio";
        }
        if (FilenameExtension.equalsIgnoreCase("pptx") ||
                FilenameExtension.equalsIgnoreCase("ppt")) {
            return "application/vnd.ms-powerpoint";
        }
        if (FilenameExtension.equalsIgnoreCase("docx") ||
                FilenameExtension.equalsIgnoreCase("doc")) {
            return "application/msword";
        }
        if (FilenameExtension.equalsIgnoreCase("xml")) {
            return "text/xml";
        }
        return null;
    }

    /**
     * 获取文件的类型
     * @param name
     * @return
     */
    public static String getFileType(String name) {
        return name.substring(name.lastIndexOf(".") + 1);
    }

    /**
     * 获取文件名字
     * @param name
     * @return
     */
    public static String getFileName(String name) {
        return name.substring(0,name.lastIndexOf("."));
    }

}
