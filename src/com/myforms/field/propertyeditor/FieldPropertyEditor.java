package com.myforms.field.propertyeditor;

import java.beans.PropertyEditorSupport;

import com.myforms.field.Field;

public class FieldPropertyEditor extends PropertyEditorSupport{
@Override
public String getAsText() {
	getValue();

	return  null;
}
@Override
public void setAsText(String text) throws IllegalArgumentException {
	getValue();
setValue(null);
}
}
