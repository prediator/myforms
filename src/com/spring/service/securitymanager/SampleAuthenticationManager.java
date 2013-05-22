package com.spring.service.securitymanager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;

import com.spring.service.LoginService;

public class SampleAuthenticationManager implements AuthenticationManager {

    static final List<GrantedAuthority> AUTHORITIES = new ArrayList<GrantedAuthority>();
    private LoginService loginService;
	
	static {
//	AUTHORITIES.add(new GrantedAuthorityImpl("ROLE_USER"));
//	AUTHORITIES.add(new GrantedAuthorityImpl("ROLE_TELLER"));
	//AUTHORITIES.add(new GrantedAuthorityImpl("ROLE_SUPERVISOR"));
	}
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		
	com.myforms.usergroup.model.User user = loginService.getUser(auth.getName());	
	AUTHORITIES.clear();
	for(GrantedAuthority ga : user.getAuthorities())
	{
		AUTHORITIES.add(ga);
	}
	if (auth.getName().equals(auth.getCredentials())) {
	return new UsernamePasswordAuthenticationToken(auth.getName(),
	auth.getCredentials(), AUTHORITIES);
	}
	throw new BadCredentialsException("Bad Credentials");
	}
	public LoginService getLoginService() {
		return loginService;
	}
	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}
	}

