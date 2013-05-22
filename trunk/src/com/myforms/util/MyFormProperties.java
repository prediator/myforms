package com.myforms.util;

import java.util.HashMap;
import java.util.Map;

import com.myforms.constants.MyFormsConstants;
import com.myforms.usergroup.model.User;

public class MyFormProperties implements Cloneable{
private Map<String, Object> properties = new HashMap<String, Object>();
private static MyFormProperties mfp = new MyFormProperties();
private MyFormProperties(){}
public static MyFormProperties getInstance(){
	return mfp;
}
public void putProp(String key, String value)
{
	properties.put(key, value);
}
public void setUser(Object user)
{
	properties.put(MyFormsConstants.CURRENT_USER_KEY, user);
}
public User getCurrentUser(){
	return (User)properties.get(MyFormsConstants.CURRENT_USER_KEY);
}
public Object getProp(String key)
{
return properties.get(key);	
}
@Override
protected Object clone() throws CloneNotSupportedException {
	throw new CloneNotSupportedException();
}
}
