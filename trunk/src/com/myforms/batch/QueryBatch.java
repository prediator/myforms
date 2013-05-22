package com.myforms.batch;

import java.util.Map;

import org.springframework.util.StringUtils;

import com.myforms.exception.runtimeexception.InvalidBatchParamException;

public class QueryBatch {
private String queryName;
private Object queryParams;
public QueryBatch(String queryName, Object queryParams) throws InvalidBatchParamException
{
	if(!StringUtils.hasLength(queryName))
	{
		throw new InvalidBatchParamException();
	}
	this.queryName =queryName;
	this.queryParams =queryParams;
}
public String getQueryName() {
	return queryName;
}
public Object getQueryParams() {
	return queryParams;
}
}
