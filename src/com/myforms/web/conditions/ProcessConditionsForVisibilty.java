package com.myforms.web.conditions;

import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.myform.fcondition.domain.Condition;
import org.myform.fcondition.domain.ConditionAction;
import org.myform.fcondition.domain.ConditionConfig;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.myforms.constants.JQueryConstants;
import com.myforms.constants.MyFormsConstants;
import com.myforms.exception.runtimeexception.Message;
import com.myforms.field.Field;
import com.myforms.field.ListField;
import com.myforms.field.RichTextField;
import com.myforms.field.TextField;
import com.myforms.field.config.model.TemplateField;
import com.myforms.web.model.Document;

public class ProcessConditionsForVisibilty implements ProcessConditions {
    
	public void processConditions(Map<String, Field> fields,Document document) {
		Iterator<String> iterator = fields.keySet().iterator();
		while (iterator.hasNext()) {
			String element = (String) iterator.next();
			Field field = fields.get(element);
			processConditionOnField(field,document);
		}
	}
	
	private void processConditionOnField(Field field, Document document){
		List<ConditionConfig> conditions = field.getTemplateField().getConditionsByTarget();
		if(CollectionUtils.isEmpty(conditions)){
			return;
		}
		for(ConditionConfig conditionConfig : conditions){
			if(MyFormsConstants.ConditionType.VISIBILTY.equalsIgnoreCase(conditionConfig.getConditionType())){
			processConditionByTraget(field,conditionConfig, document);
			}
		}
	}

	private void processConditionByTraget(Field field, ConditionConfig conditionConfig ,Document document) {
				String expression = conditionConfig.getExpression();
				if(!StringUtils.hasLength(expression)){
					return;
				}
				for(Condition cond : conditionConfig.getSourceConditions()){
				  boolean result = 	evaluateCondition(cond, document);
				  expression = expression.replace(cond.getConditionId().toString(), Boolean.toString(result));
				}
				if(evaluateExpression(expression)){
					if(MyFormsConstants.Conditions.VIS_NONE.equals(conditionConfig.getConditionAction().getValue())){
						document.getTemplate().getTemplateFieldMap().get(field.getTemplateField().getFieldName()).setIsVisible(false);
					}
					else{
						document.getTemplate().getTemplateFieldMap().get(field.getTemplateField().getFieldName()).setIsVisible(true);			
					}
				}
				buildRenderCondition(conditionConfig, field);
	}

	private void buildRenderCondition(ConditionConfig conditionConfig, Field field) {
		String ifExp = getIfExpression(conditionConfig);
		ConditionAction action = conditionConfig.getConditionAction();
		String actionStr =Message.getMessage(JQueryConstants.CHANGE_ATTR,
				new Object[]{JQueryConstants.FLD_DIV_PREFIX+field.getTemplateField().getFieldName(),JQueryConstants.DISPLAY,action.getValue().toLowerCase()});
		for(Condition condition : conditionConfig.getSourceConditions()){
			String method = "";
			if(MyFormsConstants.FieldType.LIST.equals(condition.getSourceField().getFieldType().getFieldType())){
				method = JQueryConstants.onChange;
			}
			else{
				method = JQueryConstants.onBlur;
			}
			condition.setRenderCondition(Message.getMessage(method,
					new Object[]{condition.getSourceField().getFieldName(),ifExp,actionStr}));
		}
	}
    public String getIfExpression(ConditionConfig conditionConfig){
		
		String exp = conditionConfig.getExpression();
		
		for(Condition condition : conditionConfig.getSourceConditions()){
			StringBuilder cond = new StringBuilder("$('#"+condition.getSourceField().getFieldName()+"').val()");
			cond.append(MyFormsConstants.Conditions.operators.get(condition.getOperator()));
			cond.append("'"+condition.getCompareValue()+"'");
			exp = exp.replace(condition.getConditionId().toString(),cond.toString());
			cond = null;
		}
		return exp;
    }
	private Boolean evaluateExpression(String expression) {
		Boolean result = null;
		String op = "";
		StringBuilder exp = new StringBuilder(expression.toUpperCase().replaceAll(" ", ""));

		while(exp.length()>0){
		if(exp.indexOf(MyFormsConstants.Boolean.TRUE) == 0){
			if(result == null)
				result = true;
			else if(MyFormsConstants.Boolean.AND.equals(op)){
				result = result && true;
			}
			else{
				result = result || true;
			}
			exp.replace(0, 4, "");
		}
		else if(exp.indexOf(MyFormsConstants.Boolean.FALSE) == 0){
			if(result == null)
				result = false;
			else if(MyFormsConstants.Boolean.AND.equals(op)){
				result = result && false;
			}
			else{
				result = result || false;
			}
			exp.replace(0, 5, "");

		}
		else if(exp.indexOf(MyFormsConstants.Boolean.AND) == 0){
			op = MyFormsConstants.Boolean.AND;
				exp.replace(0, MyFormsConstants.Boolean.AND.length(), "");			
		}
		else if(exp.indexOf(MyFormsConstants.Boolean.OR) == 0){
			op = MyFormsConstants.Boolean.OR;
				exp.replace(0, MyFormsConstants.Boolean.OR.length(), "");			
		}
		else{
			throw new RuntimeException("Invalid Expression");
		}
		
	}
		return result;
	}

	private boolean evaluateCondition(Condition cond, Document document) {
		Field field = document.getFieldMap().get(cond.getSourceField().getFieldName());
		if(field instanceof TextField){
			return evaluateCondition((TextField)field, cond, document);
			}
		else if(field instanceof ListField){
			return evaluateCondition((ListField)field, cond, document);
		}
		else if(field instanceof RichTextField){
			return false;
		}		
		return false;
	}
	

	private boolean evaluateCondition(TextField field, Condition cond, Document document) {
		String value = field.getFieldValue();
		boolean conditionValue = processConditionValue(value, cond.getCompareValue(),cond.getOperator());
		return conditionValue;
	}
private boolean evaluateCondition(ListField field, Condition cond, Document document) {

		String value = null;
		if(!CollectionUtils.isEmpty(field.getFieldValues()))
		value  = field.toString();
		boolean conditionValue = processConditionValue(value, cond.getCompareValue(),cond.getOperator());
		return conditionValue;
	}

	private boolean processConditionValue(String value, String compareValue, String operator) {
		if (MyFormsConstants.Conditions.OP_EQUAL.equals(operator)){
			return compareValue.equals(value);		
		}
		else if(MyFormsConstants.Conditions.OP_NOT_EQUAL.equals(operator)){
			return !compareValue.equals(value);	
		}
		return false;
	}

}
