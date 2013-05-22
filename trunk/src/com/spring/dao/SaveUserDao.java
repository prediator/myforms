package com.spring.dao;

import com.spring.model.Login;

public interface SaveUserDao {
	public void saveUser(Login login) throws RuntimeException;
}
