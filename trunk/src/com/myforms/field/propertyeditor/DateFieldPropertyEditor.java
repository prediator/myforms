package com.myforms.field.propertyeditor;

import java.beans.PropertyEditorSupport;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.util.StringUtils;

import com.myforms.constants.MyFormsConstants;
import com.myforms.field.DateField;
import com.myforms.field.Field;
import com.myforms.field.TextField;
import com.myforms.field.dao.FieldDao;
import com.myforms.field.service.FieldServiceManager;

public class DateFieldPropertyEditor extends PropertyEditorSupport {
	private FieldServiceManager fieldServiceManager;
public DateFieldPropertyEditor(FieldServiceManager fieldServiceManager) {
		this.fieldServiceManager = fieldServiceManager;
	}
@Override
public void setAsText(String text) throws IllegalArgumentException {
	DateField field = (DateField)getValue();	
	field.setFieldType(MyFormsConstants.FieldType.DATE);
	if(StringUtils.hasLength(text))
	field.setDateValue(new Date(text));
	setValue(field);
}
@Override
public String getAsText() {
	DateField field = (DateField)getValue();
	DateFormat dateFormat = new SimpleDateFormat(MyFormsConstants.DATE_FORMAT);
	return dateFormat.format(field.getDateValue());
}
}
