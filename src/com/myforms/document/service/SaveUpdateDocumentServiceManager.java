package com.myforms.document.service;

import com.myforms.web.model.Document;

public interface SaveUpdateDocumentServiceManager {
	public void saveDocument(Document document);
	public int updateDocument(Document document);
}
