package com.myforms.template.service.ftl;

import java.io.IOException;
import java.util.Collection;

import org.dom4j.DocumentException;

import com.myforms.template.config.model.Template;

public interface CreateandSaveFTLService {
public void createFTLFromTemplate(Template template) throws DocumentException,IOException;
public void createFTLFromTemplateList(Collection<Template> templateCollection)throws DocumentException,IOException;
public void copyCommonFTLs(String rootPath) throws IOException;
}
