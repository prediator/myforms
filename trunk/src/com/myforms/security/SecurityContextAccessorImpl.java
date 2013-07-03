package com.myforms.security;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.CollectionUtils;

import com.myforms.constants.MyFormsConstants;

/**
 * 
 * @author mohd.irshad
 *
 */
public class SecurityContextAccessorImpl implements SecurityContextAccessor {

	@Override
	public boolean isCurrentAuthenticationAnonymous() {
		if(SecurityContextHolder.getContext()!=null && SecurityContextHolder.getContext().getAuthentication()!= null
				&& !CollectionUtils.isEmpty(SecurityContextHolder.getContext().getAuthentication().getAuthorities())){
			for(GrantedAuthority s: SecurityContextHolder.getContext().getAuthentication().getAuthorities()){
				if(MyFormsConstants.IS_AUTHENTICATED_ANONYMOUSLY.equals(s.getAuthority()) || "ROLE_ANONYMOUS".equals(s.getAuthority()))
					return false;
			}
		}
		else
			return false;
		return true;
	}

}
