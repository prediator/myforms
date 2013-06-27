package com.myforms.field;

import com.myforms.constants.MyFormsConstants;
import com.myforms.field.config.model.TemplateField;
/**
 * 
 * @author mohd.irshad
 *
 */
public class RadioField  extends BooleanField{

	public RadioField(TemplateField templateField) {
		super(templateField);
	}
	public RadioField(){}
@Override
public String getFieldType() {
	return MyFormsConstants.FieldType.RADIO;
}
}
