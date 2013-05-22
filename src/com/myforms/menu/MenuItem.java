package com.myforms.menu;

import java.util.Comparator;
import java.util.List;

public class MenuItem implements Comparable<MenuItem>{
private Integer id;
private String name;
private String link;
private String jsMethod;
private String js;
private Boolean jsMenu;
private String helpText;
private Boolean isVisible;
private Boolean isEnabled;
private List<Menu> childMenus;
private Integer sortOrder;

public Integer getSortOrder() {
	return sortOrder;
}
public void setSortOrder(Integer sortOrder) {
	this.sortOrder = sortOrder;
}
public List<Menu> getChildMenus() {
	return childMenus;
}
public void setChildMenus(List<Menu> childMenus) {
	this.childMenus = childMenus;
}
public String getHelpText() {
	return helpText;
}
public void setHelpText(String helpText) {
	this.helpText = helpText;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public Boolean getIsEnabled() {
	return isEnabled;
}
public void setIsEnabled(Boolean isEnabled) {
	this.isEnabled = isEnabled;
}
public Boolean getIsVisible() {
	return isVisible;
}
public void setIsVisible(Boolean isVisible) {
	this.isVisible = isVisible;
}
public String getJs() {
	return js;
}
public void setJs(String js) {
	this.js = js;
}
public Boolean getJsMenu() {
	return jsMenu;
}
public void setJsMenu(Boolean jsMenu) {
	this.jsMenu = jsMenu;
}
public String getJsMethod() {
	return jsMethod;
}
public void setJsMethod(String jsMethod) {
	this.jsMethod = jsMethod;
}
public String getLink() {
	return link;
}
public void setLink(String link) {
	this.link = link;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int compareTo(MenuItem o) {
	return this.getId().compareTo(o.getId());
}
public static class MenuItemComaprator implements Comparator<MenuItem>{

	public int compare(MenuItem o1, MenuItem o2) {
		return o1.getSortOrder().compareTo(o2.getSortOrder());
	}
	
}
}
