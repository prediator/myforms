package com.myforms.template.config.model;

import java.util.List;

public class TemplateMetaData {
private String templateName;
private String title;
private Integer parentTemplateId;
private Boolean isEnabled;
private String description;
private Boolean isAbstarct;
private Boolean createDocEnabled;
private Boolean uploadDocEnabled;
private List<TemplateRowMetaData>  rowMetaData;
public Boolean getCreateDocEnabled() {
	return createDocEnabled;
}
public void setCreateDocEnabled(Boolean createDocEnabled) {
	this.createDocEnabled = createDocEnabled;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public Boolean getIsAbstarct() {
	return isAbstarct;
}
public void setIsAbstarct(Boolean isAbstarct) {
	this.isAbstarct = isAbstarct;
}
public Boolean getIsEnabled() {
	return isEnabled;
}
public void setIsEnabled(Boolean isEnabled) {
	this.isEnabled = isEnabled;
}
public Integer getParentTemplateId() {
	return parentTemplateId;
}
public void setParentTemplateId(Integer parentTemplateId) {
	this.parentTemplateId = parentTemplateId;
}
public List<TemplateRowMetaData> getRowMetaData() {
	return rowMetaData;
}
public void setRowMetaData(List<TemplateRowMetaData> rowMetaData) {
	this.rowMetaData = rowMetaData;
}
public String getTemplateName() {
	return templateName;
}
public void setTemplateName(String templateName) {
	this.templateName = templateName;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public Boolean getUploadDocEnabled() {
	return uploadDocEnabled;
}
public void setUploadDocEnabled(Boolean uploadDocEnabled) {
	this.uploadDocEnabled = uploadDocEnabled;
}


}
