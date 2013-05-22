package com.myforms.exception.runtimeexception;

import java.text.MessageFormat;

public class Message {

public static String getErrorMessage(String msg, String param){
	MessageFormat format = new MessageFormat(msg);
	Object [] args = {param};
	return format.format(args);
}
public static String getErrorMessage(String msg, String []params){
	MessageFormat format = new MessageFormat(msg);
	return format.format(params);
}
public static String getMessage(String msg, Object []params){
	//MessageFormat format = new MessageFormat(msg);
	int index = 0;
	for(Object obj : params){
		msg = msg.replace("{"+index+"}", obj.toString());
		index++;
	}
	return msg;
}
}
