package com.spring.service;

import java.util.List;

import org.springframework.security.access.annotation.Secured;

import com.spring.connectivity.dao.LoginDao;
import com.spring.model.Login;
import com.spring.model.User;

public class LoginServiceImpl implements LoginService {
private LoginDao loginDao;
	public LoginDao getLoginDao() {
	return loginDao;
}

public void setLoginDao(LoginDao loginDao) {
	this.loginDao = loginDao;
}

	@Override
	public com.myforms.usergroup.model.User getUser(String username) {
		// TODO Auto-generated method stub
		return loginDao.getUser(username);
	}

	@Override
	
	public List<Login> getAllLogins() {
		// TODO Auto-generated method stub
		return loginDao.getAllLogins();
	}

}
