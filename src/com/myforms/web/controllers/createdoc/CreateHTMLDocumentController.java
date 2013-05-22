package com.myforms.web.controllers.createdoc;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.myforms.createdoc.RichTextDoc;
import com.myforms.createdoc.service.RichTextDocManager;
import com.myforms.exception.runtimeexception.RichTextDocValidationException;

@Controller
@RequestMapping("createHtmlDoc.html")
public class CreateHTMLDocumentController {
	@Autowired
	private RichTextDocManager richTextDocManager;
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView createDocument(RichTextDoc richTextDoc, Model model, HttpServletRequest request){
		if(richTextDoc.getRichTextDocId() != null && richTextDoc.getRichTextDocId() != 0){
			richTextDoc = richTextDocManager.getRichTextDoc(richTextDoc);
		}
		model.addAttribute(richTextDoc);
		model.addAttribute("errorCode", request.getParameter("errorCode"));
		Map<String, Object> refrenceData = new HashMap<String, Object>();
		//refrenceData.put("errorCode", request.getParameter("errorCode"));
		return new ModelAndView("common/createDoc","refrenceData",refrenceData);
	}
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView createDocument(RichTextDoc richTextDoc,Model model){
		String url = "";
		String error = "";
		try{
		richTextDocManager.saveRichTextDoc(richTextDoc);
		}catch (RichTextDocValidationException e) {
			error = "&errorCode="+e.getMessage();
		}
		url = "createHtmlDoc.html?documentId="+richTextDoc.getDocumentId()+"&richTextDocId="+ (richTextDoc.getRichTextDocId() == null?0:richTextDoc.getRichTextDocId()) + error;

		return new ModelAndView(new RedirectView(url));
	}
	public RichTextDocManager getRichTextDocManager() {
		return richTextDocManager;
	}
	public void setRichTextDocManager(RichTextDocManager richTextDocManager) {
		this.richTextDocManager = richTextDocManager;
	}

}
