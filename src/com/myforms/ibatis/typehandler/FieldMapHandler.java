package com.myforms.ibatis.typehandler;

import java.sql.SQLException;
import java.util.HashMap;

import com.ibatis.sqlmap.client.extensions.ParameterSetter;
import com.ibatis.sqlmap.client.extensions.ResultGetter;
import com.ibatis.sqlmap.client.extensions.TypeHandlerCallback;
import com.myforms.field.config.model.TemplateField;

public class FieldMapHandler implements TypeHandlerCallback {

	public Object getResult(ResultGetter getter) throws SQLException {
		// TODO Auto-generated method stub
		HashMap<String, TemplateField> templateFieldMap = new HashMap<String, TemplateField>();
		return templateFieldMap;
	}

	public void setParameter(ParameterSetter setter, Object obj)
			throws SQLException {
		HashMap<String, TemplateField> templateFieldMap = new HashMap<String, TemplateField>();
		setter.setObject(templateFieldMap);

	}

	public Object valueOf(String arg0) {
		// TODO Auto-generated method stub
		return null;
	}

}
