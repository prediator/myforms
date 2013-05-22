package com.myforms.field;

import com.myforms.constants.MyFormsConstants;

public class FieldFactory {
private FieldFactory(){}
public static Field createField(String fieldType){
	FieldEnum fieldEnum = FieldEnum.getFieldEnum(fieldType);
	switch (fieldEnum.getId()) {
	case MyFormsConstants.FieldId.TEXT:
		return new TextField();	
	case MyFormsConstants.FieldId.LIST:
		return new ListField();	
	default:
		return null;
	}	
}
}
