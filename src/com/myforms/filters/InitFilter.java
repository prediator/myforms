package com.myforms.filters;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.context.SecurityContextHolder;

import com.myforms.usergroup.model.User;
import com.myforms.util.MyFormProperties;
import com.myforms.util.PropertyEditor;

public class InitFilter implements Filter {
    private static String isLoaded = "isLoaded";
	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    User user = 	MyFormProperties.getInstance().getCurrentUser();
	    if(user == null)
	    {
	    	List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
	    	GrantedAuthorityImpl impl = new GrantedAuthorityImpl("IS_AUTHENTICATED_ANONYMOUSLY");
	    	authorities.add(impl);
	    	SecurityContextHolder.getContext().setAuthentication(new AnonymousAuthenticationToken("anonymous", "anonymous",authorities));
	    }
		chain.doFilter(req, res);
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
