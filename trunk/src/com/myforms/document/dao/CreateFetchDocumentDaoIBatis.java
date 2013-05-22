package com.myforms.document.dao;

import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.myforms.constants.MyFormsConstants;
import com.myforms.exception.runtimeexception.DocumentNotFoundException;
import com.myforms.exception.runtimeexception.Message;
import com.myforms.template.config.model.Template;
import com.myforms.web.model.Document;

public class CreateFetchDocumentDaoIBatis extends SqlMapClientDaoSupport implements CreateFetchDocumentDao {

	public Document createDocumentByTemplateId(Integer templateId) {
		// TODO Auto-generated method stub
		return null;
	}

	public Document getDocumentByDisplayId(String displayId) throws DocumentNotFoundException {
		// TODO Auto-generated method stub
		Document document = (Document)getSqlMapClientTemplate().queryForObject("document.getDocumentByDisplayId", displayId);
		if(document == null)
			throw new DocumentNotFoundException(Message.getErrorMessage(MyFormsConstants.ExceptionMsg.DOCUMENT_NOT_FOUND,displayId));
		return document;
	}

	public Document getDocumentById(Integer documentId) throws DocumentNotFoundException {
		// TODO Auto-generated method stub
		Document document =(Document)getSqlMapClientTemplate().queryForObject("document.getDocumentById", documentId);
		if(document == null)
			throw new DocumentNotFoundException(Message.getErrorMessage(MyFormsConstants.ExceptionMsg.DOCUMENT_NOT_FOUND,documentId.toString()));
		return document;
	}

	public List<Document> getAllDocuments() throws DocumentNotFoundException {
		// TODO Auto-generated method stub
		return (List<Document>)getSqlMapClientTemplate().queryForList("document.getAllDocuments");
	}

}
