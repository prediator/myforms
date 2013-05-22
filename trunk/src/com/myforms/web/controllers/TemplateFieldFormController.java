package com.myforms.web.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myforms.constants.MyFormsConstants;
import com.myforms.field.ListValue;
import com.myforms.templatefield.service.TemplateFieldManager;
import com.myforms.util.MyFormProperties;

@Controller
public class TemplateFieldFormController {
	@Autowired
	private TemplateFieldManager templateFieldManager;
	
	public TemplateFieldManager getTemplateFieldManager() {
		return templateFieldManager;
	}

	public void setTemplateFieldManager(TemplateFieldManager templateFieldManager) {
		this.templateFieldManager = templateFieldManager;
	}

	@RequestMapping(value = "/getListForUser.html")
	@ResponseBody
	public String getListForUser(){
		List<com.myforms.field.List> lists = getTemplateFieldManager().getListForUser(MyFormProperties.getInstance().getCurrentUser());
		JSONArray listArray = new JSONArray();
		if(!CollectionUtils.isEmpty(lists)){
			for(com.myforms.field.List list : lists){
				JSONObject obj = new JSONObject();
				obj.put(list.getId(), list.getName());
				listArray.add(obj);
			}
		}
		return listArray.toString();
	}
	@RequestMapping(value = "/saveTemplateList.html")
	@ResponseBody
	public String saveList(TemplateList list, Model model)
	{		
		com.myforms.field.List templateList = new com.myforms.field.List();
		templateList.setCreatedBy(MyFormProperties.getInstance().getCurrentUser());
		templateList.setCreatedOn(new Date(System.currentTimeMillis()));
		templateList.setDescription(list.getName());
		templateList.setVersion(MyFormsConstants.VERSION);
		templateList.setName(list.getName());
		List<ListValue> listValues= new ArrayList<ListValue>();
		templateList.setValues(listValues);
		for(String val : list.getValues()){
			ListValue listValue = new ListValue();
			listValue.setValue(val);
			listValues.add(listValue);
		}
		templateFieldManager.saveTemplateList(templateList);
		JSONObject returnVal = new JSONObject();
		returnVal.put("id", templateList.getId());
		returnVal.put("name", templateList.getName());
		return returnVal.toString();
	}
	/**
	 * 
	 * @author Family
	 *
	 */
	private static class TemplateList{
		String name;
		List<String> values;
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public List<String> getValues() {
			return values;
		}
		public void setValues(List<String> values) {
			this.values = values;
		}
	}
}
