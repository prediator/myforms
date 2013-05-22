package com.spring.connectivity.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.myforms.usergroup.model.User;
import com.spring.model.Login;


public class LoginDaoImpl extends SqlMapClientDaoSupport implements LoginDao  {

	@Override
	public List<Login> getAllLogins() {
			
		return (List<Login>)( getSqlMapClientTemplate().queryForList("User.getAllLogins","Mohd Irshad"));
		
	}

	@Override
	public User getUser(String username) {
		// TODO Auto-generated method stub
		return (User)( getSqlMapClientTemplate().queryForObject("User.getUserByUsername",username));
	}

	

}
