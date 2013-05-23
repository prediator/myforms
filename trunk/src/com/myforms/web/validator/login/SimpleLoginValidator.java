package com.myforms.web.validator.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;

import com.myforms.usergroup.service.UserGroupService;

public class SimpleLoginValidator implements LoginValidator {
	@Autowired
	private UserGroupService userGroupService;
	@Override
	public boolean validate(UserDetails user) {
		return userGroupService.getUserByUsername(user.getUsername()) != null;
	}
	public UserGroupService getUserGroupService() {
		return userGroupService;
	}
	public void setUserGroupService(UserGroupService userGroupService) {
		this.userGroupService = userGroupService;
	}

}
