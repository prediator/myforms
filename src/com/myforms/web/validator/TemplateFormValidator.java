package com.myforms.web.validator;

import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.myforms.template.config.model.Template;
import com.myforms.template.config.model.TemplateMetaData;


public class TemplateFormValidator implements Validator{

	public boolean supports(Class clazz) {
		// TODO Auto-generated method stub
		return clazz == TemplateMetaData.class;
	}

	public void validate(Object object, Errors errors) {
		TemplateMetaData template = (TemplateMetaData)object;
		if(!StringUtils.hasLength(template.getDescription())){
			errors.rejectValue("description","ec.required.1",new Object[]{"Template Description"}, "Template Description is a required field.");
		}
		if(!StringUtils.hasLength(template.getTemplateName())){
			errors.rejectValue("templateName","ec.required.1",new Object[]{"Template Name"}, "Template Name is a required field.");
		}
		
	}

}
