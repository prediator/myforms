package com.myforms.field;

import java.util.Date;

import com.myforms.usergroup.model.User;

public class List {
private Long id;
private String name;
private String description;
private String version;
private User createdBy;
private Date createdOn;
private java.util.List<ListValue> values;
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public User getCreatedBy() {
	return createdBy;
}
public void setCreatedBy(User createdBy) {
	this.createdBy = createdBy;
}
public Date getCreatedOn() {
	return createdOn;
}
public void setCreatedOn(Date createdOn) {
	this.createdOn = createdOn;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public java.util.List<ListValue> getValues() {
	return values;
}
public void setValues(java.util.List<ListValue> values) {
	this.values = values;
}
public String getVersion() {
	return version;
}
public void setVersion(String version) {
	this.version = version;
}
}
