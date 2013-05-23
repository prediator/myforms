package com.myforms.web.controllers.user.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.myforms.constants.MyFormsConstants;
@Controller
public class HomeController {
	
	@RequestMapping(value="/home.html")	
	public  ModelAndView handle(Model model)
			throws Exception {
		return new ModelAndView("home",MyFormsConstants.PageGroup.KEY, MyFormsConstants.PageGroup.HOME);
	}
	

}
