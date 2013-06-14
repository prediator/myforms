package com.myforms.field;

import java.util.List;

import com.myforms.field.config.model.TemplateField;

public class RichTextField extends Field {
private List<String> dataList;
public RichTextField(){}
public RichTextField(TemplateField templateField) {
	super(templateField);
}

public List<String> getDataList() {
	return dataList;
}

public void setDataList(List<String> dataList) {
	this.dataList = dataList;
}
/**
 * Never update history of rich text fields	
 */
@Override
	public Boolean isDirty() {
		return false;
	}
}
