package com.myforms.web.validator.login;

import org.springframework.security.core.userdetails.UserDetails;

public interface LoginValidator {
	public boolean validate(UserDetails user);
}
