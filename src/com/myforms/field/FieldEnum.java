package com.myforms.field;

import com.myforms.constants.MyFormsConstants;
import com.myforms.exception.runtimeexception.InvalidFieldTypeException;

public enum FieldEnum {
	NOFIELD("NO Field",-1),TEXTBOX(MyFormsConstants.FieldType.TEXT,MyFormsConstants.FieldId.TEXT),
		LIST(MyFormsConstants.FieldType.LIST,MyFormsConstants.FieldId.LIST),
		CHECKBOX(MyFormsConstants.FieldType.CHECKBOX,MyFormsConstants.FieldId.CHECKBOX),
		RADIO(MyFormsConstants.FieldType.RADIO,MyFormsConstants.FieldId.RADIO);
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
	else if(MyFormsConstants.FieldType.CHECKBOX.equals(fieldType)){
		return CHECKBOX;
	}
	else if(MyFormsConstants.FieldType.RADIO.equals(fieldType)){
		return RADIO;
	}
	else{
		throw new InvalidFieldTypeException();
	}
}
public int getId(){
	return fieldId;
}
}
