package com.gxuwz.casesys.business.action.web;

import com.alibaba.fastjson.JSONObject;
import com.gxuwz.casesys.business.service.IOssUploadFileService;
import com.gxuwz.casesys.util.JsonBean;
import com.gxuwz.core.oss.constant.ImgCategory;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;


/**
 * 测试类
 * @author  tyy
 */
public class TestAction extends BaseAction implements Preparable, ModelDriven{

	private static final long serialVersionUID = -2313123L;

	@Autowired
	private IOssUploadFileService iUploadFileService;


	// 文件名字
	private File file;
	private String fileName;

	// 返回json
	private JSONObject data;


    /**
     * 上传文件
	 * @return
     * @throws Exception
	 */
	public String upload() throws Exception {
		String filePath = iUploadFileService.uploadContent(file, ImgCategory.test);
		System.out.println(filePath);
		data = JsonBean.success("success",filePath);
		return SUCCESS;
	}

	public JSONObject getData() {
		return data;
	}

	public void setData(JSONObject data) {
		this.data = data;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}



	@Override
	public Object getModel() {
		return null;
	}

	@Override
	public void prepare() throws Exception {

	}
}
