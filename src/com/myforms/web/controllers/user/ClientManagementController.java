package com.myforms.web.controllers.user;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myforms.client.Client;
import com.myforms.constants.MyFormsConstants;
import com.myforms.logging.MyFormsLogger;
import com.myforms.racf.AccessType;
import com.myforms.racf.service.RacfService;
import com.myforms.template.config.model.Template;
import com.myforms.usergroup.model.User;
import com.myforms.usergroup.model.UserBean;
import com.myforms.usergroup.service.UserGroupService;

@Controller
public class ClientManagementController {
	@Autowired
	private UserGroupService userGroupService;
	@Autowired
	private RacfService racfService;
	@RequestMapping(value = "/clients.html")
	@ResponseBody
	public String viewClients(){
		List<Client> clients = userGroupService.getAllClients();
		if(!CollectionUtils.isEmpty(clients)){
			JSONArray array = new JSONArray();
			for(Client clnt : clients ){
				JSONObject object = new JSONObject();
				object.put("name", clnt.getClientName());
				object.put("id", clnt.getClientId());
				object.put("description", clnt.getDescription());
				object.put("templates", getTemplateArray(clnt.getTemplateList()));
				array.add(object);
			}
			return array.toString();
		}
		return null;
	}
	@RequestMapping(value = "/saveClient.html")
	@ResponseBody
	public String saveClient(Model model, Client client){
		MyFormsLogger.getLogger().info("client save"+client.getClientName());
		userGroupService.saveClient(client);
		JSONObject obj = new JSONObject();
		obj.put("client", client.getClientId());
		return obj.toString();
	}
	@RequestMapping(value = "/getAccessData.html")
	@ResponseBody
	public String getAccessData(@RequestParam(value="clientId")Long clientId){
		AccessType accessType= racfService.getAccessTypeByName(MyFormsConstants.CLIENT_ACCESS_NODE);
		if(clientId != null && clientId != 0)
		{
			Client client = userGroupService.getClientById(clientId);
			if(client != null)
			addAccessNodeForClient(client,accessType);
		}
		JSONArray accessTypeArray = createCompleteTree(Arrays.asList((new AccessType[]{accessType})));
		JSONArray roles = JSONArray.fromObject(userGroupService.getAllRoles());
		JSONObject data = new JSONObject();
		data.put("accessTypes", accessTypeArray);
		data.put("roles", roles);
		return data.toString();
	}
	@RequestMapping(value = "/saveUser.html")
	@ResponseBody
	public String saveUser(Model model, UserBean user){
		MyFormsLogger.getLogger().info("client save"+user.getUsername());
		if(userGroupService.getUserByUsername(user.getUsername()) !=null){
			return null;
		}
		User u =convertToUser(user);
		userGroupService.saveUser(u, user);
		JSONObject obj = new JSONObject();
		obj.put("user", u.getUserId());
		return obj.toString();
	}
	@RequestMapping(value = "/validateUser.html")
	@ResponseBody
	public String saveUser(@RequestParam(value="username")String username, Model model){
		User u = userGroupService.getPartialUserByUserName(username);
		Boolean returnValue;
		if(u != null)
			returnValue = false;
		else
			returnValue = true;
		return returnValue.toString();
	}
	private User convertToUser(UserBean user) {
		User u = new User();
		u.setCreatedOn(new Date(System.currentTimeMillis()));
		Client client =new Client();
		if(!StringUtils.isEmpty(user.getClientId())){
			user.setClientId(user.getClientId().substring(0,user.getClientId().indexOf(":")).trim());
		}
		client.setClientId(Long.valueOf(user.getClientId()));
		u.setClient(client);
		u.setFirstName(user.getFirstName());
		u.setLastName(user.getLastName());
		u.setUsername(user.getUsername());
		u.setEmailId(user.getEmailId());
		u.setIsEnabled(true);
		u.setPassword("password");
		return u;
	}
	private void addAccessNodeForClient(Client client, AccessType accessType) {
		if(!CollectionUtils.isEmpty(client.getTemplateList())){
			List<Template> templates = client.getTemplateList();
			AccessType accessType2 = accessType.getAccessTypes().get(0);			
					
			for(Template templ : templates){
				
				for(AccessType accessType3 :  accessType2.getAccessTypes()){
					AccessType type = new AccessType();
					type.setAccessName(templ.getTemplateName());
					if(accessType3.getAccessTypes() == null){
						accessType3.setAccessTypes(new ArrayList<AccessType>());						
					}
					type.setAccessId(templ.getTemplateId().toString() + 
							MyFormsConstants.RacfConstants.NODE_SEPARATOR+MyFormsConstants.RacfConstants.ACCESS_MAP.get(accessType3.getAccessName()));
					accessType3.getAccessTypes().add(type);					
				}				
			}
		}
	}
	private String getTemplateArray(List<Template> templates){
		JSONArray templatesArray = new JSONArray();
		if(!CollectionUtils.isEmpty(templates))
		for(Template template : templates){
			JSONObject templateJson = new JSONObject();
			templateJson.put(MyFormsConstants.JsonFieldNames.Template.TEMPLATE_ID, template.getTemplateId());
			templateJson.put(MyFormsConstants.JsonFieldNames.Template.TEMPLATE_NAME, template.getTemplateName());
			templateJson.put(MyFormsConstants.JsonFieldNames.Template.TEMPLATE_TITLE, template.getTemplateTitle());
			templateJson.put(MyFormsConstants.JsonFieldNames.Template.TEMPLATE_DESCRIPTION, template.getDescription());			
			templatesArray.add(templateJson);
		}
		return templatesArray.toString();
	}
	public UserGroupService getUserGroupService() {
		return userGroupService;
	}

	public void setUserGroupService(UserGroupService userGroupService) {
		this.userGroupService = userGroupService;
	}
	private JSONArray createCompleteTree(List<AccessType> accessTypes) {
		JSONArray array = new JSONArray();
		if(!CollectionUtils.isEmpty(accessTypes)){
			for(AccessType accessType : accessTypes){
				JSONObject object = new JSONObject();
				object.put("title", accessType.getAccessName());
				object.put("key", accessType.getAccessId());
				object.put("children", createCompleteTree(accessType.getAccessTypes()));
				array.add(object);
			}
		}
		return array;
	}
	
}
