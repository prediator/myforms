package com.myforms.template.web.ftl;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.dom4j.DocumentException;
import org.springframework.util.CollectionUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.myforms.template.config.model.Template;
import com.myforms.template.service.CreateFetchTemplateServiceManager;
import com.myforms.template.service.ftl.CreateandSaveFTLService;
import com.myforms.usergroup.model.User;
import com.myforms.util.MyFormProperties;

public class RefreshFTLsController extends AbstractController {
	private CreateandSaveFTLService createandSaveFTLService;
	private CreateFetchTemplateServiceManager createFetchTemplateServiceManager;
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse responce) throws Exception {
		String ids = getTemplateIds();
		if(StringUtils.isEmpty(ids)){
			return null;
		}
		String rootPath = request.getRealPath("/");
	    List<Template> listTemplate	= createFetchTemplateServiceManager.getTemplatesByIds(ids.split(","));
	    try{
	    createandSaveFTLService.createFTLFromTemplateList(listTemplate);
	    createandSaveFTLService.copyCommonFTLs(rootPath);
	    }
	    catch (DocumentException de) {
			throw de;
		}
	    catch (IOException ioe) {
	    	throw ioe;
		}
		return null;
	}
	private String getTemplateIds() {
		User user = MyFormProperties.getInstance().getCurrentUser();
		String ids = "";
		if(!CollectionUtils.isEmpty(user.getClient().getTemplateList())){
			for(Template template : user.getClient().getTemplateList()){
				ids += template.getTemplateId() +",";
			}
		ids = ids.substring(0,ids.length()-1);
		}
		return ids;
	}
	public CreateandSaveFTLService getCreateandSaveFTLService() {
		return createandSaveFTLService;
	}
	public void setCreateandSaveFTLService(
			CreateandSaveFTLService createandSaveFTLService) {
		this.createandSaveFTLService = createandSaveFTLService;
	}
	public CreateFetchTemplateServiceManager getCreateFetchTemplateServiceManager() {
		return createFetchTemplateServiceManager;
	}
	public void setCreateFetchTemplateServiceManager(
			CreateFetchTemplateServiceManager createFetchTemplateServiceManager) {
		this.createFetchTemplateServiceManager = createFetchTemplateServiceManager;
	}

}
