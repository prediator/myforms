package com.myforms.exception.runtimeexception;

import com.myforms.constants.MyFormsConstants;

public class ConcurrentUpdateException extends RuntimeException {
	public ConcurrentUpdateException()
	{
		super(MyFormsConstants.ExceptionMsg.DOCUMENT_CONCURRENT_UPDATE_EXCEPTION);
	}
	public ConcurrentUpdateException(String msg)
	{
		super(msg);
	}
	public ConcurrentUpdateException(String msg,RuntimeException exception)
	{
		super(msg,exception);
	}
	public ConcurrentUpdateException(RuntimeException exception)
	{
		super(exception);
	}
}
