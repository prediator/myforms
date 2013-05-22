package com.myforms.template.service;

import com.myforms.template.config.model.Template;
import com.myforms.template.config.model.TemplateMetaData;

public interface TemplateDTO {
public Template transferToTemplate(TemplateMetaData templateMetaData);
}
