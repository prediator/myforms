package com.myforms.field;

import com.myforms.constants.MyFormsConstants;

public enum FieldEnum {
	NOFIELD("NO Field",-1),TEXTBOX(MyFormsConstants.FieldType.TEXT,MyFormsConstants.FieldId.TEXT),
		LIST(MyFormsConstants.FieldType.LIST,MyFormsConstants.FieldId.LIST);
private String fieldType;
private int fieldId;
private FieldEnum(String fieldType,int fieldId){
	this.fieldId = fieldId;
	this.fieldType = fieldType;
}
public static FieldEnum getFieldEnum(String fieldType){
	if(MyFormsConstants.FieldType.TEXT.equals(fieldType)){
		return TEXTBOX;
	}
	else if(MyFormsConstants.FieldType.LIST.equals(fieldType)){
		return LIST;
	}
	else {
		return NOFIELD;
	}
}
public int getId(){
	return fieldId;
}
}
