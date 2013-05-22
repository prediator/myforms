package com.myforms.field.config.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.myform.fcondition.domain.ConditionConfig;

import com.myforms.template.config.model.Template;
import com.myforms.usergroup.model.User;

public class TemplateField {
private Integer fieldId;
private String fieldName;
private String fieldTitle;
private String fieldHeltText;
private Integer fieldLegth;
private Boolean isVisible;
private Boolean isRequired;
private FieldType fieldType;
private Boolean isCommon;
private Boolean isEnabled;
private Template template;
private String defaultValue;
//Changed from string to list class
//private List<String> listValues;
private com.myforms.field.List list;
private Boolean isMultiselect;
private User createdBy;
private Timestamp createdOn;
private String version;
private List<ConditionConfig> conditionsByTarget;
private List<ConditionConfig> conditionsBySource;

public List<ConditionConfig> getConditionsBySource() {
	return conditionsBySource;
}
public void setConditionsBySource(List<ConditionConfig> conditionsBySource) {
	this.conditionsBySource = conditionsBySource;
}
public List<ConditionConfig> getConditionsByTarget() {
	return conditionsByTarget;
}
public void setConditionsByTarget(List<ConditionConfig> conditionsByTarget) {
	this.conditionsByTarget = conditionsByTarget;
}
public User getCreatedBy() {
	return createdBy;
}
public void setCreatedBy(User createdBy) {
	this.createdBy = createdBy;
}
public Timestamp getCreatedOn() {
	return createdOn;
}
public void setCreatedOn(Timestamp createdOn) {
	this.createdOn = createdOn;
}
public String getDefaultValue() {
	return defaultValue;
}
public void setDefaultValue(String defaultValue) {
	this.defaultValue = defaultValue;
}
public String getFieldHeltText() {
	return fieldHeltText;
}
public void setFieldHeltText(String fieldHeltText) {
	this.fieldHeltText = fieldHeltText;
}
public Integer getFieldId() {
	return fieldId;
}
public void setFieldId(Integer fieldId) {
	this.fieldId = fieldId;
}
public Integer getFieldLegth() {
	return fieldLegth;
}
public void setFieldLegth(Integer fieldLegth) {
	this.fieldLegth = fieldLegth;
}
public String getFieldName() {
	return fieldName;
}
public void setFieldName(String fieldName) {
	this.fieldName = fieldName;
}
public String getFieldTitle() {
	return fieldTitle;
}
public void setFieldTitle(String fieldTitle) {
	this.fieldTitle = fieldTitle;
}
public FieldType getFieldType() {
	return fieldType;
}
public void setFieldType(FieldType fieldType) {
	this.fieldType = fieldType;
}
public Boolean getIsCommon() {
	return isCommon;
}
public void setIsCommon(Boolean isCommon) {
	this.isCommon = isCommon;
}
public Boolean getIsEnabled() {
	return isEnabled;
}
public void setIsEnabled(Boolean isEnabled) {
	this.isEnabled = isEnabled;
}
public Boolean getIsRequired() {
	return isRequired;
}
public void setIsRequired(Boolean isRequired) {
	this.isRequired = isRequired;
}
public Boolean getIsVisible() {
	return isVisible;
}
public void setIsVisible(Boolean isVisible) {
	this.isVisible = isVisible;
}
public Template getTemplate() {
	return template;
}
public void setTemplate(Template template) {
	this.template = template;
}
public String getVersion() {
	return version;
}
public void setVersion(String version) {
	this.version = version;
}
/*public List<String> getListValues() {
	return listValues;
}
public void setListValues(List<String> listValues) {
	this.listValues = listValues;
}*/
public Boolean isMultiselect() {
	return isMultiselect;
}
public void setIsMultiselect(Boolean isMultiselect) {
	this.isMultiselect = isMultiselect;
}
public com.myforms.field.List getList() {
	return list;
}
public void setList(com.myforms.field.List list) {
	this.list = list;
}
public Boolean getIsMultiselect() {
	return isMultiselect;
}

}
