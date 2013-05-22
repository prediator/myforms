package com.spring.service.bean;

import org.springframework.security.core.GrantedAuthority;

public class GrantedAuthorityImpl implements GrantedAuthority {

	private String  authority;
	@Override
	public String getAuthority() {
		// TODO Auto-generated method stub
		return authority;
	}

}
