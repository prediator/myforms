package com.myforms.history.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.SortedSet;

import com.myforms.field.Field;
import com.myforms.history.DocumentHistory;
import com.myforms.history.HistoryTemplateField;
import com.myforms.history.dao.DocumentHistoryDao;
import com.myforms.util.MyFormProperties;
import com.myforms.web.model.Document;

public class DocumentHistoryServiceImpl implements DocumentHistoryService {

	/**
	 * 
	 */
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
	
	@Override
	public void saveDocumentHistory(Document document) {
		HistoryTemplateField historyTemplateField = getHistoryTemplateField(document.getTemplate().getTemplateId().longValue());	
		if(historyTemplateField != null && historyTemplateField.getFieldNames() != null){
			Map<String, Field> fieldMap = document.getFieldMap();
			List<DocumentHistory> documentHistories = new ArrayList<DocumentHistory>();			
			if(fieldMap != null){
				Date date = new Date(System.currentTimeMillis());
				for(String key : fieldMap.keySet()){
					if(historyTemplateField.getFieldNames().contains(key) && fieldMap.get(key).isDirty()){
						prepareDocumentHistory(historyTemplateField, fieldMap.get(key), document, documentHistories, date);
					}
				}
			}
			documentHistoryDao.saveDocumentHistor(documentHistories);
		}
		
	}
	/**
	 * prepare object
	 * @param historyTemplateField
	 * @param field
	 * @param document
	 * @param documentHistories
	 * @param date 
	 */
	private void prepareDocumentHistory(
			HistoryTemplateField historyTemplateField, Field field,
			Document document, List<DocumentHistory> documentHistories, Date date) {
		DocumentHistory documentHistory = new DocumentHistory();
		documentHistory.setDocument(document);
		documentHistory.setFieldType(field.getTemplateField().getFieldType());
		documentHistory.setTemplateFieldId(field.getTemplateField().getFieldId().longValue());
		documentHistory.setUpdatedBy(MyFormProperties.getInstance().getCurrentUser());
		documentHistory.setUpdatedOn(date);
		documentHistory.setFieldValue(field.getFieldValue());
		documentHistories.add(documentHistory);
		
	}
	@Override
	public List<DocumentHistory> getDocumentHistory(Long documentId) {
		return documentHistoryDao.getDocumentHistory(documentId);
	}

}
