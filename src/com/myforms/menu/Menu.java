package com.myforms.menu;

import java.util.Collections;
import java.util.List;

public class Menu {
private Integer id;
private String name;
private List<MenuItem> menuItems;
private String groupId;

public List<MenuItem> getMenuItems() {
	return menuItems;
}
public void setMenuItems(List<MenuItem> menuItems) {
	Collections.sort(menuItems, new MenuItem.MenuItemComaprator());
	this.menuItems = menuItems;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getGroupId() {
	return groupId;
}
public void setGroupId(String groupId) {
	this.groupId = groupId;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
}
