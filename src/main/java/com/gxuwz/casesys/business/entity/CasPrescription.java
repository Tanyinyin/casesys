package com.gxuwz.casesys.business.entity;

import java.util.Date;

/**
 * CasPrescription entity. @author MyEclipse Persistence Tools
 */

public class CasPrescription implements java.io.Serializable {

	// Fields
	
	private Integer id;
	private String prescriptionName;//处方名称
	private Integer status;//状态
	private Date createTime;//创建时间
	
	// Constructors
	
	/** default constructor */
	public CasPrescription(){
	}
	
	/** minimal constructor */
	public CasPrescription(Integer id){
		this.id = id;
	}
	
	/** full constructor */
	public CasPrescription(Integer id, String prescriptionName, Integer status, Date createTime){
		this.id = id;
		this.prescriptionName = prescriptionName;
		this.status = status;
		this.createTime = createTime;
	}
	
	// Property accessors
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPrescriptionName() {
		return prescriptionName;
	}

	public void setPrescriptionName(String prescriptionName) {
		this.prescriptionName = prescriptionName;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}
