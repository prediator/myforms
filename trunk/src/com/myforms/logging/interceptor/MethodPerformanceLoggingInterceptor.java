package com.myforms.logging.interceptor;

import java.lang.reflect.Method;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggerFactory;

import com.myforms.logging.MyFormsLogger;

public class MethodPerformanceLoggingInterceptor implements MethodInterceptor{
MyFormsLogger _log = MyFormsLogger.getLogger();
	public Object invoke(MethodInvocation methodInvocation) throws Throwable {		
		long startTime = System.currentTimeMillis();
	    Object result = methodInvocation.proceed();
	    long duration = System.currentTimeMillis() - startTime;
	    Method method = methodInvocation.getMethod();
	     String methodName = method.getDeclaringClass().getName() + "." + method.getName();
	    String msg = "Method '" + methodName + "' took " + duration + " milliseconds to run";		 
	    _log.info(method.getDeclaringClass(),method.getName(),msg);
		 return result;
	}

}
