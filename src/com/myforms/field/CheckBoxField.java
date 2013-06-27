package com.myforms.field;

import com.myforms.constants.MyFormsConstants;
import com.myforms.field.config.model.TemplateField;
/**
 * 
 * @author mohd.irshad
 *
 */
public class CheckBoxField extends BooleanField{

	public CheckBoxField(TemplateField templateField) {
		super(templateField);
	}
	public CheckBoxField(){}
@Override
public String getFieldType() {
	// TODO Auto-generated method stub
	return MyFormsConstants.FieldType.CHECKBOX;
}
}
