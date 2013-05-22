package com.freemarker.template.config;

import java.io.IOException;

import freemarker.template.Template;

public interface TemplateConfiguration {
	public void setup()throws IOException;
public void execute() ;
public Template getTemplate();
}
