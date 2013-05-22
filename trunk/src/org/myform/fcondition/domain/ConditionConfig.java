package org.myform.fcondition.domain;

import java.util.List;

import com.myforms.field.Field;
import com.myforms.field.config.model.TemplateField;

public class ConditionConfig {
private Long conditionConfigId;
private String conditionType;
private String expression;
private Boolean isEnabled;
private Boolean isOverrided;
private TemplateField tragetField;
private List<Condition> sourceConditions;
private ConditionAction conditionAction;
public Long getConditionConfigId() {
	return conditionConfigId;
}
public void setConditionConfigId(Long conditionConfigId) {
	this.conditionConfigId = conditionConfigId;
}
public String getConditionType() {
	return conditionType;
}
public void setConditionType(String conditionType) {
	this.conditionType = conditionType;
}
public String getExpression() {
	return expression;
}
public void setExpression(String expression) {
	this.expression = expression;
}
public Boolean getIsEnabled() {
	return isEnabled;
}
public void setIsEnabled(Boolean isEnabled) {
	this.isEnabled = isEnabled;
}
public Boolean getIsOverrided() {
	return isOverrided;
}
public void setIsOverrided(Boolean isOverrided) {
	this.isOverrided = isOverrided;
}
public TemplateField getTragetField() {
	return tragetField;
}
public void setTragetField(TemplateField tragetField) {
	this.tragetField = tragetField;
}
public ConditionAction getConditionAction() {
	return conditionAction;
}
public void setConditionAction(ConditionAction conditionAction) {
	this.conditionAction = conditionAction;
}
public List<Condition> getSourceConditions() {
	return sourceConditions;
}
public void setSourceConditions(List<Condition> sourceConditions) {
	this.sourceConditions = sourceConditions;
}
}
