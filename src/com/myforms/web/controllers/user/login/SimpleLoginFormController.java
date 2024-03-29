package com.myforms.web.controllers.user.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.myforms.template.service.CreateFetchTemplateServiceManager;
import com.myforms.usergroup.model.User;
import com.spring.service.SaveUsersServiceManager;

@Controller
@RequestMapping("/login.html")
public class SimpleLoginFormController extends AbstractLoginControler{
@Autowired
private CreateFetchTemplateServiceManager createFetchTemplateServiceManager;
@Autowired
private SaveUsersServiceManager saveUsersServiceManager;

	@RequestMapping(method = RequestMethod.POST)
	public String handleRequest(User user, Model model) throws Exception {
		
		if(!super.doLogin(user)){
			return "redirect:login.html";
		}
		
		return "redirect:home.html";
	}
	@RequestMapping(method = RequestMethod.GET)
	public String login(User login) throws Exception {
		return redirectView();
	}
	

	/**
	 * 
	 * @return
	 */
	public CreateFetchTemplateServiceManager getCreateFetchTemplateServiceManager() {
		return createFetchTemplateServiceManager;
	}
	/**
	 * 
	 * @param createFetchTemplateServiceManager
	 */
	public void setCreateFetchTemplateServiceManager(
			CreateFetchTemplateServiceManager createFetchTemplateServiceManager) {
		this.createFetchTemplateServiceManager = createFetchTemplateServiceManager;
	}
	/**
	 * 
	 * @return
	 */
	public SaveUsersServiceManager getSaveUsersServiceManager() {
		return saveUsersServiceManager;
	}
	/**
	 * 
	 * @param saveUsersServiceManager
	 */
	public void setSaveUsersServiceManager(
			SaveUsersServiceManager saveUsersServiceManager) {
		this.saveUsersServiceManager = saveUsersServiceManager;
	}
}
