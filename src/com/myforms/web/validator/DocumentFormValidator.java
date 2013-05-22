package com.myforms.web.validator;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.myform.fcondition.process.ConditionUtil;
import org.springframework.context.MessageSource;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.myforms.constants.MyFormsConstants;
import com.myforms.field.Field;
import com.myforms.logging.MyFormsLogger;
import com.myforms.web.conditions.ProcessConditions;
import com.myforms.web.conditions.ProcessConditionsForRequired;
import com.myforms.web.conditions.ProcessConditionsForVisibilty;
import com.myforms.web.model.Document;

public class DocumentFormValidator implements Validator {
	private MessageSource messageSource;
	public static Map<String, FieldValidator> fieldValidatorFactory;
	static{
		fieldValidatorFactory = new HashMap<String, FieldValidator>();
		fieldValidatorFactory.put(MyFormsConstants.FieldType.TEXT, TextFieldValidator.getInstance());
			
	}
	public boolean supports(Class clazz) {
		// TODO Auto-generated method stub
		return clazz == Document.class;
	}

	public void validate(Object object, Errors errors) {
		Document document = (Document)object;
		ConditionUtil.processConditions(document);
        Map<String, Field> fieldMap = document.getFieldMap();
        Iterator<String> iterator = fieldMap.keySet().iterator();
        Map<String, List<Field>> fieldLists = new HashMap<String, List<Field>>();
        Set<String> fieldKeys= new HashSet<String>(); 
        while (iterator.hasNext()) {
			String key = (String) iterator.next();
			Field field = fieldMap.get(key);
			String fieldType = field.getTemplateField().getFieldType().getFieldType();
			List<Field> fieldList = fieldLists.get(fieldType);
			if(fieldList == null){
				fieldList = new ArrayList<Field>();
				fieldLists.put(fieldType, fieldList);
				fieldKeys.add(fieldType);
			}
			fieldList.add(field);
			fieldList = null;
		}
        //for(String fieldKey : fieldKeys)
        {
        	fieldValidatorFactory.get(MyFormsConstants.FieldType.TEXT).validate(fieldLists.get(MyFormsConstants.FieldType.TEXT), document, errors);
        }
        MyFormsLogger.getLogger().info(this.getClass(), "validate", "validator exit.");
        
	}

	public MessageSource getMessageSource() {
		return messageSource;
	}

	public void setMessageSource(MessageSource messageSource) {
		this.messageSource = messageSource;
	}

}
