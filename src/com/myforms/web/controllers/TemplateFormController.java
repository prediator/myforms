package com.myforms.web.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.myforms.constants.MyFormsConstants;
import com.myforms.template.config.model.Template;
import com.myforms.template.config.model.TemplateMetaData;
import com.myforms.util.MyFormProperties;
/**
 * This class is responsible to save/update templates.
 * @author mohd irshad
 *
 */
@Controller
public class TemplateFormController extends AbstractTemplateFormController{
	
	/**
	 * 
	 */
@Override
protected Object formBackingObject(HttpServletRequest arg0) throws Exception {
	TemplateMetaData templateMetaData = new TemplateMetaData();
	return templateMetaData;
}
/**
 * 
 */
@Override
protected Map referenceData(HttpServletRequest arg0) throws Exception {
	Map<String, Object> refrenceData = new HashMap<String, Object>();
	refrenceData.put(MyFormsConstants.PageGroup.KEY, MyFormsConstants.PageGroup.CREATE_UPDATE_TEMPLATE);
	return refrenceData;
}
/**
 * 
 */
@Override
protected ModelAndView onSubmit(HttpServletRequest req, HttpServletResponse res, Object object, BindException errors) throws Exception {
	TemplateMetaData templateMetaData = (TemplateMetaData)object;
	Template template = getTemplateDTO().transferToTemplate(templateMetaData); 
	saveUpdateTemplateServiceManager.saveTemplate(template);
	return new ModelAndView(new RedirectView("createUpdateTemplate.html"));
}

}
