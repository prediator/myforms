package com.myforms.template.service;

import java.util.List;

import com.myforms.template.config.model.Template;

public interface CreateFetchTemplateServiceManager {
	public Template createTemplate(Integer templateId);
	public Template getTemplateById(Integer templateId);
	public List<Template> getAllTemplates();
	public void getTemplateByName(String templateName);
	public List<Template> getTemplatesByIds(String[] templateIds);
	public List<Template> getTemplatesByIds(List<String> templateIds);
}
