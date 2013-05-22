package com.spring.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.spring.model.Login;

public class SaveUserDaoImpl extends SqlMapClientDaoSupport  implements SaveUserDao {

	@Override
	public void saveUser(Login login) throws RuntimeException {
		//getSqlMapClientTemplate().insert("MyUsers.insertLogin", login);
		//throw new RuntimeException();
	}

}
