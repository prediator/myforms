package com.spring.service;

import java.util.List;

import org.springframework.security.access.annotation.Secured;

import com.myforms.usergroup.model.User;
import com.spring.model.Login;

/**
 * @deprecated
 * @author Mohd Irshad
 *
 */
public interface LoginService {
	
	public User getUser(String username);
	@Secured("ROLE_ADMIN")
	public List<Login> getAllLogins();
}
