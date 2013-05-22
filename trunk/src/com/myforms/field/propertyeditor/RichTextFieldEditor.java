package com.myforms.field.propertyeditor;

import java.beans.PropertyEditorSupport;
import java.util.ArrayList;
import java.util.Arrays;

import com.myforms.constants.MyFormsConstants;
import com.myforms.field.Field;
import com.myforms.field.RichTextField;
import com.myforms.field.dao.FieldDao;
import com.myforms.field.service.FieldServiceManager;

public class RichTextFieldEditor extends PropertyEditorSupport{
	private FieldServiceManager fieldServiceManager;
	public RichTextFieldEditor(FieldServiceManager fieldServiceManager) {
		this.fieldServiceManager=fieldServiceManager;
	}
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		RichTextField field = (RichTextField)getValue();
		field.setFieldType(MyFormsConstants.FieldType.RICH_TEXT);
		field.setFieldValue(text);
		field.setDataList(new ArrayList<String>(Arrays.asList(new String[]{text})));
		setValue(field);
	}
	@Override
	public String getAsText() {
		Field field = (Field)getValue();
		return field.getFieldValue();
	}
}
