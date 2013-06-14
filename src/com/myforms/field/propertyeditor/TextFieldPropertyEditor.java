package com.myforms.field.propertyeditor;

import java.beans.PropertyEditorSupport;

import org.apache.commons.lang.StringUtils;

import com.myforms.constants.MyFormsConstants;
import com.myforms.field.Field;
import com.myforms.field.TextField;
import com.myforms.field.dao.FieldDao;
import com.myforms.field.service.FieldServiceManager;

public class TextFieldPropertyEditor extends PropertyEditorSupport {
	private FieldServiceManager fieldServiceManager;
public TextFieldPropertyEditor(FieldServiceManager fieldServiceManager) {
		this.fieldServiceManager = fieldServiceManager;
	}
@Override
public void setAsText(String text) throws IllegalArgumentException {
	Field field = (TextField)getValue();
	field.setDirty(!StringUtils.equals(text, field.getFieldValue()));
	field.setFieldType(MyFormsConstants.FieldType.TEXT);
	field.setFieldValue(text);
	setValue(field);
}
@Override
public String getAsText() {
	Field field = (Field)getValue();
	return field.getFieldValue();
}
}
