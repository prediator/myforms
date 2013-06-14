package com.myforms.history.service;

import java.util.List;
import java.util.SortedSet;

import com.myforms.history.DocumentHistory;
import com.myforms.history.HistoryTemplateField;
import com.myforms.web.model.Document;
/**
 * 
 * @author mohd.irshad
 *
 */
public interface DocumentHistoryService {
	/**
	 * 
	 * @param historyTemplateField
	 */
	public void saveHistoryTemplateConfig(HistoryTemplateField historyTemplateField);
	/**
	 * 
	 * @param templateId
	 * @return
	 */
	public HistoryTemplateField getHistoryTemplateField(Long templateId);
	
	/**
	 * 
	 * @param document
	 */
	public void saveDocumentHistory(Document document);
	/**
	 * 
	 * @param documentId
	 * @return
	 */
	public List<DocumentHistory> getDocumentHistory(Long documentId);
}
