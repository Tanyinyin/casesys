package com.gxuwz.casesys.business.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.gxuwz.casesys.business.entity.CasPrescription;
import com.gxuwz.core.dao.impl.BaseDaoImpl;
import com.gxuwz.core.pagination.Result;

@Repository("CasPrescriptionDAO")
public class CasPrescriptionDAO extends BaseDaoImpl<CasPrescription>{
	//查询处方列表
	//@SuppressWarnings("unchecked")
	public Result<CasPrescription> find(CasPrescription casPrescription, int page, int size){
		String queryString = "from CasPrescription where 1=1";
		if(null != casPrescription.getId()){
			queryString = queryString + " and id='"+casPrescription.getId()+"'";
	}	
		int start=(page-1)*size;
		int limit =size;
		return (Result<CasPrescription> )super.find(queryString, null, null, start, limit);
	}
	

}
