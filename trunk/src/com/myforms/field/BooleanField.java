package com.myforms.field;

import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.myforms.field.config.model.TemplateField;
/**
 * 
 * @author mohd.irshad
 *
 */
public abstract class BooleanField extends  Field {
	private Boolean booleanValue;
	private List<BooleanSelectedValue> selectedValues;
	protected BooleanField(){}
	public BooleanField(TemplateField templateField) {
		super(templateField);
	}

	public Boolean getBooleanValue() {
		return this.booleanValue;
	}

	public void setBooleanValue(Boolean booleanValue) {
		this.booleanValue = booleanValue;
	}
	public List<BooleanSelectedValue> getSelectedValues() {
		return selectedValues;
	}
	public void setSelectedValues(List<BooleanSelectedValue> selectedValues) {
		this.selectedValues = selectedValues;
	}
}
