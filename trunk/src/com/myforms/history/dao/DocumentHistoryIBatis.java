package com.myforms.history.dao;

import org.myform.keygen.dao.KeyGenerator;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.myforms.history.HistoryTemplateField;

public class DocumentHistoryIBatis  extends SqlMapClientDaoSupport implements DocumentHistoryDao {
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
		// TODO Auto-generated method stub

	}

	/**
	 * 
	 */
	@Override
	public HistoryTemplateField getHistoryTemplateField(Long templateId) {
		// TODO Auto-generated method stub
		return null;
	}

	public KeyGenerator getKeyGenerator() {
		return keyGenerator;
	}

	public void setKeyGenerator(KeyGenerator keyGenerator) {
		this.keyGenerator = keyGenerator;
	}
	

}
