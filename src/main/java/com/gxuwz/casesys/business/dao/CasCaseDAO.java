package com.gxuwz.casesys.business.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxuwz.casesys.business.constant.CasCaseConstant;
import com.gxuwz.casesys.business.entity.CasCase;
import com.gxuwz.core.dao.impl.BaseDaoImpl;

@Repository("casCaseDAO")
public class CasCaseDAO extends BaseDaoImpl<CasCase>{
	
	//添加病例
	public CasCase add(CasCase casCase) {
		CasCase cas = save(casCase);
		return cas;
	}
	
	//通过病人编号查找全部病例
	public List<CasCase> getAllCasesByPatientCode(String patientCode ) {
		//查询获取全部的数据
		String queryString = "from CasCase where patientCode=? AND status !="+CasCaseConstant.CAS_CASE_DEL_STATUS;
		List<CasCase> list=super.findByHql(queryString,patientCode);
		return list;
    }

	//通过id查找病例
	public CasCase getCaseById(int id){
		CasCase cas = null;
		String hql = "from CasCase where id= ?";
		List<CasCase> list = super.findByHql(hql,id);
		if(null != list && 0 < list.size()){
			cas = list.get(0);
		}
		System.out.println(cas.getId());
		return cas;
	}
	
	//删除病例
	public void delete (Integer id) {
    	String hql = "UPDATE CasCase SET status=?,updateTime=now() WHERE id=?";
    	try {
    		super.update(hql,CasCaseConstant.CAS_CASE_DEL_STATUS, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    }
}
