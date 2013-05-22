package com.myforms.racf;

import java.util.List;

import com.myforms.usergroup.model.Role;
import com.myforms.usergroup.model.User;

public class Racf {
private Long racfId;
private User user;
private List<String> racfNodes;
private List<Role> userRoles;
public Long getRacfId() {
	return racfId;
}
public void setRacfId(Long racfId) {
	this.racfId = racfId;
}
public User getUser() {
	return user;
}
public void setUser(User user) {
	this.user = user;
}
public List<String> getRacfNodes() {
	return racfNodes;
}
public void setRacfNodes(List<String> racfNodes) {
	this.racfNodes = racfNodes;
}
public List<Role> getUserRoles() {
	return userRoles;
}
public void setUserRoles(List<Role> userRoles) {
	this.userRoles = userRoles;
}

}
