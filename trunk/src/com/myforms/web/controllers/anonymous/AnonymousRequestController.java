package com.myforms.web.controllers.anonymous;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myforms.anonymous.ClientSetupInfo;
import com.myforms.usergroup.service.UserGroupService;

/**
 * This controller will be used for the anonymous request only. No security would be need for url defined in this controller
 * @author mohd.irshad
 *
 */
@Controller
@RequestMapping("/clientSetupRequest.html")
public class AnonymousRequestController {
	/**
	 * 
	 */
	@Autowired
	private UserGroupService userGroupService;
	@Autowired(required=true)
	private Validator validator;
	/**
	 * 
	 * @return
	 */
	@RequestMapping(method=RequestMethod.GET)
	public String viewClientSetup(Model model){
		ClientSetupInfo clientSetupInfo = new ClientSetupInfo();
		model.addAttribute("clientSetupInfo", clientSetupInfo);
		return "clientSetup";
	}
	/**
	 * 
	 * @param clientSetupInfo
	 * @return
	 */
	@RequestMapping(method=RequestMethod.POST)
	public String saveAnonumousClient(ClientSetupInfo clientSetupInfo, BindingResult result){
		validator.validate(clientSetupInfo, result);
		
		if(result.hasErrors())
			return "clientSetup";
		userGroupService.saveAnonymousClientSetupInfo(clientSetupInfo);
		return "redirect:thanks.html?key=clientSetupThanks";
	}
	
	/*@RequestMapping(value="/thanks.html")
	public String thanks(ClientSetupInfo clientSetupInfo, BindingResult result){
		
		return "thanksAnonumousClient";
	}*/
	
}
