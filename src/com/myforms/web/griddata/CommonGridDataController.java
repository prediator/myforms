package com.myforms.web.griddata;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.SortedSet;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myforms.client.Client;
import com.myforms.constants.MyFormsConstants;
import com.myforms.document.service.CreateFetchDocumentServiceManager;
import com.myforms.history.DocumentHistory;
import com.myforms.history.HistoryTemplateField;
import com.myforms.history.service.DocumentHistoryService;
import com.myforms.template.config.model.Template;
import com.myforms.template.service.CreateFetchTemplateServiceManager;
import com.myforms.usergroup.model.User;
import com.myforms.usergroup.service.UserGroupService;
import com.myforms.util.MyFormProperties;
import com.myforms.web.model.Document;


@Controller
public class CommonGridDataController {
	@Autowired
	private CreateFetchTemplateServiceManager createFetchTemplateServiceManager;
	@Autowired
	private CreateFetchDocumentServiceManager createFetchDocumentServiceManager;
	@Autowired
	private UserGroupService userGroupService;
	@Autowired(required=true)
	private DocumentHistoryService documentHistoryService;
	
	@RequestMapping(value = "/templateData.html")
	@ResponseBody
	public String templateDataHandler(Model model){
		JSONArray templatesArray = new JSONArray();
		User user= MyFormProperties.getInstance().getCurrentUser();
		
		List<Template> templates = user.getClient().getTemplateList();
		
		for(Template template : templates){
			JSONObject templateJson = new JSONObject();
			templateJson.put(MyFormsConstants.JsonFieldNames.Template.TEMPLATE_ID, template.getTemplateId());
			templateJson.put(MyFormsConstants.JsonFieldNames.Template.TEMPLATE_NAME, template.getTemplateName());
			templateJson.put(MyFormsConstants.JsonFieldNames.Template.TEMPLATE_TITLE, template.getTemplateTitle());
			templateJson.put(MyFormsConstants.JsonFieldNames.Template.TEMPLATE_DESCRIPTION, template.getDescription());
			JSONObject page = new JSONObject();
			page.put(MyFormsConstants.JsonFieldNames.CELL, templateJson);
			templatesArray.add(page);
		}
		JSONObject returnobj= new JSONObject();
		returnobj.put(MyFormsConstants.JsonFieldNames.PAGE,1);
		returnobj.put(MyFormsConstants.JsonFieldNames.TOTAL, templates.size());
		returnobj.put(MyFormsConstants.JsonFieldNames.ROWS, templatesArray.toArray());
		
		return returnobj.toString();
	}
	
	@RequestMapping(value = "/documentData.html")
	@ResponseBody
	public String documentDataHandler(Model model){
		JSONArray documentsArray = new JSONArray();
		List<Document> documents= createFetchDocumentServiceManager.getAllDocuments();
		
		for(Document document : documents){
			JSONObject documentJson = new JSONObject();
			
			documentJson.put(MyFormsConstants.JsonFieldNames.Document.DOCUMENT_ID, document.getDisplayId());
			documentJson.put(MyFormsConstants.JsonFieldNames.Document.TEMPLATE_NAME, document.getTemplate().getTemplateName());
			documentJson.put(MyFormsConstants.JsonFieldNames.Document.DOCUMENT_TITLE, document.getTitle() == null ? MyFormsConstants.EMPTY_SRING : document.getTitle());
			
			DateFormat dateFormat = new SimpleDateFormat(MyFormsConstants.DATE_FORMAT);
			documentJson.put(MyFormsConstants.JsonFieldNames.Document.CREATED_ON, dateFormat.format(document.getCreatedOn()));
			documentJson.put(MyFormsConstants.JsonFieldNames.Document.CREATED_BY, document.getCreatedBy().getFirstName() + " "+document.getCreatedBy().getLastName());
			
			JSONObject page = new JSONObject();
			page.put(MyFormsConstants.JsonFieldNames.CELL, documentJson);
			documentsArray.add(page);
		}
		JSONObject returnobj= new JSONObject();
		returnobj.put(MyFormsConstants.JsonFieldNames.PAGE,1);
		returnobj.put(MyFormsConstants.JsonFieldNames.TOTAL, documents.size());
		returnobj.put(MyFormsConstants.JsonFieldNames.ROWS, documentsArray.toArray());
		
		return returnobj.toString();
	}
@RequestMapping(value= "/clientsData.html")
@ResponseBody
public String getClientData(){
	JSONArray array = new JSONArray();
	JSONObject header = new JSONObject();
	header.put("id", "0");
	header.put("name", "Client Name");
	header.put("description", "Description");
	
	array.add(header);
	List<Client> clients = userGroupService.getAllClients();
	
	if(!CollectionUtils.isEmpty(clients)){
		for(Client clnt : clients ){
			JSONObject object = new JSONObject();
			object.put("id", clnt.getClientId());
			object.put("name", clnt.getClientName());
			object.put("description", clnt.getDescription());			
			array.add(object);
		}
	}	
	return array.toString();
}
/**
 * 
 * @return
 */
@RequestMapping(value= "/clientTemplateFieldData.html")
@ResponseBody
public String getClientTemplateFieldData(Integer templateId){
	Template template = findTemplate(templateId);
	JSONObject object = new JSONObject();
	JSONObject result = new JSONObject();
	if(template != null){
		template = createFetchTemplateServiceManager.getTemplateById(templateId);
		if(template.getTemplateFieldMap() != null){		
			for(String key : template.getTemplateFieldMap().keySet()){
				object.put(key, template.getTemplateFieldMap().get(key).getFieldTitle());
			}
		}
	}
	if(templateId != null && templateId.intValue() != 0){
		HistoryTemplateField historyTemplateField = documentHistoryService.getHistoryTemplateField(templateId.longValue());
		result.put("historyTemplateField", historyTemplateField);
	}
	result.put("result", object);
	return result.toString();
}
/**
 * 
 * @return
 */
@RequestMapping(value= "/clientTemplateData.html")
@ResponseBody
public String getClientTemplateData(){
	JSONArray array = new JSONArray();
	JSONObject header = new JSONObject();
	header.put(MyFormsConstants.JsonFieldNames.Template.TEMPLATE_ID, "0");
	header.put(MyFormsConstants.JsonFieldNames.Template.TEMPLATE_NAME, "Template Name");
	header.put(MyFormsConstants.JsonFieldNames.Template.TEMPLATE_TITLE, "Title");
	header.put(MyFormsConstants.JsonFieldNames.Template.TEMPLATE_DESCRIPTION,"Description");
	
	array.add(header);
	array = clientTemplateToJason(array);
	return array.toString();
}
/**
 * 
 * @return
 */
private JSONArray clientTemplateToJason(JSONArray templatesArray){
	if(templatesArray == null)
	 templatesArray = new JSONArray();
	User user= MyFormProperties.getInstance().getCurrentUser();
	
	List<Template> templates = user.getClient().getTemplateList();
	
	for(Template template : templates){
		JSONObject templateJson = new JSONObject();
		templateJson.put(MyFormsConstants.JsonFieldNames.Template.TEMPLATE_ID, template.getTemplateId());
		templateJson.put(MyFormsConstants.JsonFieldNames.Template.TEMPLATE_NAME, template.getTemplateName());
		templateJson.put(MyFormsConstants.JsonFieldNames.Template.TEMPLATE_TITLE, template.getTemplateTitle());
		templateJson.put(MyFormsConstants.JsonFieldNames.Template.TEMPLATE_DESCRIPTION, template.getDescription());
		templatesArray.add(templateJson);
	}
	return templatesArray;
} 
/**
 * 
 * @param templateId
 * @return
 */
private Template findTemplate(Integer templateId){
User user= MyFormProperties.getInstance().getCurrentUser();
	
	List<Template> templates = user.getClient().getTemplateList();
	
	for(Template template : templates){
	if(template.getTemplateId().equals(templateId));
		return template;
	}
	return null;
}
/**
 * 
 * @return
 */
@RequestMapping(value="/getDocumentHistory.html")
@ResponseBody
public String getDocumentHistory(Long documentId, Long templateId){
	List<DocumentHistory> documentHistories = documentHistoryService.getDocumentHistory(documentId);
	JSONArray array = prepareDocumentHistory(documentHistories, templateId);
	return array.toString();
}
/**
 * 
 * @param documentHistories
 * @param templateId 
 * @return
 */
private JSONArray prepareDocumentHistory(
		List<DocumentHistory> documentHistories, Long templateId) {
	HistoryTemplateField historyTemplateField = documentHistoryService.getHistoryTemplateField(templateId);
	JSONArray array = new JSONArray();
	if(historyTemplateField == null)
		return array;
	
	JSONObject historySetup = prepareHeader(historyTemplateField, templateId);
	JSONObject hstr = (JSONObject)historySetup.get("names");
	JSONObject id = (JSONObject)historySetup.get("id");
	hstr.put("UPDATED_BY", "Updated By");
	hstr.put("UPDATED_ON", "Updated On");
	array.add(hstr);
	Date date = null;
	JSONObject jsonObject = null;
	if(documentHistories != null && hstr.size() > 2){
		for(DocumentHistory documentHistory : documentHistories){
			if(date != null && !documentHistory.getUpdatedOn().equals(date))
				array.add(jsonObject);
			if(date == null || !documentHistory.getUpdatedOn().equals(date)){
				date = documentHistory.getUpdatedOn();
				jsonObject = new JSONObject();
				jsonObject.put("UPDATED_BY", MyFormProperties.getInstance().getCurrentUser().getName());
				jsonObject.put("UPDATED_ON", MyFormsConstants.SIMPLE_DATE_FORMAT.format(date));
				
			}
			if(documentHistory.getUpdatedOn().equals(date)){
				jsonObject.put(id.get(String.valueOf(documentHistory.getTemplateFieldId())), documentHistory.getFieldValue());
			}
		}
		if(jsonObject != null && !array.contains(jsonObject))
			array.add(jsonObject);
	}
	return array;
}
/**
 * 
 * @param historyTemplateField
 * @param templateId
 * @return
 */
private JSONObject prepareHeader(HistoryTemplateField historyTemplateField,
		Long templateId) {
	Template tmpl = createFetchTemplateServiceManager.getTemplateById(templateId.intValue());
	JSONObject historySetup = new JSONObject();
	JSONObject names = new JSONObject();
	JSONObject id = new JSONObject();	
	if(historyTemplateField.getFieldNames()  != null && tmpl.getTemplateFieldMap() !=null)
	{
		for(String fld : historyTemplateField.getFieldNames()){
			if(tmpl.getTemplateFieldMap().containsKey(fld)){
				names.put(fld, tmpl.getTemplateFieldMap().get(fld).getFieldTitle());
				id.put(String.valueOf(tmpl.getTemplateFieldMap().get(fld).getFieldId()), fld);
			}
		}
	}
	historySetup.put("names", names);
	historySetup.put("id", id);
	return historySetup;
}

public CreateFetchTemplateServiceManager getCreateFetchTemplateServiceManager() {
	return createFetchTemplateServiceManager;
}
public UserGroupService getUserGroupService() {
	return userGroupService;
}

public void setUserGroupService(UserGroupService userGroupService) {
	this.userGroupService = userGroupService;
}

public void setCreateFetchTemplateServiceManager(
		CreateFetchTemplateServiceManager createFetchTemplateServiceManager) {
	this.createFetchTemplateServiceManager = createFetchTemplateServiceManager;
}

public CreateFetchDocumentServiceManager getCreateFetchDocumentServiceManager() {
	return createFetchDocumentServiceManager;
}

public void setCreateFetchDocumentServiceManager(
		CreateFetchDocumentServiceManager createFetchDocumentServiceManager) {
	this.createFetchDocumentServiceManager = createFetchDocumentServiceManager;
}

}
