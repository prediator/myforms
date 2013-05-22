package com.myforms.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.myforms.template.service.SaveUpdateTemplateServiceManager;
import com.myforms.template.service.TemplateDTO;
import com.myforms.templatefield.service.TemplateFieldManager;

public class AbstractTemplateFormController extends SimpleFormController {
	@Autowired
	protected TemplateDTO templateDTO; 
	@Autowired
	protected TemplateFieldManager templateFieldManager;
	@Autowired
	protected SaveUpdateTemplateServiceManager saveUpdateTemplateServiceManager;
	public SaveUpdateTemplateServiceManager getSaveUpdateTemplateServiceManager() {
		return saveUpdateTemplateServiceManager;
	}
	public void setSaveUpdateTemplateServiceManager(
			SaveUpdateTemplateServiceManager saveUpdateTemplateServiceManager) {
		this.saveUpdateTemplateServiceManager = saveUpdateTemplateServiceManager;
	}
	public TemplateDTO getTemplateDTO() {
		return templateDTO;
	}
	public void setTemplateDTO(TemplateDTO templateDTO) {
		this.templateDTO = templateDTO;
	}
	public TemplateFieldManager getTemplateFieldManager() {
		return templateFieldManager;
	}
	public void setTemplateFieldManager(TemplateFieldManager templateFieldManager) {
		this.templateFieldManager = templateFieldManager;
	}
}
