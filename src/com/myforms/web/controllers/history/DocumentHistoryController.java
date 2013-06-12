package com.myforms.web.controllers.history;

import java.util.Date;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myforms.history.HistoryTemplateField;
import com.myforms.history.service.DocumentHistoryService;

@Controller
public class DocumentHistoryController {
	@Autowired(required=true)
	private DocumentHistoryService documentHistoryService;
	@Autowired(required=true)
	private Validator validator;
	
	@RequestMapping(value="/saveHistoryFieldConfig.html")
	@ResponseBody
	public String saveHistoryFieldConfig(HistoryTemplateField historyTemplateField){ 
											//BindingResult result){
		historyTemplateField.setCreatedDate(new Date(System.currentTimeMillis()));
		//validator.validate(historyTemplateField, result);
		//if(result.hasErrors())
		{
			//return "fail";
		}
		documentHistoryService.saveHistoryTemplateConfig(historyTemplateField);
		
		return JSONObject.fromObject(historyTemplateField).toString();
	}
}
