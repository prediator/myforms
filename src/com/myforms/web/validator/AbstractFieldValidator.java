package com.myforms.web.validator;

import java.util.List;

import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;

import com.myforms.field.Field;
import com.myforms.field.config.model.TemplateField;
import com.myforms.logging.MyFormsLogger;
import com.myforms.web.model.Document;

public abstract class AbstractFieldValidator implements FieldValidator, Cloneable{
	@Override
	protected Object clone() throws CloneNotSupportedException {
		throw new CloneNotSupportedException("This class/sublclass doesnot support cloning");	
	}
	public void validate(List<Field> fields, Document document, Errors errors) {
		validateRequiredFields(fields,document,errors);

	}
	public void validateRequiredFields(List<Field> fields, Document document, Errors errors){
		for(Field field : fields){
			validateRequiredField(field,document,errors);
		}
	}
	public void validateRequiredField(Field field, Document document, Errors errors){
		TemplateField templateField = document.getTemplate().
										getTemplateFieldMap().get(field.getTemplateField().getFieldName());
		if(templateField.getIsRequired()){
			if(!StringUtils.hasLength(field.getFieldValue())){
				errors.rejectValue("fieldMap["+field.getTemplateField().getFieldName()+"]","ec.required",new Object[]{field.getTemplateField().getFieldTitle(),field.getTemplateField().getFieldName()},field.getTemplateField().getFieldTitle() + " is Required Field" );
				MyFormsLogger.getLogger().info(field.getTemplateField().getFieldName() + "is a required field");
			}
		}
	} 
}
