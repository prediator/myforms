package org.myform.fcondition.domain;

import com.myforms.field.Field;
import com.myforms.field.config.model.TemplateField;

public class Condition {
private Long conditionId;
private String operator;
private String compareValue;
private String valueType;
private TemplateField sourceField;
private Boolean condResult;
private String renderCondition;

public Boolean getCondResult() {
	return condResult;
}
public void setCondResult(Boolean condResult) {
	this.condResult = condResult;
}
public String getRenderCondition() {
	return renderCondition;
}
public void setRenderCondition(String renderCondition) {
	this.renderCondition = renderCondition;
}
public String getCompareValue() {
	return compareValue;
}
public void setCompareValue(String compareValue) {
	this.compareValue = compareValue;
}
public Long getConditionId() {
	return conditionId;
}
public void setConditionId(Long conditionId) {
	this.conditionId = conditionId;
}
public boolean isCondResult() {
	return condResult;
}
public void setCondResult(boolean condResult) {
	this.condResult = condResult;
}
public String getOperator() {
	return operator;
}
public void setOperator(String operator) {
	this.operator = operator;
}
public TemplateField getSourceField() {
	return sourceField;
}
public void setSourceField(TemplateField sourceField) {
	this.sourceField = sourceField;
}
public String getValueType() {
	return valueType;
}
public void setValueType(String valueType) {
	this.valueType = valueType;
}
@Override
public String toString() {
	return "this " + operator + " "+ compareValue +"\n\n" + renderCondition;
}
}
