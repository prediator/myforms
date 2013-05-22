package com.myforms.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.orm.ibatis.SqlMapClientTemplate;

import com.ibatis.sqlmap.client.SqlMapExecutor;
import com.myforms.batch.QueryBatch;

public class DaoUtil {
private DaoUtil(){}
public static int executeBatch(final List<QueryBatch> queries, SqlMapClientTemplate sqlMapClientTemplate){
    try {
        Integer updateCount = (Integer) sqlMapClientTemplate.execute( new SqlMapClientCallback() {
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
