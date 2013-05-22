package com.springfirst.simplecontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.rtf.RTFEditorKit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractCommandController;
import org.springframework.web.servlet.view.RedirectView;

import com.myforms.template.config.model.Template;
import com.myforms.template.service.CreateFetchTemplateServiceManager;
import com.myforms.usergroup.dao.UserGroupDao;
import com.myforms.usergroup.model.User;
import com.myforms.usergroup.service.UserGroupService;
import com.myforms.util.MyFormProperties;
import com.spring.model.Login;

import com.spring.service.LoginService;
import com.spring.service.securitymanager.SampleAuthenticationManager;
@Controller
public class HomeController extends AbstractCommandController {
	private  AuthenticationManager authenticationManager;
	private LoginService loginService;
	private CreateFetchTemplateServiceManager createFetchTemplateServiceManager;
	@Autowired
	private UserGroupService userGroupService;
	
	public CreateFetchTemplateServiceManager getCreateFetchTemplateServiceManager() {
		return createFetchTemplateServiceManager;
	}
	public void setCreateFetchTemplateServiceManager(
			CreateFetchTemplateServiceManager createFetchTemplateServiceManager) {
		this.createFetchTemplateServiceManager = createFetchTemplateServiceManager;
	}
	public LoginService getLoginService() {
		return loginService;
	}
	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}
	@Override
	protected void onBind(HttpServletRequest arg0, Object arg1, BindException arg2) throws Exception {
		// TODO Auto-generated method stub
		super.onBind(arg0, arg1, arg2);
	}
	@Override
	protected ModelAndView handle(HttpServletRequest arg0,
			HttpServletResponse arg1, Object object, BindException arg3)
			throws Exception {
		
		Login loginObj = (Login)object;
		User user=userGroupService.getUserByUsername(loginObj.getUsername());
		
		if(user != null){
		Authentication request = new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword());
		Authentication result = authenticationManager.authenticate(request);
		SecurityContextHolder.getContext().setAuthentication(result);
		}
		//suser.getClient().getTemplateList().get(0);
		MyFormProperties.getInstance().setUser(user);
		return new ModelAndView(new RedirectView("home.html"));
	}
	public  AuthenticationManager getAuthenticationManager() {
		return authenticationManager;
	}
	public  void setAuthenticationManager(
			AuthenticationManager authenticationManager) {
		this.authenticationManager = authenticationManager;
	}
	public UserGroupService getUserGroupService() {
		return userGroupService;
	}
	public void setUserGroupService(UserGroupService userGroupService) {
		this.userGroupService = userGroupService;
	}

}
