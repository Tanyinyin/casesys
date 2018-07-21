package com.gxuwz.casesys.business.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gxuwz.casesys.business.dao.CasCaseDAO;
import com.gxuwz.casesys.business.dao.CasPrescriptionDAO;
import com.gxuwz.casesys.business.entity.CasCase;
import com.gxuwz.casesys.business.entity.CasPrescription;
import com.gxuwz.casesys.business.service.ICasCaseService;
import com.gxuwz.casesys.business.service.ICasPrescriptionService;
import com.gxuwz.core.pagination.Result;

import java.util.List;

@Service("ICasPrescriptionService")
public class CasPrescriptionServiceImpl implements ICasPrescriptionService {
	
	@Autowired
	private CasPrescriptionDAO casPrescriptionDAO;


	@Override
	public Result<CasPrescription> find(CasPrescription casPrescription, int page, int row) {
	//	Object id;
		// TODO Auto-generated method stub
		return casPrescriptionDAO.find(casPrescription, page, row);
	}


	
	
	
}
