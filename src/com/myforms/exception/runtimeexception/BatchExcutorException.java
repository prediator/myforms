package com.myforms.exception.runtimeexception;

public class BatchExcutorException extends RuntimeException {
public BatchExcutorException(){
	super();
}
public BatchExcutorException(Exception exception){
	super(exception);
}
}
