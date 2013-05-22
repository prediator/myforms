package com.myforms.templatefield.service;

import java.util.List;

import com.myforms.templatefield.dao.TemplateFieldDao;
import com.myforms.usergroup.model.User;

public class TemplateFieldManagerImpl implements TemplateFieldManager {
	private TemplateFieldDao templateFieldDao;
	public List<com.myforms.field.List> getListForUser(User user) {
		return templateFieldDao.getListForUser(user);
	}
	public TemplateFieldDao getTemplateFieldDao() {
		return templateFieldDao;
	}
	public void setTemplateFieldDao(TemplateFieldDao templateFieldDao) {
		this.templateFieldDao = templateFieldDao;
	}
	public void saveTemplateList(com.myforms.field.List templateList) {
		templateFieldDao.saveTemplateList(templateList);		
	}

}
