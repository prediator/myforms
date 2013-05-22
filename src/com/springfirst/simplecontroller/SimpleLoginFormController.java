package com.springfirst.simplecontroller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.freemarker.template.config.TemplateConfiguration;
import com.freemarker.template.config.TemplateConfigurationImpl;
import com.myforms.constants.MyFormsConstants;
import com.myforms.template.service.CreateFetchTemplateServiceManager;
import com.spring.connectivity.dao.LoginDao;
import com.spring.model.Login;
import com.spring.service.LoginService;
import com.spring.service.SaveUsersServiceManager;

public class SimpleLoginFormController extends  AbstractController {
private LoginService loginService;
private CreateFetchTemplateServiceManager createFetchTemplateServiceManager;
public CreateFetchTemplateServiceManager getCreateFetchTemplateServiceManager() {
	return createFetchTemplateServiceManager;
}
public void setCreateFetchTemplateServiceManager(
		CreateFetchTemplateServiceManager createFetchTemplateServiceManager) {
	this.createFetchTemplateServiceManager = createFetchTemplateServiceManager;
}
private SaveUsersServiceManager saveUsersServiceManager;
	public SaveUsersServiceManager getSaveUsersServiceManager() {
	return saveUsersServiceManager;
}
public void setSaveUsersServiceManager(
		SaveUsersServiceManager saveUsersServiceManager) {
	this.saveUsersServiceManager = saveUsersServiceManager;
}

	public LoginService getLoginService() {
	return loginService;
}
public void setLoginService(LoginService loginService) {
	this.loginService = loginService;
}
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		Login login=new Login();
		login.setPassword("irs");
		login.setUsername("mohd");
		saveUsersServiceManager.saveUser(login);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put(MyFormsConstants.PageGroup.KEY, MyFormsConstants.PageGroup.HOME);
		return new ModelAndView("home",map);
	}

}
