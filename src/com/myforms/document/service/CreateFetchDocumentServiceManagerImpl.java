package com.myforms.document.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.myforms.constants.MyFormsConstants;
import com.myforms.document.dao.CreateFetchDocumentDao;
import com.myforms.exception.runtimeexception.DocumentNotFoundException;
import com.myforms.exception.runtimeexception.InvalidTemplateException;
import com.myforms.field.BooleanField;
import com.myforms.field.BooleanSelectedValue;
import com.myforms.field.Field;
import com.myforms.field.config.model.BooleanValue;
import com.myforms.template.config.model.Template;
import com.myforms.template.dao.CreateFetchTemplateDao;
import com.myforms.util.MyFormProperties;
import com.myforms.web.model.Document;

public class CreateFetchDocumentServiceManagerImpl implements
		CreateFetchDocumentServiceManager {
	private CreateFetchDocumentDao createFetchDocumentDao; 
	private CreateFetchTemplateDao createFetchTemplateDao;


	public Document createDocumentByTemplateId(Integer templateId) throws InvalidTemplateException {
		Template template = createFetchTemplateDao.getTemplateById(templateId);
		if(template == null)
		{
			throw new InvalidTemplateException();
		}
		Document document = new Document(template);		
		document.setCreatedOn(new Timestamp(System.currentTimeMillis()));
		document.setCreatedBy(MyFormProperties.getInstance().getCurrentUser());
		resolveDefaultValues(document);
		return document;
	}


	public CreateFetchDocumentDao getCreateFetchDocumentDao() {
		return createFetchDocumentDao;
	}
	public void setCreateFetchDocumentDao(
			CreateFetchDocumentDao createFetchDocumentDao) {
		this.createFetchDocumentDao = createFetchDocumentDao;
	}
	public CreateFetchTemplateDao getCreateFetchTemplateDao() {
		return createFetchTemplateDao;
	}

	public void setCreateFetchTemplateDao(
			CreateFetchTemplateDao createFetchTemplateDao) {
		this.createFetchTemplateDao = createFetchTemplateDao;
	}


	public Document getDocumentByDisplayId(String displayId) throws DocumentNotFoundException {
		 Document document = createFetchDocumentDao.getDocumentByDisplayId(displayId);
		resolveDefaultValues(document);
		return document;		
	}


	public Document getDocumentById(Integer documentId) throws DocumentNotFoundException {
		// TODO Auto-generated method stub
		Document document = createFetchDocumentDao.getDocumentById(documentId);
		resolveDefaultValues(document);
		return document;
	}


	public List<Document> getAllDocuments() throws DocumentNotFoundException {
		// TODO Auto-generated method stub
		return createFetchDocumentDao.getAllDocuments();
	}
	
	private void resolveDefaultValues(Document document){
		if(document.getFieldMap() != null){
			for(String key : document.getFieldMap().keySet()){
				Field field = document.getFieldMap().get(key);
				if(field.getLastUpdatedOn() == null){
					field.setFieldValue(document.getTemplate().getTemplateFieldMap().get(key).getDefaultValue());
				}
				if(MyFormsConstants.FieldType.CHECKBOX.equals(field.getFieldType()) || MyFormsConstants.FieldType.RADIO.equals(field.getFieldType())){
					List<String> list = getSelectedValues(((BooleanField)field).getSelectedValues());
					if(document.getTemplate().getTemplateFieldMap().get(key).getBooleanValues() != null)
					for(BooleanValue v : document.getTemplate().getTemplateFieldMap().get(key).getBooleanValues() ){
						if(!list.contains(v.getValue())){
							BooleanSelectedValue booleanSelectedValue = new BooleanSelectedValue();
							booleanSelectedValue.setSelected(false);
							booleanSelectedValue.setValue(v.getValue());
							booleanSelectedValue.setDisplayName(v.getDisplayName());
							if(((BooleanField)field).getSelectedValues() == null )
								((BooleanField)field).setSelectedValues(new ArrayList<BooleanSelectedValue>());
							((BooleanField)field).getSelectedValues().add(booleanSelectedValue);
							booleanSelectedValue.setOrder(v.getOrder());
						}
						else{
							BooleanSelectedValue b = findBooleanValue(v.getValue(), ((BooleanField)field).getSelectedValues());
							if(b != null)
								b.setDisplayName(v.getDisplayName());
							if(((BooleanField)field).getSelectedValues() == null)
								((BooleanField)field).setSelectedValues(new ArrayList<BooleanSelectedValue>());
							if(!((BooleanField)field).getSelectedValues().contains(b)){
								((BooleanField)field).getSelectedValues().add(b);
							}
							b.setOrder(v.getOrder());
							
						}
					}
					Collections.sort(((BooleanField)field).getSelectedValues());
				}
			}	
		}
	}

private BooleanSelectedValue findBooleanValue(String value,
			List<BooleanSelectedValue> selectedValues) {
	BooleanSelectedValue rv = null;	
	if(selectedValues != null){
			for(BooleanSelectedValue value2 : selectedValues){
				if(value2.getValue().equals(value)){
					rv = value2;
					break;
				}
			}
		}
	if(rv == null){
		rv = new  BooleanSelectedValue();
		rv.setValue(value);
	}
		return rv;
	}


/**
 * 
 * @param selectedValues
 * @return
 */
	private List<String> getSelectedValues(
			List<BooleanSelectedValue> selectedValues) {
		List<String> list = new ArrayList<String>();
		if(selectedValues != null){
			for(BooleanSelectedValue b : selectedValues){
				list.add(b.getValue());
			}
		}
		return list;
	}

/**
 * 
 */
public List<Document> getAllDocuments(List<Long> templateIds)
		throws DocumentNotFoundException {
	return createFetchDocumentDao.getAllDocuments(templateIds);
}

}
