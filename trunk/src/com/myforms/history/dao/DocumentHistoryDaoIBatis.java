package com.myforms.history.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.myform.keygen.dao.KeyGenerator;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.myforms.batch.QueryBatch;
import com.myforms.constants.MyFormsConstants;
import com.myforms.dao.DaoUtil;
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
	

}
