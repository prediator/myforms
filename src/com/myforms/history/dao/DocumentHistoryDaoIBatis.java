package com.myforms.history.dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.SortedSet;
import java.util.TreeSet;

import org.apache.commons.collections.CollectionUtils;
import org.myform.keygen.dao.KeyGenerator;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.myforms.batch.QueryBatch;
import com.myforms.constants.MyFormsConstants;
import com.myforms.dao.DaoUtil;
import com.myforms.history.DocumentHistory;
import com.myforms.history.HistoryTemplateField;

public class DocumentHistoryDaoIBatis  extends SqlMapClientDaoSupport implements DocumentHistoryDao {
	/**
	 * 
	 */
	private KeyGenerator keyGenerator;
	/**
	 * 
	 */
	@Override
	public void saveHistoryTemplateConfig( 
			HistoryTemplateField historyTemplateField) {
		List<QueryBatch> queries = new ArrayList<QueryBatch>();
		
		if(historyTemplateField.getId() != null  && historyTemplateField.getId().intValue() != 0){
			getSqlMapClientTemplate().delete("historyTemplateConfig.deleteHistoryConfiguration", historyTemplateField.getId());
			getSqlMapClientTemplate().delete("historyTemplateConfig.deleteHistoryConfigurationNames", historyTemplateField.getId());
		}
		
		historyTemplateField.setId(keyGenerator.generateKey(MyFormsConstants.Tables.HISTORY_CONF_FLD).longValue());
		QueryBatch batch = new QueryBatch("historyTemplateConfig.insertHistoryConfigFields", historyTemplateField);
		queries.add(batch);
		batch = null;
		
		if(!CollectionUtils.isEmpty(historyTemplateField.getFieldNames())){
			for(String name : historyTemplateField.getFieldNames()){
				Map<String, String> params = new HashMap<String, String>();
				params.put("id", String.valueOf(keyGenerator.generateKey(MyFormsConstants.Tables.HISTORY_CONF_FLD_NM)));
				params.put("historyConfigFldId", historyTemplateField.getId().toString());
				params.put("fieldName", name);
				batch = new QueryBatch("historyTemplateConfig.insertHistoryConfigFieldNames", params);
				queries.add(batch);
			}
		}
		DaoUtil.executeBatch(queries, getSqlMapClientTemplate());
	}

	/**
	 * 
	 */
	@Override
	public HistoryTemplateField getHistoryTemplateField(Long templateId) {
		return (HistoryTemplateField)getSqlMapClientTemplate().queryForObject("historyTemplateConfig.getHistoryFieldConfigByTmplId", templateId); 
	}

	public KeyGenerator getKeyGenerator() {
		return keyGenerator;
	}

	public void setKeyGenerator(KeyGenerator keyGenerator) {
		this.keyGenerator = keyGenerator;
	}

	@Override
	public void saveDocumentHistor(List<DocumentHistory> documentHistories) {
		if(documentHistories != null){
			List<QueryBatch> queries = new ArrayList<QueryBatch>();
			for(DocumentHistory documentHistory : documentHistories){
				documentHistory.setId(keyGenerator.generateKey(MyFormsConstants.Tables.DOCUMENT_HISTORY).longValue());
				queries.add(new QueryBatch("historyTemplateConfig.insertDocumentHistroy",documentHistory));
			}
			DaoUtil.executeBatch(queries, getSqlMapClientTemplate());
		}
		
	}

	@Override
	public List<DocumentHistory> getDocumentHistory(Long documentId) {
		List<DocumentHistory> list = (List<DocumentHistory>)getSqlMapClientTemplate().queryForList("historyTemplateConfig.getDocumentHistory", documentId);
		//SortedSet<DocumentHistory> set = new TreeSet<DocumentHistory>(list);
		Collections.sort(list);
		return list; 
	}
	

}
