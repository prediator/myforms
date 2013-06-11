package com.myforms.template.service;

import com.myforms.template.config.model.Template;
import com.myforms.template.dao.SaveUpdateTemplateDao;

public class SaveUpdateTemplateServiceManagerImpl implements SaveUpdateTemplateServiceManager {
	private SaveUpdateTemplateDao saveUpdateTemplateDao;
	public SaveUpdateTemplateDao getSaveUpdateTemplateDao() {
		return saveUpdateTemplateDao;
	}

	public void setSaveUpdateTemplateDao(SaveUpdateTemplateDao saveUpdateTemplateDao) {
		this.saveUpdateTemplateDao = saveUpdateTemplateDao;
	}

	public void saveTemplate(Template template) {
		saveUpdateTemplateDao.saveTemplate(template);
	}

	public void updateTemplate(Template template) {
		
	}

}
