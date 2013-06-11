package com.myforms.history.service;

import com.myforms.history.HistoryTemplateField;
import com.myforms.history.dao.DocumentHistoryDao;

public class DocumentHistoryServiceImpl implements DocumentHistoryService {

	private DocumentHistoryDao documentHistoryDao;
	/**
	 * 
	 */
	@Override
	public void saveHistoryTemplateConfig(
			HistoryTemplateField historyTemplateField) {
		documentHistoryDao.saveHistoryTemplateConfig(historyTemplateField);

	}
	/**
	 * 
	 */
	@Override
	public HistoryTemplateField getHistoryTemplateField(Long templateId) {
		return documentHistoryDao.getHistoryTemplateField(templateId);
	}
	public DocumentHistoryDao getDocumentHistoryDao() {
		return documentHistoryDao;
	}
	public void setDocumentHistoryDao(DocumentHistoryDao documentHistoryDao) {
		this.documentHistoryDao = documentHistoryDao;
	}

}
