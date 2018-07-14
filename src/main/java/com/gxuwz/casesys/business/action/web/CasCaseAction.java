package com.gxuwz.casesys.business.action.web;

import com.alibaba.fastjson.JSONObject;
import com.gxuwz.casesys.business.entity.CasCase;
import com.gxuwz.casesys.business.entity.CasPatient;
import com.gxuwz.casesys.business.service.ICasCaseService;
import com.gxuwz.casesys.business.service.ICasPatientService;
import com.gxuwz.casesys.util.JsonBean;
import com.gxuwz.core.pagination.Result;
import com.gxuwz.core.web.action.BaseAction;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.PrintWriter;
import java.util.List;



public class CasCaseAction extends BaseAction implements Preparable, ModelDriven{
	private static final long serialVersionUID = -2313123L; 
	protected static final String LIST_JSP = "/WEB-INF/page/web/CasCase_list.jsp";
	protected static final String ADD_JSP = "/WEB-INF/page/web/CasCase_add.jsp";
	protected static final String MESSAGE_JSP = "/WEB-INF/page/web/CasCase_message.jsp";
	protected static final String EDIT_JSP = "/WEB-INF/page/web/CasCase_edit.jsp";

	@Autowired
	private ICasPatientService casPatientService;
	@Autowired
	private ICasCaseService casCaseService;
	private CasCase casCase;
	private CasPatient casPatient;// 病人模型
	private Result<CasCase> casCasePageResult;// 分页
	private Result<CasPatient> pageResult;// 分页
	private String visitime;
	private Integer id;
	// 返回json
	private JSONObject data;
	
	@Override
	public void prepare() throws Exception {
		if(null == casPatient){
			casPatient = new CasPatient();
		}
	}

	/**
	 * 跳转病例信息页面
	 * @return
	 */
	public String openMessage() {
		String patientCode = getParameters("patientCode",null);
		casPatient = casPatientService.findByPatientCode(patientCode);
		setForwardView(MESSAGE_JSP);
		return SUCCESS;
	}
	/**
	 * 跳转病例修改页面
	 * @return
	 */
	public String openEdit() {
		try {
			Integer id = getParametersToInteger("id",null);
			casCase = casCaseService.getCaseById(id);
			setForwardView(EDIT_JSP);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return SUCCESS;
	}


	
	@Override
	public Object getModel() {
		return casCase;
	}

	/**
	 * 获取病例列表
	 * @return
	 * @throws Exception
	 */
	public String patientList() throws Exception {
		//System.out.println("=============");
		//System.out.println(casPatient.getPatientName());
		pageResult = casPatientService.find(casPatient, getPage(), getRow());
		setForwardView(LIST_JSP);
		return SUCCESS;
	}
	
	public String list() throws Exception {
		String patientCode = getParameters("patientCode", null);
		List<CasCase> cas = casCaseService.getAllCasesByPatientCode(patientCode);
		if (cas == null || cas.size() == 0) {
			data = JsonBean.error("该病人为初诊！");
		} else {
			data = JsonBean.success("success",cas);
		}
	    return SUCCESS;
	}


	/**
	 * 获取病例列表
	 * @return
	 * @throws Exception
	 */
	public String add() throws Exception {
		System.out.println(com.alibaba.fastjson.JSON.toJSON(casCase));
		casCase = casCaseService.add(casCase);
		data = JsonBean.success("success",casCase); // 病例的model 已经获取到值，差加入到数据库
		return SUCCESS;
	}
	
	public String edit() throws Exception {
		System.out.println(com.alibaba.fastjson.JSON.toJSON(casCase));
		//casCase = casCaseService.edit(casCase);
		data = JsonBean.success("success",casCase); // 病例的model 已经获取到值，差加入到数据库
		return SUCCESS;
	}
	
	public String update() {
		System.out.println(com.alibaba.fastjson.JSON.toJSON(casCase));
		casCaseService.update(casCase);
		data = JsonBean.success("success"); // 病例的model 已经获取到值，差加入到数据库
		return SUCCESS;
	}
	
	/**
	 * 删除
	 * @return
	 * @throws Exception
	 */
	public String delete() throws Exception{
		Integer id = getParametersToInteger("id",null);
		System.out.println("visitime:"+visitime+"id:"+id);
		casCaseService.delete(id);
		data = JsonBean.success("success");
		return SUCCESS;
	}



	public CasCase getCasCase() {
		return casCase;
	}

	public CasPatient getCasPatient() {
		return casPatient;
	}
	public void setCasPatient(CasPatient casPatient) {
		this.casPatient = casPatient;
	}
	public void setCasCase(CasCase casCase) {
		this.casCase = casCase;
	}

	public ICasPatientService getCasPatientService() {
		return casPatientService;
	}

	public void setCasPatientService(ICasPatientService casPatientService) {
		this.casPatientService = casPatientService;
	}

	public Result<CasCase> getCasCasePageResult() {
		return casCasePageResult;
	}

	public void setCasCasePageResult(Result<CasCase> casCasePageResult) {
		this.casCasePageResult = casCasePageResult;
	}

	public Result<CasPatient> getPageResult() {
		return pageResult;
	}

	public void setPageResult(Result<CasPatient> pageResult) {
		this.pageResult = pageResult;
	}

	public JSONObject getData() {
		return data;
	}

	public void setData(JSONObject data) {
		this.data = data;
	}
}
