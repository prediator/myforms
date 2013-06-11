package com.myforms.field.config.model;

import com.myforms.constants.MyFormsConstants;

public class FieldType {
private Integer fieldTypeId;
private String fieldType;
private String description;
private Boolean configurable;
private String htmlType;
public String getFieldType() {
	return fieldType;
}
public void setFieldType(String fieldType) {
	this.fieldType = fieldType;
}
public Integer getFieldTypeId() {
	return fieldTypeId;
}
public void setFieldTypeId(Integer fieldTypeId) {
	this.fieldTypeId = fieldTypeId;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public Boolean isConfigurable() {
	return configurable;
}
public void setConfigurable(Boolean configurable) {
	this.configurable = configurable;
}
public String getHtmlType() {
	return MyFormsConstants.HtmlFieldType.get(fieldType);
}

}
