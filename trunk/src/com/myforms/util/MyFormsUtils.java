package com.myforms.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.myforms.constants.MyFormsConstants;
import com.myforms.usergroup.model.User;

public class MyFormsUtils {
public static String getFilePath(Integer documentId, User user){
	StringBuilder baseUrl = new StringBuilder( PropertyEditor.getInstance().getProperty(MyFormsConstants.SystemProperties.UPLOAD_LOCATION));
	baseUrl.append(user.getUserId());
	baseUrl.append(MyFormsConstants.FILE_SEPARATOR);
	baseUrl.append(documentId);
	baseUrl.append(MyFormsConstants.FILE_SEPARATOR);
	return baseUrl.toString();
}
public static List<String> convertToDataList(String text){
	List<String> list = new ArrayList<String>();
	int index = 0;
	while(!StringUtils.isEmpty(text)){
		if(text.length() < MyFormsConstants.RT_DATA_LENTGH){
			list.add(index++,text);
			text = null;
		}
		else{
			String txt = null;
			txt = text.substring(0,MyFormsConstants.RT_DATA_LENTGH);
			list.add(index++, txt);
			text = text.substring(MyFormsConstants.RT_DATA_LENTGH, text.length());
		}
	}
	return list;
}
public static String getFormattedDate(Date date){
	DateFormat dateFormat = new SimpleDateFormat(MyFormsConstants.DATE_FORMAT);
	return dateFormat.format(date);
}
}
