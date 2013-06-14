package com.myforms.field;

import java.util.Date;
import java.util.List;

import org.myform.fcondition.domain.ConditionConfig;

import com.myforms.constants.MyFormsConstants;
import com.myforms.field.config.model.TemplateField;
import com.myforms.usergroup.model.User;
import com.myforms.web.model.Document;

public abstract  class Field {
private Integer id;
private String fieldValue;
private TemplateField templateField;
private String fieldType;
private Date lastUpdatedOn;
private User lastUpdatedBy;
private Document document;
private Boolean isDirty;

public Document getDocument() {
	return document;
}
public void setDocument(Document document) {
	this.document = document;
}

public Boolean isDirty() {
	if(isDirty == null)
		return false;
	return isDirty;
}
public void setDirty(Boolean isDirty) {
	if(isDirty !=null && isDirty && this.document !=null){
	this.document.setDirty(isDirty);
	}
	this.isDirty = isDirty;
}
public User getLastUpdatedBy() {
	return lastUpdatedBy;
}
public void setLastUpdatedBy(User lastUpdatedBy) {
	this.lastUpdatedBy = lastUpdatedBy;
}
public Date getLastUpdatedOn() {
	return lastUpdatedOn;
}
public void setLastUpdatedOn(Date lastUpdatedOn) {
	this.lastUpdatedOn = lastUpdatedOn;
}
public Field(){}
public String getFieldValue() {
	return fieldValue;
}
public Field(TemplateField templateField){
  this.templateField = templateField;	
}
public void setFieldValue(String fieldValue) {
	this.fieldValue = fieldValue;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public TemplateField getTemplateField() {
	return templateField;
}
public void setTemplateField(TemplateField templateField) {
	this.templateField = templateField;
}
public String getFieldType() {
	return fieldType;
}
public void setFieldType(String fieldType) {
	this.fieldType = fieldType;
}
@Override
public boolean equals(Object object) {
	
	if(object == this)
		return true;
	if(object == null)
		return false;
	Field field = (Field)object;
	if(field.id == this.id && this.fieldType.equals(field.getFieldType()))
		return true;
	return false;
}
@Override
public int hashCode() {
	int hashCode = (int) Math.pow(MyFormsConstants.HashConstants.FIRST_PRIME, 2)*this.getId() 
					+ MyFormsConstants.HashConstants.SECOND_PRIME * MyFormsConstants.HashConstants.FIELD_IDS.get(this.fieldType);
	return hashCode;
}
}
