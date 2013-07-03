package com.myforms.document.dao;

import java.util.List;

import org.springframework.security.access.annotation.Secured;

import com.myforms.exception.runtimeexception.DocumentNotFoundException;
import com.myforms.web.model.Document;

public interface CreateFetchDocumentDao {
	public Document createDocumentByTemplateId(Integer templateId);
	public Document getDocumentByDisplayId(String displayId) throws DocumentNotFoundException;
	public Document getDocumentById(Integer documentId) throws DocumentNotFoundException;
	@Secured("ROLE_ADMIN")
	public List<Document> getAllDocuments() throws DocumentNotFoundException;
	public List<Document> getAllDocuments(List<Long> templateIds) throws DocumentNotFoundException;

}
