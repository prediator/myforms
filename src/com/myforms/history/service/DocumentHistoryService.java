package com.myforms.history.service;

import com.myforms.history.HistoryTemplateField;

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
}
