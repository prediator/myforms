package com.myforms.document.dao;

import com.myforms.exception.runtimeexception.ConcurrentUpdateException;
import com.myforms.web.model.Document;

public interface SaveUpdateDocumentDao {
public void saveDocument(Document document);
public int updateDocument(Document document) throws ConcurrentUpdateException;
}
