package com.myforms.exception.runtimeexception;

import com.myforms.constants.MyFormsConstants;

public class InvalidPropertyException extends RuntimeException {
public InvalidPropertyException()
{
	super(MyFormsConstants.ExceptionMsg.INVALID_PROP_EXCEPTION);
}
public InvalidPropertyException(String msg)
{
	super(msg);
}
public InvalidPropertyException(String msg,RuntimeException exception)
{
	super(msg,exception);
}
public InvalidPropertyException(RuntimeException exception)
{
	super(exception);
}
}
