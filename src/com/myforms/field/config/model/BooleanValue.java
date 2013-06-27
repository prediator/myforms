package com.myforms.field.config.model;
/**
 * 
 * @author mohd.irshad
 *
 */
public class BooleanValue implements Comparable<BooleanValue> {
private Long id;
private String value;
private String displayName;
private Boolean selected;
private Long templateFieldId;
private int order;
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getValue() {
	return value;
}
public void setValue(String value) {
	this.value = value;
}
public String getDisplayName() {
	return displayName;
}
public void setDisplayName(String displayName) {
	this.displayName = displayName;
}
public Boolean getSelected() {
	return selected;
}
public void setSelected(Boolean selected) {
	this.selected = selected;
}
public Long getTemplateFieldId() {
	return templateFieldId;
}
public void setTemplateFieldId(Long templateFieldId) {
	this.templateFieldId = templateFieldId;
}
public int getOrder() {
	return order;
}
public void setOrder(int order) {
	this.order = order;
}
@Override
public int compareTo(BooleanValue b) {
	if(b == null)
		return -1;
	if(this.order < b.order)
		return -1;
	if( this.order > b.order )
		return 1;
	return 0;
}
}
