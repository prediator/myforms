package com.myforms.util;

import java.io.File;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.myforms.constants.MyFormsConstants;
import com.myforms.exception.runtimeexception.InvalidPropertyException;

public class PropertyEditor {
private static PropertyEditor propertyEditor = new PropertyEditor();
private static Properties properties = new Properties();
public static PropertyEditor getInstance()
{
return propertyEditor;	
}
public void loadPropertiesFromXml() throws DocumentException, MalformedURLException, InvalidPropertyException
{
	String xmlpath = System.getProperty(MyFormsConstants.SystemProperties.XML_PATH);
	String env = System.getProperty(MyFormsConstants.SystemProperties.ENVIROMENT);
	if(env == null)
		throw new InvalidPropertyException(MyFormsConstants.ExceptionMsg.INVALID_ENV_MESG);
	
	Map map = new HashMap();
	
	File xml = new File(xmlpath);
	SAXReader reader = new SAXReader();
	Document doc = reader.read(xml);
	Element root = doc.getRootElement();
	List<Element> list = root.elements();
	String key = null;
	for(Element element  : list)
	{
		key = element.attributeValue(MyFormsConstants.SystemProperties.ATTRIB_KEY);
		if(key == null)
			continue;
		List<Element> values = element.elements();
		for(Element value  : values)
		{
			String environment = value.attributeValue(MyFormsConstants.SystemProperties.ATTRIB_ENV);
			if(env.equalsIgnoreCase(environment))
			{
				map.put(key, value.getStringValue());
			}
			
		}
	}
	
	properties.putAll(map);
}
public void loadPropertiesFromPFile()
{
	
}
public String getProperty(String key)
{
	return properties.getProperty(key);
}
public String getProperty(String key,String defaultValue)
{
	String returnValue = properties.getProperty(key);
	return returnValue != null?returnValue : defaultValue;
}
public Boolean getBooleanProperty(String key)
{
	String temp = properties.getProperty(key);
	Boolean returnValue = null;
	try{
		returnValue = Boolean.valueOf(temp);
	}
	catch (Exception e) {
		
	}
	return returnValue;
}

}
