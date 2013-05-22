package com.myforms.template.dao;

import java.util.List;

import com.myforms.template.config.model.Template;

public interface CreateFetchTemplateDao {
public Template createTemplate(Integer templateId);
public Template getTemplateById(Integer templateId);
public List<Template> getAllTemplates();
public void getTemplateByName(String templateName);
public List<Template> getTemplatesByIds(List<String> templateIds);
}
