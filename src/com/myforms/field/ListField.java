package com.myforms.field;

import java.util.List;

import org.springframework.util.CollectionUtils;

import com.myforms.field.config.model.TemplateField;

public class ListField extends Field {
public ListField(TemplateField templateField) {
		super(templateField);		
	}
public ListField(){}
private List<String> fieldValues;

public List<String> getFieldValues() {
	return fieldValues;
}

public void setFieldValues(List<String> fieldValues) {
	this.fieldValues = fieldValues;
}
public String toString(){
	StringBuilder val = new StringBuilder();
	String rv = null;
	if( !CollectionUtils.isEmpty(fieldValues)){
		for(String v : fieldValues){
			val.append(v + ",");
		}
		rv = val.toString().replaceAll(" ", "");
	 if(rv.length() > 0){
		 rv = rv.substring(0,rv.length()-1);
	 }
	}
	return rv;
}
}
