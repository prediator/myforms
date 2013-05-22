package com.myforms.exception.runtimeexception;

import com.myforms.constants.MyFormsConstants;

public class DocumentUpdateException extends RuntimeException {
	public DocumentUpdateException()
	{
		super(MyFormsConstants.ExceptionMsg.DOCUMENT_UPDATE_EXCEPTION);
	}
	public DocumentUpdateException(String msg)
	{
		super(msg);
	}
	public DocumentUpdateException(String msg,RuntimeException exception)
	{
		super(msg,exception);
	}
	public DocumentUpdateException(RuntimeException exception)
	{
		super(exception);
	}
}
