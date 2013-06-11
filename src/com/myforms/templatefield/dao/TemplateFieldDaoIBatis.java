package com.myforms.templatefield.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.myform.keygen.dao.KeyGenerator;
import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.ibatis.sqlmap.client.SqlMapExecutor;
import com.myforms.batch.QueryBatch;
import com.myforms.constants.MyFormsConstants;
import com.myforms.field.ListValue;
import com.myforms.field.config.model.FieldType;
import com.myforms.usergroup.model.User;

public class TemplateFieldDaoIBatis extends SqlMapClientDaoSupport implements TemplateFieldDao {
	private KeyGenerator keyGenerator;
	public KeyGenerator getKeyGenerator() {
		return keyGenerator;
	}

	public void setKeyGenerator(KeyGenerator keyGenerator) {
		this.keyGenerator = keyGenerator;
	}

	public List<com.myforms.field.List> getListForUser(User user) {
		return getSqlMapClientTemplate().queryForList(MyFormsConstants.Queries.GET_LIST_FOR_USER, user.getUserId());
	}

	public void saveTemplateList(com.myforms.field.List templateList) {
		templateList.setId(keyGenerator.generateKey(MyFormsConstants.Tables.LIST).longValue());
		getSqlMapClientTemplate().insert(MyFormsConstants.Queries.SAVE_LIST,templateList);
		List<QueryBatch> queries = new ArrayList<QueryBatch>();
		for(ListValue val : templateList.getValues()){
			val.setId(keyGenerator.generateKey(MyFormsConstants.Tables.LIST_VAL).longValue());
			val.setList(templateList);			
			QueryBatch query = new QueryBatch(MyFormsConstants.Queries.SAVE_LIST_VAL,val);
			queries.add(query);
		}
		executeBatch(queries);
	}
	private int executeBatch(final List<QueryBatch> queries){
        try {
            Integer updateCount = (Integer) getSqlMapClientTemplate().execute( new SqlMapClientCallback() {
                public Object doInSqlMapClient( SqlMapExecutor executor ) throws SQLException {
                    executor.startBatch();
                    
                   for(QueryBatch batch : queries) {
                        executor.insert( batch.getQueryName(), batch.getQueryParams() );
                    }
                    return new Integer( executor.executeBatch() );	
                }
            });
            return updateCount.intValue();
            }
        catch (Exception e ) {
            return -1;
        }
    }
	
	public List<FieldType> getCongigurableFields(){
		return  (List<FieldType>)getSqlMapClientTemplate().queryForList("templateField.getConfigurableFieldTypes", 1);
	}
}
