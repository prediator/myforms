package com.myforms.web.controllers;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.validation.Errors;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.myforms.constants.MyFormsConstants;
import com.myforms.document.service.SaveUpdateDocumentServiceManager;
import com.myforms.field.CheckBoxField;
import com.myforms.field.DateField;
import com.myforms.field.ListField;
import com.myforms.field.NumberField;
import com.myforms.field.RadioField;
import com.myforms.field.RichTextField;
import com.myforms.field.TextField;
import com.myforms.field.propertyeditor.BooleanFieldProprtyEditor;
import com.myforms.field.propertyeditor.DateFieldPropertyEditor;
import com.myforms.field.propertyeditor.ListFieldPropertyEditor;
import com.myforms.field.propertyeditor.NumberFieldPropertyEditor;
import com.myforms.field.propertyeditor.RichTextFieldEditor;
import com.myforms.field.propertyeditor.TextFieldPropertyEditor;
import com.myforms.field.service.FieldServiceManager;
import com.myforms.web.model.Document;

public abstract class AbstractDocumentFormController extends SimpleFormController {
	private SaveUpdateDocumentServiceManager saveUpdateDocumentServiceManager;
    private FieldServiceManager fieldServiceManager;

@Override
protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
	//binder.registerCustomEditor(Field.class, new FieldPropertyEditor());	
	binder.registerCustomEditor(TextField.class,new TextFieldPropertyEditor(fieldServiceManager));
	binder.registerCustomEditor(ListField.class,new ListFieldPropertyEditor(fieldServiceManager));
	binder.registerCustomEditor(RichTextField.class,new RichTextFieldEditor(fieldServiceManager));
	binder.registerCustomEditor(DateField.class,new DateFieldPropertyEditor(fieldServiceManager));
	binder.registerCustomEditor(NumberField.class,new NumberFieldPropertyEditor(fieldServiceManager));
	binder.registerCustomEditor(CheckBoxField.class,new BooleanFieldProprtyEditor(fieldServiceManager));
	binder.registerCustomEditor(RadioField.class,new BooleanFieldProprtyEditor(fieldServiceManager));
	super.initBinder(request, binder);
}
@Override
protected void onBind(HttpServletRequest arg0, Object arg1, BindException arg2) throws Exception {
	// TODO Auto-generated method stub
	super.onBind(arg0, arg1, arg2);
}
@Override
protected void onBind(HttpServletRequest arg0, Object arg1) throws Exception {
	// TODO Auto-generated method stub
	super.onBind(arg0, arg1);
}
@Override
protected ModelAndView showForm(HttpServletRequest request, HttpServletResponse arg1, BindException bind) throws Exception {
	getCommand(request);
	Document document = (Document)bind.getModel().get(MyFormsConstants.DocumentConstants.DOCUMENT);
	String templateId = ServletRequestUtils.getStringParameter(request, MyFormsConstants.DocumentConstants.TEMPLATE_ID);
	if(templateId == null)
		templateId  = document.getTemplate().getTemplateId().toString();
	setFormView(MyFormsConstants.TEMPLATE_PATH+templateId);
	//set topmenu key

	return super.showForm(request, arg1, bind);
}
@Override
protected Map referenceData(HttpServletRequest arg0, Object arg1, Errors arg2) throws Exception {
	Map<String, Object> refrenceData = new HashMap<String, Object>();
	refrenceData.put(MyFormsConstants.PageGroup.KEY, MyFormsConstants.PageGroup.TEMPLATE);
	return refrenceData;
}
@Override
protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse arg1, Object arg2, BindException arg3) throws Exception {
	// TODO Auto-generated method stub

	return super.onSubmit(request, arg1, arg2, arg3);
}
public SaveUpdateDocumentServiceManager getSaveUpdateDocumentServiceManager() {
	return saveUpdateDocumentServiceManager;
}
public void setSaveUpdateDocumentServiceManager(
		SaveUpdateDocumentServiceManager saveUpdateDocumentServiceManager) {
	this.saveUpdateDocumentServiceManager = saveUpdateDocumentServiceManager;
}
public FieldServiceManager getFieldServiceManager() {
	return fieldServiceManager;
}
public void setFieldServiceManager(FieldServiceManager fieldServiceManager) {
	this.fieldServiceManager = fieldServiceManager;
}


}
