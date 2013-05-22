package com.myforms.template.config.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.myforms.field.config.model.TemplateField;
import com.myforms.usergroup.model.User;

public class Template implements Cloneable {
private Integer templateId;
private String templateName;
private String renderXml;
private String templateTitle;
private Template parentTemplate;
private Boolean isCommon;
private Boolean isEnable;
private Timestamp createdOn;
private User createdBy;
private String description;
private Boolean isAbstract;
private Boolean createDocEnabled;
private Boolean uploadDocEnabled;
private String version;
private Map<String, TemplateField> templateFieldMap;
public User getCreatedBy() {
	return createdBy;
}
public void setCreatedBy(User createdBy) {
	this.createdBy = createdBy;
}
public Boolean getCreateDocEnabled() {
	return createDocEnabled;
}
public void setCreateDocEnabled(Boolean createDocEnabled) {
	this.createDocEnabled = createDocEnabled;
}
public Timestamp getCreatedOn() {
	return createdOn;
}
public void setCreatedOn(Timestamp createdOn) {
	this.createdOn = createdOn;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}

public Boolean getIsAbstract() {
	return isAbstract;
}
public void setIsAbstract(Boolean isAbstract) {
	this.isAbstract = isAbstract;
}
public Boolean getIsCommon() {
	return isCommon;
}
public void setIsCommon(Boolean isCommon) {
	this.isCommon = isCommon;
}
public Boolean getIsEnable() {
	return isEnable;
}
public void setIsEnable(Boolean isEnable) {
	this.isEnable = isEnable;
}
public Template getParentTemplate() {
	return parentTemplate;
}
public void setParentTemplate(Template parentTemplate) {
	this.parentTemplate = parentTemplate;
}
public String getRenderXml() {
	return renderXml;
}
public void setRenderXml(String renderXml) {
	this.renderXml = renderXml;
}
public Integer getTemplateId() {
	return templateId;
}
public void setTemplateId(Integer templateId) {
	this.templateId = templateId;
}
public String getTemplateName() {
	return templateName;
}
public void setTemplateName(String templateName) {
	this.templateName = templateName;
}
public String getTemplateTitle() {
	return templateTitle;
}
public void setTemplateTitle(String templateTitle) {
	this.templateTitle = templateTitle;
}
public Boolean getUploadDocEnabled() {
	return uploadDocEnabled;
}
public void setUploadDocEnabled(Boolean uploadDocEnabled) {
	this.uploadDocEnabled = uploadDocEnabled;
}
public String getVersion() {
	return version;
}
public void setVersion(String version) {
	this.version = version;
}
public Map<String, TemplateField> getTemplateFieldMap() {
	return templateFieldMap;
}
public void setTemplateFieldMap(Map<String, TemplateField> templateFieldMap) {
	this.templateFieldMap = templateFieldMap;
}
public void setTemplateFieldList(List<TemplateField> templateFieldList) {
	Map<String, TemplateField> map =  new HashMap<String, TemplateField>();
	for(TemplateField templateField : templateFieldList)
	{
		map.put(templateField.getFieldName(), templateField);
	}
	setTemplateFieldMap(map);
}
}
