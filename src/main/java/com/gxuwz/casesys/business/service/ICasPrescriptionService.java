package com.gxuwz.casesys.business.service;

import java.util.List;


import com.gxuwz.casesys.business.entity.CasPrescription;
import com.gxuwz.core.pagination.Result;

public interface ICasPrescriptionService {
	//处方列表
		public Result<CasPrescription> find(CasPrescription casPrescription,int page, int row);
		
	

}
