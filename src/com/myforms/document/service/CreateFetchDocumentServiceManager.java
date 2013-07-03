package com.myforms.document.service;

import java.util.List;

import com.myforms.exception.runtimeexception.DocumentNotFoundException;
import com.myforms.exception.runtimeexception.InvalidTemplateException;
import com.myforms.web.model.Document;

public interface CreateFetchDocumentServiceManager {
public Document createDocumentByTemplateId(Integer templateId) throws InvalidTemplateException;
public Document getDocumentByDisplayId(String displayId) throws DocumentNotFoundException;
public Document getDocumentById(Integer documentId) throws DocumentNotFoundException;
public List<Document> getAllDocuments() throws DocumentNotFoundException;
public List<Document> getAllDocuments(List<Long> templateIds) throws DocumentNotFoundException;
}
