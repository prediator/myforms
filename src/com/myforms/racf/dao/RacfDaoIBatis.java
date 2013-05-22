package com.myforms.racf.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.aspectj.weaver.patterns.TypePatternQuestions.Question;
import org.myform.keygen.dao.KeyGenerator;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;
import org.springframework.util.CollectionUtils;

import com.myforms.batch.QueryBatch;
import com.myforms.constants.MyFormsConstants;
import com.myforms.dao.DaoUtil;
import com.myforms.racf.AccessType;
import com.myforms.racf.Racf;
import com.myforms.usergroup.model.Role;

public class RacfDaoIBatis extends SqlMapClientDaoSupport implements RacfDao {
	private KeyGenerator keyGenerator;
	public AccessType getAccessTypeByName(String accesType){
		return (AccessType)getSqlMapClientTemplate().queryForObject("racf.getAccessTypeByName", accesType);
	}
	public KeyGenerator getKeyGenerator() {
		return keyGenerator;
	}
	public void setKeyGenerator(KeyGenerator keyGenerator) {
		this.keyGenerator = keyGenerator;
	}
	public void saveRacf(Racf racf) {
		Long racfId = keyGenerator.generateKey(MyFormsConstants.Tables.USER_ACCESS).longValue();
		racf.setRacfId(racfId);
		List<QueryBatch> list = new ArrayList<QueryBatch>();
		QueryBatch queryBatch = new QueryBatch("racf.saveUserAcess",racf);
		list.add(queryBatch);
		
		if(!CollectionUtils.isEmpty(racf.getRacfNodes())){
			for(String node : racf.getRacfNodes()){
				Map<String, String> params = new HashMap<String, String>();
				params.put("racfId", racfId.toString());
				params.put("accessNode", node);
				queryBatch = new QueryBatch("racf.saveUserAcessNodes",params);
				list.add(queryBatch);
			}			
		}
		
		if(!CollectionUtils.isEmpty(racf.getUserRoles())){
			for(Role role : racf.getUserRoles()){
				Map<String, String> params = new HashMap<String, String>();
				params.put("userId", racf.getUser().getUserId().toString());
				params.put("roleId", role.getRoleId().toString());
				queryBatch = new QueryBatch("racf.saveRole",params);
				list.add(queryBatch);
			}
		}
		
		DaoUtil.executeBatch(list, getSqlMapClientTemplate());
		
	}

}
