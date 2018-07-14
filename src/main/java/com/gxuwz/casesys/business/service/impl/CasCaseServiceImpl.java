package com.gxuwz.casesys.business.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxuwz.casesys.business.dao.CasCaseDAO;
import com.gxuwz.casesys.business.entity.CasCase;
import com.gxuwz.casesys.business.service.ICasCaseService;

import java.util.List;

@Service("ICasCaseService")
public class CasCaseServiceImpl implements ICasCaseService {
	
	@Autowired
	private CasCaseDAO casCaseDAO;

	/**
	 * 添加
	 */
	@Override
	public CasCase add(CasCase casCase) {
		//String casPatientCode = CommonUtil.getId("CPT");
		casCase.setStatus(0);
		return casCaseDAO.add(casCase);
	}
	
	@Override
	public List<CasCase> getAllCasesByPatientCode(String patientCode ) {
		//查询获取全部的数据
		return casCaseDAO.getAllCasesByPatientCode(patientCode);
    }
	
	//通过id查找病例
	@Override
	public CasCase getCaseById(int id) {
		return casCaseDAO.getCaseById(id);
	}

	@Override
	public void update(CasCase casCase) {
		casCaseDAO.update(casCase);
		
	}
	
	@Override
	public void delete(Integer id) {
		casCaseDAO.delete(id);
	}

	
	
}
