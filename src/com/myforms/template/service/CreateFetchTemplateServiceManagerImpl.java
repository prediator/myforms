package com.myforms.template.service;

import java.util.ArrayList;
import java.util.List;

import com.myforms.template.config.model.Template;
import com.myforms.template.dao.CreateFetchTemplateDao;

public class CreateFetchTemplateServiceManagerImpl implements
		CreateFetchTemplateServiceManager {
	private CreateFetchTemplateDao createFetchTemplateDao;
	public Template createTemplate(Integer templateId) {
		// TODO Auto-generated method stub
		return null;
	}

	public Template getTemplateById(Integer templateId) {
		// TODO Auto-generated method stub
		return getCreateFetchTemplateDao().getTemplateById(templateId);
	}

	public void getTemplateByName(String templateName) {
		// TODO Auto-generated method stub

	}

	public CreateFetchTemplateDao getCreateFetchTemplateDao() {
		return createFetchTemplateDao;
	}

	public void setCreateFetchTemplateDao(
			CreateFetchTemplateDao createFetchTemplateDao) {
		this.createFetchTemplateDao = createFetchTemplateDao;
	}

	public List<Template> getTemplatesByIds(String[] templateIds) {
		// TODO Auto-generated method stub
		List<String> list = new ArrayList<String>();
		for(String id : templateIds)
		list.add(id);
		return getTemplatesByIds(list);
	}

	public List<Template> getTemplatesByIds(List<String> templateIds) {
		// TODO Auto-generated method stub
		return createFetchTemplateDao.getTemplatesByIds(templateIds);
	}

	public List<Template> getAllTemplates() {
		// TODO Auto-generated method stub
		return createFetchTemplateDao.getAllTemplates();
	}

}
