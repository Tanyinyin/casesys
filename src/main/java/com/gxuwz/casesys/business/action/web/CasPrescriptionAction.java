package com.gxuwz.casesys.business.action.web;

import com.alibaba.fastjson.JSONObject;
import com.gxuwz.casesys.business.entity.CasCase;
import com.gxuwz.casesys.business.entity.CasPrescription;
import com.gxuwz.casesys.business.service.ICasPrescriptionService;
import com.gxuwz.casesys.util.JsonBean;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.PrintWriter;
import java.util.List;



public class CasPrescriptionAction extends BaseAction implements Preparable, ModelDriven{
	private static final long serialVersionUID = -2313123L; 
	protected static final String LIST_JSP = "/WEB-INF/page/web/CasPrescription_list.jsp";
	

	@Autowired
	private ICasPrescriptionService casPrescriptionService;
	private CasPrescription casPrescription;// 处方模型
	//private Result<CasCase> casCasePageResult;// 分页
	private Result<CasPrescription> pageResult;// 分页
  //private String visitime;
	//private Integer id;
	// 返回json
	private JSONObject data;
	
	@Override
	public void prepare() throws Exception {
		if(null == casPrescription){
			casPrescription = new CasPrescription();
		}
	}
	@Override
	public Object getModel() {
		return casPrescription;
	}

	/**
	 * 获取处方列表
	 * @return
	 * @throws Exception
	 */
	public String list()throws Exception{
		pageResult = casPrescriptionService.find(casPrescription, getPage(), getRow());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}
	/**
	 * 删除
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception{
		String id = getParameters("id", null);
		String prescriptionName = getParameters("prescriptionName", null);
		System.out.println(id);
		//System.out.println(prescriptionName);
		//casPatientService.delete(patientCode);
		return list();
	}
	
	public CasPrescription getCasPrescription() {
		return casPrescription;
	}
	public void setCasPrescription(CasPrescription casPrescription) {
		this.casPrescription = casPrescription;
	}
	public ICasPrescriptionService getCasPrescriptionService() {
		return casPrescriptionService;
	}
	public void setCasPrescriptionService(ICasPrescriptionService casPrescriptionService) {
		this.casPrescriptionService = casPrescriptionService;
	}
	public Result<CasPrescription> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<CasPrescription> pageResult) {
		this.pageResult = pageResult;
	}

	public JSONObject getData() {
		return data;
	}

	public void setData(JSONObject data) {
		this.data = data;
	}
}
