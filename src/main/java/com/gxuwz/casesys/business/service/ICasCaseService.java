package com.gxuwz.casesys.business.service;

import java.util.List;

import com.gxuwz.casesys.business.entity.CasCase;

public interface ICasCaseService {
	//添加病例
	CasCase add(CasCase casCase);
	//通过病人编号查找所有病例
	public List<CasCase> getAllCasesByPatientCode(String patientCode );
	//通过id查找病例
	public CasCase getCaseById(int id);
	
	public void update(CasCase casCase);
	//病例的删除
	 public void delete(Integer id);

}
