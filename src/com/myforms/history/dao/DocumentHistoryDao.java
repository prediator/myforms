package com.myforms.history.dao;

import com.myforms.history.HistoryTemplateField;

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
}
