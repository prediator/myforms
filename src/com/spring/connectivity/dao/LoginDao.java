package com.spring.connectivity.dao;

import java.util.List;

import com.myforms.usergroup.model.User;
import com.spring.model.Login;


public interface LoginDao {
	public List<Login> getAllLogins();
	public User getUser(String username);
}
