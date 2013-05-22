package org.myforms.security;

import java.util.Collection;

import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;

public class DemoAcessDecisionManager implements AccessDecisionManager{

	public void decide(Authentication auth, Object obj, Collection<ConfigAttribute> attributes) throws AccessDeniedException, InsufficientAuthenticationException {
				auth.getAuthorities();
	}

	public boolean supports(ConfigAttribute arg0) {
		
		return true;
	}

	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return true;
	}

}
