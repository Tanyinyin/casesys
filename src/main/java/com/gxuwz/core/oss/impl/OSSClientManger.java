package com.gxuwz.core.oss.impl;

import com.aliyun.oss.OSSClient;
import com.gxuwz.core.util.ConfigUtil;


public class OSSClientManger {

    public static String endpoint = ConfigUtil.getValue("upload.img.endpoint");
    private static String accessKeyId = ConfigUtil.getValue("upload.img.accessKeyId");
    private static String accessKeySecret = ConfigUtil.getValue("upload.img.accessKeySecret");
    public static String  bucketName= ConfigUtil.getValue("upload.img.bucketName");
    
    private static OSSClient ossClient;

    /**
     * 
    * 创建一个新的实例 OSSClientManger.
    * 初始化
     */
    public OSSClientManger (){
    	init();
    }
    
    /**
     * 初始化
     */
    public void init() {
       ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
    }
   
    /**
     * 销毁
     */
    public void destory() {
      ossClient.shutdown();
    }
    
    /**
     * 
    * @Title: getOSSClient
    * @Description: TODO(获取一个实例)
    * @param @return    参数
    * @return OSSClient    返回类型
    * @throws
     */
    public OSSClient getOSSClient(){
    	return ossClient;
    }
    
    private static class OSSClientHandle{
    	public static OSSClientManger manager = new OSSClientManger (); 
    }
    
    public static OSSClientManger getInstance(){
    	return OSSClientHandle.manager;
    }
}
