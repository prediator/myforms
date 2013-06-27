package com.myforms.field;

import com.myforms.field.config.model.BooleanValue;

/**
 * 
 * @author mohd.irshad
 *
 */
public class BooleanSelectedValue implements Comparable<BooleanSelectedValue> {
	private Long id;
	private Long fieldId;
private String value;
private Boolean selected;
private String displayName;
private int order;
public String getValue() {
	return value;
}
public void setValue(String value) {
	this.value = value;
}
public Boolean getSelected() {
	return selected;
}
public void setSelected(Boolean selected) {
	this.selected = selected;
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public Long getFieldId() {
	return fieldId;
}
public void setFieldId(Long fieldId) {
	this.fieldId = fieldId;
}
public String getDisplayName() {
	return displayName;
}
public void setDisplayName(String displayName) {
	this.displayName = displayName;
}
public int getOrder() {
	return order;
}
public void setOrder(int order) {
	this.order = order;
}
public int compareTo(BooleanSelectedValue b) {
	if(b == null)
		return -1;
	if(this.order < b.order)
		return -1;
	if( this.order > b.order )
		return 1;
	return 0;
}
}
