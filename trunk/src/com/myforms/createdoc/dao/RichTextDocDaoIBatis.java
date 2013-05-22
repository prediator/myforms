package com.myforms.createdoc.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.myform.keygen.dao.KeyGenerator;
import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.ibatis.sqlmap.client.SqlMapExecutor;
import com.myforms.batch.QueryBatch;
import com.myforms.constants.MyFormsConstants;
import com.myforms.createdoc.RichTextDoc;
import com.myforms.field.RichTextField;

public class RichTextDocDaoIBatis extends SqlMapClientDaoSupport implements RichTextDocDao {
	private KeyGenerator keyGenerator;
	
	public RichTextDoc getRichTextDoc(RichTextDoc richTextDoc) {
		return (RichTextDoc)getSqlMapClientTemplate().queryForObject(MyFormsConstants.Queries.GET_RT_DOC, richTextDoc);		
	}

	public void getRichTextDocListByDocumentId(Integer documentId) {
		// TODO Auto-generated method stub
		
	}

	public void saveRichTextDoc(RichTextDoc richTextDoc) {
		if(richTextDoc.getRichTextDocId() == null || richTextDoc.getRichTextDocId() == 0 ){
			richTextDoc.setRichTextDocId(keyGenerator.generateKey(MyFormsConstants.Tables.RTEXT).longValue());
			getSqlMapClientTemplate().insert(MyFormsConstants.Queries.SAVE_RT_DOC, richTextDoc);
		}
		else{
			getSqlMapClientTemplate().delete(MyFormsConstants.Queries.DELETE_RT_DOC_DATA, richTextDoc.getRichTextDocId());
		}
		
		
		List<String> values = richTextDoc.getDataList();
		List<QueryBatch> queries = new ArrayList<QueryBatch>();
    	for(String value : values)
    	{
    		Map<String, Object> richTxtFldParams = new HashMap<String, Object>();
    		Integer richTxtId = keyGenerator.generateKey(MyFormsConstants.Tables.DOC_RTEXT);
    		if(richTxtId != null){
    			richTxtFldParams.put(MyFormsConstants.ParamsName.RICH_TEXT_ID, richTxtId);
    		}
    		richTxtFldParams.put(MyFormsConstants.ParamsName.RICH_TEXT, value);
    		richTxtFldParams.put(MyFormsConstants.ParamsName.RICH_TEXT_DOC_ID, richTextDoc.getRichTextDocId());
    		richTxtFldParams.put(MyFormsConstants.ParamsName.SEQUENCE, values.indexOf(value));
    		QueryBatch batch2 = new QueryBatch(MyFormsConstants.Queries.SAVE_RT_DOC_DATA,richTxtFldParams);
    		queries.add(batch2);
    	}	
    	executeBatch(queries);
	}

	public void updateRichTextDoc(RichTextDoc richTextDoc) {
		// TODO Auto-generated method stub
		
	}

	public KeyGenerator getKeyGenerator() {
		return keyGenerator;
	}

	public void setKeyGenerator(KeyGenerator keyGenerator) {
		this.keyGenerator = keyGenerator;
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
}
