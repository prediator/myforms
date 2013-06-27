package com.myforms.document.service;

import com.myforms.document.dao.SaveUpdateDocumentDao;
import com.myforms.field.Field;
import com.myforms.history.service.DocumentHistoryService;
import com.myforms.web.model.Document;

public class SaveUpdateDocumentServiceManagerImpl implements
		SaveUpdateDocumentServiceManager {
	/**
	 * 
	 */
	private	SaveUpdateDocumentDao saveUpdateDocumentDao; 
	/**
	 * 
	 */
	private DocumentHistoryService documentHistoryService;
	
	private CreateFetchDocumentServiceManager createFetchDocumentServiceManager;
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
		documentHistoryService.saveDocumentHistory(
				updateDirtyFlag(createFetchDocumentServiceManager.getDocumentById(document.getId()), document));
		int returVal = saveUpdateDocumentDao.updateDocument(document);	
		return returVal;
	}
	/**
	 * 
	 * @param documentById
	 * @param document
	 * @return
	 */
	private Document updateDirtyFlag(Document oldDocument, Document document) {
		if(document.getFieldMap() != null){
			for(String key : document.getFieldMap().keySet()){
				Field field = document.getFieldMap().get(key);
				if(oldDocument.getFieldMap() != null && oldDocument.getFieldMap().get(key) != null && oldDocument.getFieldMap().get(key).getFieldValue() != null)
					oldDocument.getFieldMap().get(key).setDirty(!oldDocument.getFieldMap().get(key).getFieldValue().equals(field.getFieldValue()));
			}
		}
		return oldDocument;
	}
	public DocumentHistoryService getDocumentHistoryService() {
		return documentHistoryService;
	}
	public void setDocumentHistoryService(
			DocumentHistoryService documentHistoryService) {
		this.documentHistoryService = documentHistoryService;
	}
	public CreateFetchDocumentServiceManager getCreateFetchDocumentServiceManager() {
		return createFetchDocumentServiceManager;
	}
	public void setCreateFetchDocumentServiceManager(
			CreateFetchDocumentServiceManager createFetchDocumentServiceManager) {
		this.createFetchDocumentServiceManager = createFetchDocumentServiceManager;
	}

}
