package com.gxuwz.test;

import com.alibaba.fastjson.JSON;
import com.gxuwz.casesys.business.entity.CasPatient;
import com.gxuwz.casesys.business.service.ICasPatientService;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath*:applicationContext-*.xml"})
public class ProductTest {

    @Autowired
	private ICasPatientService iCasPatientService;
	public static final Integer pageNo = 1;
	public static final Integer pageSize = 15;
	/**
	 * 获取病人信息
	 * */
    @Test
    public void testProductTourism(){
    	System.out.println(JSON.toJSON(iCasPatientService.find(new CasPatient(), pageNo, pageSize)));
    }
}
