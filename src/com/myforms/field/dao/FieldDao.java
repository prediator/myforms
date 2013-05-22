package com.myforms.field.dao;

import com.myforms.field.Field;
import com.myforms.field.ListField;
import com.myforms.field.RichTextField;
import com.myforms.field.TextField;

public interface FieldDao {
public Field getFieldById(Integer integer);
public TextField getTextFieldById(Integer integer);
public RichTextField getRichTextFieldById(Integer integer);
public ListField getListFieldById(Integer integer);
}
