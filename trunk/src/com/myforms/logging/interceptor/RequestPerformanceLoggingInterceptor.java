package com.myforms.logging.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class RequestPerformanceLoggingInterceptor  extends HandlerInterceptorAdapter{
@Override
public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
	// TODO Auto-generated method stub
	return super.preHandle(arg0, arg1, arg2);
}
@Override
public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3) throws Exception {
	// TODO Auto-generated method stub
	super.postHandle(arg0, arg1, arg2, arg3);
}
@Override
public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
	// TODO Auto-generated method stub
	super.afterCompletion(arg0, arg1, arg2, arg3);
}
}
