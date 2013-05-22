package com.myforms.logging;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

public class MyFormsLogger implements Cloneable{
private static MyFormsLogger logger = new MyFormsLogger();
private Logger _log = Logger.getLogger(this.getClass());
private Map<Class, Logger> loggers = new HashMap<Class, Logger>();
private MyFormsLogger(){
	loggers.put(null, _log);
}
public static MyFormsLogger getLogger()
{
	return logger;
}

private Logger getLogger(Class clazz)
{
	Logger log = loggers.get(clazz);
	if(log == null)
	{
		log = Logger.getLogger(clazz);
		loggers.put(clazz, log);
	}
	return log;
}
public void info(Class clazz, String method, String info, Throwable throwable)
{
	_log = getLogger(clazz);
	String logInfo = method == null?info : method + "  :   "+ info;
	if(throwable != null)
	{
		_log.info(logInfo, throwable);
	}
	else {
		_log.info(logInfo);
	}
	
}
public void info(Class clazz, String method, String info)
{
	info(clazz,method,info,null);
}
public void info(String method, String info)
{
	info(null,method,info);
}
public void info(String info)
{
	info(null,null,info);
}
public void debug(String info)
{
	_log.debug(info);
}
@Override
protected Object clone() throws CloneNotSupportedException {
	throw new CloneNotSupportedException();
}
}
