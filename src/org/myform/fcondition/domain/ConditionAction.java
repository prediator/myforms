package org.myform.fcondition.domain;

import java.util.List;

public class ConditionAction {
private Long condActionId;
private Long conditionConfigId;
private String value;
private List<String> valueList;
public Long getCondActionId() {
	return condActionId;
}
public void setCondActionId(Long condActionId) {
	this.condActionId = condActionId;
}
public Long getConditionConfigId() {
	return conditionConfigId;
}
public void setConditionConfigId(Long conditionConfigId) {
	this.conditionConfigId = conditionConfigId;
}
public String getValue() {
	return value;
}
public void setValue(String value) {
	this.value = value;
}
public List<String> getValueList() {
	return valueList;
}
public void setValueList(List<String> valueList) {
	this.valueList = valueList;
}
}
