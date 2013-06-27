package com.myforms.web.controllers.anonymous;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myforms.util.MessageReaderFactory;

/**
 * To show success/thank you messages only
 * @author mohd.irshad
 *
 */
@Controller
public class ThankYouMessageController {

	@RequestMapping(value="/thanks.html")
	public String thanks(Model model, String key) throws IOException{
		String msg = MessageReaderFactory.getMessageReader("").read(key);
		model.addAttribute("message", msg);
		return "thanks";
	}
}
