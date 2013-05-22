package com.myforms.template.config.model;

import java.util.HashMap;
import java.util.Map;

public class TemplateColumnMetaData {
private Map<String, String> fieldProperties;
public TemplateColumnMetaData(){
	fieldProperties = new HashMap<String, String>();
}
public Map<String, String> getFieldProperties() {
	return fieldProperties;
}

public void setFieldProperties(Map<String, String> fieldProperties) {
	this.fieldProperties = fieldProperties;
}
}
