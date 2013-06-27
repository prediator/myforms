package com.myforms.web.validator;

import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;

import com.myforms.field.BooleanField;
import com.myforms.field.BooleanSelectedValue;
import com.myforms.field.Field;
import com.myforms.field.config.model.TemplateField;
import com.myforms.logging.MyFormsLogger;
import com.myforms.web.model.Document;

public class BooleanFieldValidator extends AbstractFieldValidator {
private static BooleanFieldValidator booleanFieldValidator;
static{
	booleanFieldValidator = new BooleanFieldValidator();
}
private BooleanFieldValidator(){}
public static BooleanFieldValidator getInstance(){
	return booleanFieldValidator;
}
@Override
protected void validateRequiredField(Field field, Document document, Errors errors){
	TemplateField templateField = document.getTemplate().
									getTemplateFieldMap().get(field.getTemplateField().getFieldName());
	BooleanField b = (BooleanField)field;
	if(templateField.getIsRequired()){
		boolean isSelected = false;
		if(b.getSelectedValues() != null){
			for(BooleanSelectedValue s  : b.getSelectedValues()){
				if(s.getSelected() != null && s.getSelected())
					isSelected = true;
			}
		}
		if(!isSelected){
			errors.rejectValue("fieldMap["+field.getTemplateField().getFieldName()+"]","ec.required",new Object[]{field.getTemplateField().getFieldTitle(),field.getTemplateField().getFieldName()},field.getTemplateField().getFieldTitle() + " is Required Field" );
			MyFormsLogger.getLogger().info(field.getTemplateField().getFieldName() + "is a required field");
		}
	}
} 
}
