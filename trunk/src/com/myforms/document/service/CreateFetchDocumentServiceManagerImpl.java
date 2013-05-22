package com.myforms.document.service;

import java.sql.Timestamp;
import java.util.List;

import com.myforms.document.dao.CreateFetchDocumentDao;
import com.myforms.exception.runtimeexception.DocumentNotFoundException;
import com.myforms.exception.runtimeexception.InvalidTemplateException;
import com.myforms.template.config.model.Template;
import com.myforms.template.dao.CreateFetchTemplateDao;
import com.myforms.util.MyFormProperties;
import com.myforms.web.model.Document;

public class CreateFetchDocumentServiceManagerImpl implements
		CreateFetchDocumentServiceManager {
	private CreateFetchDocumentDao createFetchDocumentDao; 
	private CreateFetchTemplateDao createFetchTemplateDao;


	public Document createDocumentByTemplateId(Integer templateId) throws InvalidTemplateException {
		Template template = createFetchTemplateDao.getTemplateById(templateId);
		if(template == null)
		{
			throw new InvalidTemplateException();
		}
		Document document = new Document(template);		
		document.setCreatedOn(new Timestamp(System.currentTimeMillis()));
		document.setCreatedBy(MyFormProperties.getInstance().getCurrentUser());
		return document;
	}


	public CreateFetchDocumentDao getCreateFetchDocumentDao() {
		return createFetchDocumentDao;
	}
	public void setCreateFetchDocumentDao(
			CreateFetchDocumentDao createFetchDocumentDao) {
		this.createFetchDocumentDao = createFetchDocumentDao;
	}
	public CreateFetchTemplateDao getCreateFetchTemplateDao() {
		return createFetchTemplateDao;
	}

	public void setCreateFetchTemplateDao(
			CreateFetchTemplateDao createFetchTemplateDao) {
		this.createFetchTemplateDao = createFetchTemplateDao;
	}


	public Document getDocumentByDisplayId(String displayId) throws DocumentNotFoundException {
		// TODO Auto-generated method stub
		return createFetchDocumentDao.getDocumentByDisplayId(displayId);
	}


	public Document getDocumentById(Integer documentId) throws DocumentNotFoundException {
		// TODO Auto-generated method stub
		return createFetchDocumentDao.getDocumentById(documentId);
	}


	public List<Document> getAllDocuments() throws DocumentNotFoundException {
		// TODO Auto-generated method stub
		return createFetchDocumentDao.getAllDocuments();
	}

}
