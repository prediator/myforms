package com.myforms.exception.runtimeexception;

import com.myforms.constants.MyFormsConstants;

public class InvalidBatchParamException extends RuntimeException {
	public InvalidBatchParamException()
	{
		super(MyFormsConstants.ExceptionMsg.INVALID_BATCH_PARAM_EXCEPTION);
	}
	public InvalidBatchParamException(String msg)
	{
		super(msg);
	}
	public InvalidBatchParamException(String msg,RuntimeException exception)
	{
		super(msg,exception);
	}
	public InvalidBatchParamException(RuntimeException exception)
	{
		super(exception);
	}
}
