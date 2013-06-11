package com.myforms.templatefield.service;

import java.util.Iterator;
import java.util.List;

import com.myforms.field.config.model.FieldType;
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
	@Override
	public List<FieldType> getCongigurableFields() {
		return filterConfigurableFiels(templateFieldDao.getCongigurableFields());
	}
	
	/*
	 * remove field type that are not configurable
	 */
	private List<FieldType> filterConfigurableFiels(List<FieldType> fieldTypes){
		if(fieldTypes != null)
		{			
			Iterator<FieldType> iterator = fieldTypes.iterator();
			while(iterator.hasNext()){
				FieldType ft = iterator.next();
				if(!ft.isConfigurable())
					iterator.remove();
			}
		}
		return fieldTypes;
	}
}
