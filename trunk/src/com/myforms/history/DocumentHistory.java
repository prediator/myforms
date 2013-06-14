package com.myforms.history;

import java.util.Date;

import com.myforms.field.config.model.FieldType;
import com.myforms.usergroup.model.User;
import com.myforms.web.model.Document;

/**
 * 
 * @author mohd.irshad
 *
 */
public class DocumentHistory  implements Comparable<DocumentHistory>{
	private Long id;
	private Long templateFieldId;
	private String fieldValue;
	private FieldType fieldType;
	private Date updatedOn;
	private User updatedBy;
	private Document document;
	public Document getDocument() {
		return document;
	}
	public void setDocument(Document document) {
		this.document = document;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getTemplateFieldId() {
		return templateFieldId;
	}
	public void setTemplateFieldId(Long templateFieldId) {
		this.templateFieldId = templateFieldId;
	}
	public String getFieldValue() {
		return fieldValue;
	}
	public void setFieldValue(String fieldValue) {
		this.fieldValue = fieldValue;
	}
	public FieldType getFieldType() {
		return fieldType;
	}
	public void setFieldType(FieldType fieldType) {
		this.fieldType = fieldType;
	}
	public Date getUpdatedOn() {
		return updatedOn;
	}
	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}
	public User getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(User updatedBy) {
		this.updatedBy = updatedBy;
	}
	@Override
	public int compareTo(DocumentHistory o) {
		return o.getUpdatedOn().compareTo(this.getUpdatedOn());
	}
}
