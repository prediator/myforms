package com.myforms.exception.runtimeexception;

import com.myforms.constants.MyFormsConstants;

public class InvalidTemplateException extends RuntimeException {
	public InvalidTemplateException()
	{
		super(MyFormsConstants.ExceptionMsg.INVALID_TEMPLATE_MSG);
	}
	public InvalidTemplateException(String msg)
	{
		super(msg);
	}
	public InvalidTemplateException(String msg,RuntimeException exception)
	{
		super(msg,exception);
	}
	public InvalidTemplateException(RuntimeException exception)
	{
		super(exception);
	}
}
