package com.spring.service;

import com.spring.dao.SaveUserDao;
import com.spring.model.Login;

public class SaveUsersServiceManagerImpl implements SaveUsersServiceManager {
private SaveUserDao saveUserDao;
	public SaveUserDao getSaveUserDao() {
	return saveUserDao;
}
public void setSaveUserDao(SaveUserDao saveUserDao) {
	this.saveUserDao = saveUserDao;
}
	@Override
	public void saveUser(Login login) throws RuntimeException {
		// TODO Auto-generated method stub
		saveUserDao.saveUser(login);
	}

}
