package com.myforms.field;

import com.myforms.field.config.model.TemplateField;

public class NumberField extends Field {
	public NumberField(TemplateField templateField) {
		super(templateField);		
	}
	public String getFieldValue() throws NumberFormatException{
		if(super.getFieldValue() != null)
			Long.valueOf(super.getFieldValue());
		return  super.getFieldValue();
	}

	public void setFieldValue(String fieldValue) throws NumberFormatException {
		if(fieldValue != null)
			Long.valueOf(fieldValue);
		super.setFieldValue(fieldValue);
	}
}
