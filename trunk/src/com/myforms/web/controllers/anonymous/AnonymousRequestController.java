package com.myforms.web.controllers.anonymous;

import java.io.IOException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myforms.anonymous.ClientSetupInfo;
import com.myforms.constants.MyFormsConstants;
import com.myforms.mail.MailMessage;
import com.myforms.mail.MailSender;
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
	@Autowired
	private MailSender mailSender;
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
	 * @throws MessagingException 
	 * @throws MailException 
	 * @throws IOException 
	 */
	@RequestMapping(method=RequestMethod.POST)
	public String saveAnonumousClient(ClientSetupInfo clientSetupInfo, BindingResult result) throws MailException, MessagingException, IOException{
		validator.validate(clientSetupInfo, result);
		
		if(result.hasErrors())
			return "clientSetup";
		clientSetupInfo.setStatus(MyFormsConstants.AnymClientStatus.NA);
		userGroupService.saveAnonymousClientSetupInfo(clientSetupInfo);
		MailMessage mailMessage = new MailMessage();
		mailMessage.setTo(clientSetupInfo.getEmailId());
		mailMessage.setMessageKey(MyFormsConstants.MeesageKey.CLIENT_THANKS);
		mailMessage.setFrom("from@myforms.com");
		mailMessage.setSubject("Subject");
		mailMessage.setReplyTo("noreply@myforms.com");
		mailMessage.setHTML(true);
		mailSender.send(mailMessage);
		return "redirect:thanks.html?key="+MyFormsConstants.MeesageKey.CLIENT_THANKS;
	}
	
	/*@RequestMapping(value="/thanks.html")
	public String thanks(ClientSetupInfo clientSetupInfo, BindingResult result){
		
		return "thanksAnonumousClient";
	}*/
	
}
