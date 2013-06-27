package com.myforms.field.propertyeditor;

import java.beans.PropertyEditorSupport;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.apache.commons.lang.StringUtils;

import com.myforms.field.BooleanField;
import com.myforms.field.BooleanSelectedValue;
import com.myforms.field.Field;
import com.myforms.field.config.model.BooleanValue;
import com.myforms.field.service.FieldServiceManager;
/**
 * 
 * @author mohd.irshad
 *
 */
public  class BooleanFieldProprtyEditor extends PropertyEditorSupport {
	
	/**
	 * 
	 */
	private FieldServiceManager fieldServiceManager;
	private final static String SEPARATOR = ",";
	
	public BooleanFieldProprtyEditor(FieldServiceManager fieldServiceManager) {
		this.fieldServiceManager = fieldServiceManager;
	}
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		BooleanField field = (BooleanField)getValue();
		field.setDirty(!StringUtils.equals(text, field.getFieldValue()));
		//field.setFieldType(MyFormsConstants.FieldType.TEXT);
		field.setFieldValue(text);
		Map<String, BooleanValue> map = getBooleanValueMap(field.getTemplateField().getBooleanValues());
		if(!StringUtils.isEmpty(text)){
			StringTokenizer tokenizer =  new StringTokenizer(text, SEPARATOR);
			List<BooleanSelectedValue> selectedValues = new ArrayList<BooleanSelectedValue>();
			
			while(tokenizer.hasMoreTokens()){
				
				field.setSelectedValues(selectedValues);
				String key = tokenizer.nextToken();
				BooleanSelectedValue value;
				if(!StringUtils.isEmpty(key))
				{
					value = new BooleanSelectedValue();
					value.setSelected(true);
					value.setValue(key);
					value.setDisplayName(map.get(key).getDisplayName());
					selectedValues.add(value);
					map.remove(key);
				}
			}
		}
		for(String key :map.keySet()){
			BooleanSelectedValue value = new BooleanSelectedValue();
			value.setValue(key);
			value.setDisplayName(map.get(key).getDisplayName());
			value.setSelected(false);
			if(field.getSelectedValues() == null)
				field.setSelectedValues(new ArrayList<BooleanSelectedValue>());
			field.getSelectedValues().add(value);
		}
		field.setBooleanValue(true);
	
		setValue(field);
	}
	/**
	 * 
	 * @param booleanValues
	 * @return
	 */
	private Map<String, BooleanValue> getBooleanValueMap(
			List<BooleanValue> booleanValues) {
		Map<String, BooleanValue>  map = new  HashMap<String, BooleanValue>();
		if(booleanValues != null){
			for(BooleanValue b: booleanValues){
				map.put(b.getValue(), b);
			}
			return map;
		}
		return Collections.EMPTY_MAP;
	}

	@Override
	public String getAsText() {
		Field field = (Field)getValue();
		return field.getFieldValue();
	}

}
