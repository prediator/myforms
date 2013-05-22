package com.myforms.field.propertyeditor;

import java.beans.PropertyEditorSupport;
import java.util.ArrayList;
import java.util.List;

import com.myforms.constants.MyFormsConstants;
import com.myforms.field.Field;
import com.myforms.field.ListField;
import com.myforms.field.dao.FieldDao;
import com.myforms.field.service.FieldServiceManager;
import com.myforms.util.MyFormProperties;

public class ListFieldPropertyEditor extends PropertyEditorSupport {
	private FieldServiceManager fieldServiceManager;
public ListFieldPropertyEditor(FieldServiceManager fieldServiceManager) {
		this.fieldServiceManager = fieldServiceManager;
	}
@Override
public void setAsText(String text) throws IllegalArgumentException {
	ListField field = (ListField)getValue();
	List<String> list = new ArrayList<String>();
	for(String val : text.split(MyFormsConstants.LIST_VAL_SEPARATOR))
	{
		list.add(val);
	}
	field.setFieldValues(list);
	field.setFieldType(MyFormsConstants.FieldType.LIST);
	setValue(field);
}
@Override
public String getAsText() {
	ListField field = (ListField)getValue();
	return field.getFieldValue();
}
}
