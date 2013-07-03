package com.myforms.anonymous;

import java.util.Date;

import org.springframework.format.annotation.NumberFormat;
import org.springmodules.validation.bean.conf.loader.annotation.handler.Email;
import org.springmodules.validation.bean.conf.loader.annotation.handler.Length;
import org.springmodules.validation.bean.conf.loader.annotation.handler.MaxLength;
import org.springmodules.validation.bean.conf.loader.annotation.handler.NotBlank;

/**
 * 
 * @author mohd.irshad
 *
 */
public class ClientSetupInfo {
	private Long id;
	@NotBlank
	@Length(max=200)
	private String name;
	@NotBlank
	@Length(max=200)
	private String clientName;
	@Length(max=200)
	@Email
	@NotBlank
	private String emailId;
	@NumberFormat(pattern="[0-9]")
	private String contactNo;
	private String status;
	private Date statusChangeDate;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Date getStatusChangeDate() {
		return statusChangeDate;
	}
	public void setStatusChangeDate(Date statusChangeDate) {
		this.statusChangeDate = statusChangeDate;
	}
	
}
