package org.myform.keygen.dao;

import java.util.HashMap;
import java.util.Map;

import org.myform.keygen.domain.KeyHolder;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.myforms.constants.MyFormsConstants;

public class KeyGeneratorIBatis extends SqlMapClientDaoSupport  implements KeyGenerator {
	private static  Map<String, KeyHolder> keys = new HashMap<String, KeyHolder>();
    
	public synchronized Integer generateKey(String table) {
		KeyHolder holder = keys.get(table);
		if(holder == null){
		 holder = generateKeys(table, 1);
		 keys.put(table, holder);
		}
		Integer key = holder.getNextValue();
		holder.setNextValue(key +1);
		if(key == (holder.getNextValue() + holder.getSafeVal())){
			keys.remove(table);
		}
		return key;
	}

	private KeyHolder generateKeys(String table, int numKeys) {
			KeyHolder keyHolder = (KeyHolder)getSqlMapClientTemplate().queryForObject(MyFormsConstants.Queries.GET_KEY_GEN,table);
			Map<String,Object> params = new HashMap<String, Object>();
			params.put(MyFormsConstants.ParamsName.NEW_VALUE, keyHolder.getNextValue() + keyHolder.getSafeVal());
			params.put(MyFormsConstants.ParamsName.TABLE_NAME, table);
			getSqlMapClientTemplate().update(MyFormsConstants.Queries.UPT_KEY_GEN,params);			
			return keyHolder;
	}

}
