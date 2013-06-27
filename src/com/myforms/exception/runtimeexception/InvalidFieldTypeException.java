package com.myforms.exception.runtimeexception;

import com.myforms.constants.MyFormsConstants;

public class InvalidFieldTypeException extends RuntimeException {
	public InvalidFieldTypeException()
	{
		super(MyFormsConstants.ExceptionMsg.INVALID_BATCH_PARAM_EXCEPTION);
	}
	public InvalidFieldTypeException(String msg)
	{
		super(msg);
	}
	public InvalidFieldTypeException(String msg,RuntimeException exception)
	{
		super(msg,exception);
	}
	public InvalidFieldTypeException(RuntimeException exception)
	{
		super(exception);
	}
}
