package com.myforms.exception.runtimeexception;

import com.myforms.constants.MyFormsConstants;

public class DocumentNotFoundException extends RuntimeException {
	public DocumentNotFoundException()
	{
		super(MyFormsConstants.ExceptionMsg.DOCUMENT_NOT_FOUND);
	}
	public DocumentNotFoundException(String msg)
	{
		super(msg);
	}
	public DocumentNotFoundException(String msg,RuntimeException exception)
	{
		super(msg,exception);
	}
	public DocumentNotFoundException(RuntimeException exception)
	{
		super(exception);
	}
}
