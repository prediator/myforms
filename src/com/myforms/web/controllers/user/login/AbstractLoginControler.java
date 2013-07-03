package com.myforms.web.controllers.user.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import com.myforms.security.SecurityContextAccessor;
import com.myforms.usergroup.service.UserGroupService;
import com.myforms.util.MyFormProperties;
import com.myforms.util.PropertyEditor;
import com.myforms.web.validator.login.LoginValidator;

public abstract class AbstractLoginControler {
	@Autowired
	private  AuthenticationManager authenticationManager;
	@Autowired 
	private LoginValidator loginValidator;
	@Autowired
	private UserGroupService userGroupService;
	@Autowired
	private SecurityContextAccessor securityContextAccessor;
	//private final static String defaultTargetUrl = PropertyEditor.getInstance().getProperty("myforms.login.default.url");
	/**
	 * This method will do authentication for the user. return true if successful else return false.
	 * @param user
	 * @return
	 */
protected final boolean doLogin(UserDetails user){
	if(user != null && doValidate(user)){
		user = userGroupService.getUserByUsername(user.getUsername());
		MyFormProperties.getInstance().setUser(user);
		Authentication request = new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword());
		Authentication result = authenticationManager.authenticate(request);
		SecurityContextHolder.getContext().setAuthentication(result);
		return true;
	}
	return false;
}
/**
 * If any login validator is provided the it will validate the user otherwise it will simply let user to proceed with login process
 * This method can be overridden to provide as per need 
 * @param user
 * @return
 */
protected boolean doValidate(UserDetails user){
	if(loginValidator != null)
		return loginValidator.validate(user);
	else 
		return true;
}
protected final String redirectView(){
	if (securityContextAccessor.isCurrentAuthenticationAnonymous()) {
		return "redirect:" + PropertyEditor.getInstance().getProperty("myforms.login.default.url");
	    } else {	      
	      return "login";
	    }
}
/**
 * 
 * @return
 */
public AuthenticationManager getAuthenticationManager() {
	return authenticationManager;
}
/**
 * 
 * @param authenticationManager
 */
public void setAuthenticationManager(AuthenticationManager authenticationManager) {
	this.authenticationManager = authenticationManager;
}
public void setLoginValidator(LoginValidator loginValidator) {
	this.loginValidator = loginValidator;
}
/**
 * 
 * @return
 */
public UserGroupService getUserGroupService() {
	return userGroupService;
}
/**
 * 
 * @param userGroupService
 */
public void setUserGroupService(UserGroupService userGroupService) {
	this.userGroupService = userGroupService;
}
}
