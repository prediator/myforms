package com.myforms.field;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.myforms.constants.MyFormsConstants;
import com.myforms.field.config.model.TemplateField;

public class DateField extends Field {
	public DateField(TemplateField templateField) {
		super(templateField);		
	}
public DateField(){}
	private Date dateValue;
	public Date getDateValue() {
		return dateValue;
	}
	public void setDateValue(Date dateValue) {
		this.dateValue = dateValue;
	}
	public String getFieldValue() {
		if(dateValue != null){
			DateFormat dateFormat = new SimpleDateFormat(MyFormsConstants.DATE_FORMAT);
			return dateFormat.format(dateValue);
		}
		else
			return super.getFieldValue();
	}
	
}
