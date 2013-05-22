package com.myforms.web.controllers;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.myform.fcondition.domain.ConditionConfig;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.myforms.constants.MyFormsConstants;
import com.myforms.document.service.CreateFetchDocumentServiceManager;
import com.myforms.exception.runtimeexception.InvalidTemplateException;
import com.myforms.upload.FileUploadInfo;
import com.myforms.upload.service.FileUploadDownloadServiceManager;
import com.myforms.util.MyFormProperties;
import com.myforms.web.model.Document;


public class DocumentFormController extends AbstractDocumentFormController {
	private CreateFetchDocumentServiceManager createFetchDocumentServiceManager; 
	private FileUploadDownloadServiceManager fileUploadDownloadServiceManager;
	
@Override
protected Object formBackingObject(HttpServletRequest request) throws Exception {
	Document document = null;
	List<FileUploadInfo> uploadInfos = null;
	Integer documentId = ServletRequestUtils.getIntParameter(request, MyFormsConstants.DocumentConstants.DOCUMENT_ID,0);
	Integer templateId = ServletRequestUtils.getIntParameter(request, MyFormsConstants.DocumentConstants.TEMPLATE_ID,0);
	String displayId = ServletRequestUtils.getStringParameter(request, MyFormsConstants.DocumentConstants.DISPLAY_ID,"");
	if((templateId == null || templateId == 0 )&& !StringUtils.hasLength(displayId))
	{
		throw new InvalidTemplateException();
	}
	
	if((documentId == null || documentId == 0)&& !StringUtils.hasLength(displayId))
	{
		document = createFetchDocumentServiceManager.createDocumentByTemplateId(templateId);
	}
	else{
		document = createFetchDocumentServiceManager.getDocumentByDisplayId(displayId);
	}
	return document;
}
@Override
protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object obj, BindException bindException) throws Exception {
	// TODO Auto-generated method stub
	Document document = (Document)obj;
	if(document.getId() == null || document.getId() == 0){
	document.setUpdatedBy(MyFormProperties.getInstance().getCurrentUser());
	document.setUpdatedOn(new Timestamp(System.currentTimeMillis()));
	getSaveUpdateDocumentServiceManager().saveDocument(document);
	}
	else{
		int update = getSaveUpdateDocumentServiceManager().updateDocument(document);
	}
	return new ModelAndView(new RedirectView("editDocument.html?"+MyFormsConstants.DocumentConstants.DISPLAY_ID+"="+document.getDisplayId()));
}
public CreateFetchDocumentServiceManager getCreateFetchDocumentServiceManager() {
	return createFetchDocumentServiceManager;
}

public void setCreateFetchDocumentServiceManager(
		CreateFetchDocumentServiceManager createFetchDocumentServiceManager) {
	this.createFetchDocumentServiceManager = createFetchDocumentServiceManager;
}
public FileUploadDownloadServiceManager getFileUploadDownloadServiceManager() {
	return fileUploadDownloadServiceManager;
}
public void setFileUploadDownloadServiceManager(
		FileUploadDownloadServiceManager fileUploadDownloadServiceManager) {
	this.fileUploadDownloadServiceManager = fileUploadDownloadServiceManager;
}

}
