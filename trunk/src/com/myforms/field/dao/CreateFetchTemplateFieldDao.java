package com.myforms.field.dao;

import com.myforms.template.config.model.Template;

public interface CreateFetchTemplateFieldDao {
public Template createTemplateField(Integer fieldId);
public Template getTemplateFieldById(Integer templateFieldId);
public void getTemplateFieldByName(String templateFieldName);
}
