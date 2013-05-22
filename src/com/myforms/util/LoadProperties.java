package com.myforms.util;

import java.net.MalformedURLException;

import org.dom4j.DocumentException;

import com.myforms.exception.runtimeexception.InvalidPropertyException;

public class LoadProperties {
public LoadProperties() throws MalformedURLException, InvalidPropertyException, DocumentException
{
PropertyEditor.getInstance().loadPropertiesFromPFile();
PropertyEditor.getInstance().loadPropertiesFromXml();
}
}
