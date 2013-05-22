package com.myforms.template.dao;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.myforms.template.config.model.Template;

public class CreateFetchTemplateDaoIBatis extends SqlMapClientDaoSupport implements CreateFetchTemplateDao{

	public Template createTemplate(Integer templateId) {
		// TODO Auto-generated method stub
		return null;
	}

	public Template getTemplateById(Integer templateId) {
		// TODO Auto-generated method stub
		return (Template)getSqlMapClientTemplate().queryForObject("template.getTemplateById", templateId);
	}

	public void getTemplateByName(String templateName) {
		// TODO Auto-generated method stub
		
	}

	public List<Template> getTemplatesByIds(List<String> templateIds) {
		// TODO Auto-generated method stub
		return ( List<Template>)getSqlMapClientTemplate().queryForList("template.getTemplateListByIds", templateIds);

	}

	public List<Template> getAllTemplates() {
		return ( List<Template>)getSqlMapClientTemplate().queryForList("template.getAllTemplates");
	}

	

}
