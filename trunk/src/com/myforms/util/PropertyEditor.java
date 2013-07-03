package com.myforms.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.myforms.constants.MyFormsConstants;
import com.myforms.exception.runtimeexception.InvalidPropertyException;
import com.myforms.logging.MyFormsLogger;

public class PropertyEditor {
private final static PropertyEditor propertyEditor = new PropertyEditor();
private Properties properties;// = new Properties();
public static PropertyEditor getInstance()
{
return propertyEditor;	
}
private PropertyEditor(){
	properties = new Properties();
	MyFormsLogger.getLogger().info("Property editor created!!!\n");
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
	String s = String.valueOf(map.get("htmlmessages"));
	xmlpath = xmlpath.substring(0,xmlpath.lastIndexOf("/")+1 )+ s;
	//Properties properties = new Properties();  
	try {  
	        properties.load(new FileInputStream(xmlpath));  
	} catch (IOException e) { 
		Logger.getLogger(this.getClass()).error(e);
	} 
	properties.putAll(map);
	properties.putAll(properties);
	properties.putAll(System.getProperties());
	MyFormsLogger.getLogger().info("all properties initialized" + properties);
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
