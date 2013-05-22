package com.myforms.client;

import java.util.List;

import com.myforms.template.config.model.Template;

public class Client {
private Long clientId;
private String clientName;
private String description;
private List<Template> templateList;
public Long getClientId() {
	return clientId;
}
public void setClientId(Long clientId) {
	this.clientId = clientId;
}
public String getClientName() {
	return clientName;
}
public void setClientName(String clientName) {
	this.clientName = clientName;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public List<Template> getTemplateList() {
	return templateList;
}
public void setTemplateList(List<Template> templateList) {
	this.templateList = templateList;
}
}
