package com.myforms.history.dao;

import java.util.List;
import java.util.SortedSet;

import com.myforms.history.DocumentHistory;
import com.myforms.history.HistoryTemplateField;

/**
 * 
 * @author mohd.irshad
 *
 */
public interface DocumentHistoryDao {
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
	 * @param documentHistories
	 */
	public void saveDocumentHistor(List<DocumentHistory> documentHistories);
	/**
	 * 
	 * @param documentId
	 * @return
	 */
	public List<DocumentHistory> getDocumentHistory(Long documentId);
}
