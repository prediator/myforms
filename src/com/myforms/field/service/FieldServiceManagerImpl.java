package com.myforms.field.service;

import com.myforms.field.Field;
import com.myforms.field.ListField;
import com.myforms.field.RichTextField;
import com.myforms.field.TextField;
import com.myforms.field.dao.FieldDao;

public class FieldServiceManagerImpl implements FieldServiceManager {
	private FieldDao fieldDao;
	public Field getFieldById(Integer integer) {
		// TODO Auto-generated method stub
		return null;
	}

	public ListField getListFieldById(Integer integer) {
		// TODO Auto-generated method stub
		return null;
	}

	public RichTextField getRichTextFieldById(Integer integer) {
		// TODO Auto-generated method stub
		return null;
	}

	public TextField getTextFieldById(Integer integer) {
		// TODO Auto-generated method stub
		return null;
	}

	public FieldDao getFieldDao() {
		return fieldDao;
	}

	public void setFieldDao(FieldDao fieldDao) {
		this.fieldDao = fieldDao;
	}

}
