package com.myforms.document.service;

import com.myforms.document.dao.SaveUpdateDocumentDao;
import com.myforms.web.model.Document;

public class SaveUpdateDocumentServiceManagerImpl implements
		SaveUpdateDocumentServiceManager {
	/**
	 * 
	 */
	private	SaveUpdateDocumentDao saveUpdateDocumentDao; 
	
	/**
	 * 
	 * @return
	 */
	public SaveUpdateDocumentDao getSaveUpdateDocumentDao() {
		return saveUpdateDocumentDao;
	}
	/**
	 * 
	 * @param saveUpdateDocumentDao
	 */
	public void setSaveUpdateDocumentDao(SaveUpdateDocumentDao saveUpdateDocumentDao) {
		this.saveUpdateDocumentDao = saveUpdateDocumentDao;
	}
	/**
	 * 
	 */
	public void saveDocument(Document document) {
		document.setDirty(true);
		saveUpdateDocumentDao.saveDocument(document);
	}
	/**
	 * 
	 */
	public int  updateDocument(Document document) {
		document.setDirty(true);
		return saveUpdateDocumentDao.updateDocument(document);		
	}

}
