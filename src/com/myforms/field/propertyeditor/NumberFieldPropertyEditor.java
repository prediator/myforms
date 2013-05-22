package com.myforms.field.propertyeditor;

import java.beans.PropertyEditorSupport;

import com.myforms.constants.MyFormsConstants;
import com.myforms.field.Field;
import com.myforms.field.NumberField;
import com.myforms.field.service.FieldServiceManager;

public class NumberFieldPropertyEditor extends PropertyEditorSupport {
	private FieldServiceManager fieldServiceManager;
public NumberFieldPropertyEditor(FieldServiceManager fieldServiceManager) {
		this.fieldServiceManager = fieldServiceManager;
	}
@Override
public void setAsText(String text) throws IllegalArgumentException {
	Field field = (NumberField)getValue();
	
	field.setFieldType(MyFormsConstants.FieldType.NUMBER);
	field.setFieldValue(text);
	setValue(field);
}
@Override
public String getAsText() {
	Field field = (Field)getValue();
	return field.getFieldValue();
}
}
