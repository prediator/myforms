package com.myforms.history;

import java.util.Date;
import java.util.List;

public class HistoryTemplateField {
private Long id;
private Integer templateId;
private List<String> fieldNames;
private Date createdDate;
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public Integer getTemplateId() {
	return templateId;
}
public void setTemplateId(Integer templateId) {
	this.templateId = templateId;
}
public List<String> getFieldNames() {
	return fieldNames;
}
public void setFieldNames(List<String> fieldName) {
	this.fieldNames = fieldName;
}
public Date getCreatedDate() {
	return createdDate;
}
public void setCreatedDate(Date createdDate) {
	this.createdDate = createdDate;
}

}
