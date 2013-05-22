package com.myforms.racf;

import java.util.List;

public class AccessType {
private String accessId;
private String accessName;
private List<AccessType> accessTypes;
public String getAccessId() {
	return accessId;
}
public void setAccessId(String accessId) {
	this.accessId = accessId;
}
public String getAccessName() {
	return accessName;
}
public void setAccessName(String accessName) {
	this.accessName = accessName;
}
public List<AccessType> getAccessTypes() {
	return accessTypes;
}
public void setAccessTypes(List<AccessType> accessTypes) {
	this.accessTypes = accessTypes;
}

}
