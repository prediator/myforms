package com.myforms.web.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.myforms.constants.MyFormsConstants;
import com.myforms.createdoc.RichTextDoc;
import com.myforms.field.CheckBoxField;
import com.myforms.field.DateField;
import com.myforms.field.Field;
import com.myforms.field.ListField;
import com.myforms.field.NumberField;
import com.myforms.field.RadioField;
import com.myforms.field.RichTextField;
import com.myforms.field.TextField;
import com.myforms.field.config.model.TemplateField;
import com.myforms.logging.MyFormsLogger;
import com.myforms.template.config.model.Template;
import com.myforms.upload.FileUploadInfo;
import com.myforms.usergroup.model.User;

public class Document {
private Integer id;
private String displayId;
private String title;
private User createdBy;
private Timestamp createdOn;
private Template template;
private Timestamp updatedOn;
private User updatedBy;
private String version;
private Map<String, Field> fieldMap = new HashMap<String, Field>();
private boolean isDirty;
private List<FileUploadInfo> uploadedItems;
private List<RichTextDoc> richTextDocs;
public Boolean isDirty() {
	Iterator<Field> iter = fieldMap.values().iterator();
	if(iter.hasNext()){
		Field field = iter.next();
		if(field.isDirty()){
			return true;
		}
	}
	return isDirty;
}
public void setDirty(Boolean isDirty) {
	this.isDirty = isDirty;
}
public User getCreatedBy() {
	return createdBy;
}
public void setCreatedBy(User createdBy) {
	this.createdBy = createdBy;
}
public Timestamp getCreatedOn() {
	return createdOn;
}
public void setCreatedOn(Timestamp createdOn) {
	this.createdOn = createdOn;
}
public String getDisplayId() {
	return displayId;
}
public void setDisplayId(String displayId) {
	this.displayId = displayId;
}
public Map<String, Field> getFieldMap() {
	return fieldMap;
}
public void setFieldMap(Map<String, Field> fieldMap) {
	this.fieldMap = fieldMap;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public Template getTemplate() {
	return template;
}
public void setTemplate(Template template) {
	this.template = template;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getVersion() {
	return version;
}
public void setVersion(String version) {
	this.version = version;
}
public Document(Template template)
{
	this.template = template;
	setDocumentFieldMap();
}

private void setDocumentFieldMap() {
	Map<String, TemplateField> map = template.getTemplateFieldMap();
	Map<String, Field> fieldMap = new HashMap<String, Field>();
	Iterator<String> iterator = map.keySet().iterator();
	while(iterator.hasNext())
	{
		String key = iterator.next();
		TemplateField templateField = map.get(key);
		if(MyFormsConstants.FieldType.TEXT.equals(templateField.getFieldType().getFieldType())){
			Field textField = new TextField(templateField);
			textField.setFieldType(MyFormsConstants.FieldType.TEXT);
			fieldMap.put(key, textField);
		}
		else if(MyFormsConstants.FieldType.NUMBER.equals(templateField.getFieldType().getFieldType())){
			Field numberField = new NumberField(templateField);
			numberField.setFieldType(MyFormsConstants.FieldType.NUMBER);
			fieldMap.put(key, numberField);
		}
		else if(MyFormsConstants.FieldType.PASSWORD.equals(templateField.getFieldType().getFieldType())){
			Field textField = new TextField(templateField);
			textField.setFieldType(MyFormsConstants.FieldType.PASSWORD);
			fieldMap.put(key, textField);
		}
		else if(MyFormsConstants.FieldType.LIST.equals(templateField.getFieldType().getFieldType())){
			Field listField = new ListField(templateField);
			listField.setFieldType(MyFormsConstants.FieldType.LIST);
			fieldMap.put(key, listField);
		}
		else if(MyFormsConstants.FieldType.RICH_TEXT.equals(templateField.getFieldType().getFieldType())){
			RichTextField richTextField = new RichTextField(templateField);
			richTextField.setFieldType(MyFormsConstants.FieldType.RICH_TEXT);
			fieldMap.put(key, richTextField);
		}
		else if(MyFormsConstants.FieldType.DATE.equals(templateField.getFieldType().getFieldType())){
			DateField dateField = new DateField(templateField);
			dateField.setFieldType(MyFormsConstants.FieldType.DATE);
			fieldMap.put(key, dateField);
		}
		else if(MyFormsConstants.FieldType.CHECKBOX.equals(templateField.getFieldType().getFieldType())){
			CheckBoxField checkBoxField = new CheckBoxField(templateField);
			checkBoxField.setFieldType(MyFormsConstants.FieldType.CHECKBOX);
			fieldMap.put(key, checkBoxField);
		}
		else if(MyFormsConstants.FieldType.RADIO.equals(templateField.getFieldType().getFieldType())){
			RadioField radioField = new RadioField(templateField);
			radioField.setFieldType(MyFormsConstants.FieldType.RADIO);
			fieldMap.put(key, radioField);
		}
	}
	this.fieldMap =fieldMap;
}
public User getUpdatedBy() {
	return updatedBy;
}
public void setUpdatedBy(User updatedBy) {
	this.updatedBy = updatedBy;
}
public Timestamp getUpdatedOn() {
	return updatedOn;
}
public void setUpdatedOn(Timestamp updatedOn) {
	this.updatedOn = updatedOn;
}
public Document(){
	MyFormsLogger.getLogger().info(this.getClass(),"constructor","Creating new object");
}
public void setFieldList(List<Field> fieldList){
	fieldMap = new HashMap<String, Field>();
	Iterator<Field> iterator = fieldList.iterator();
	while(iterator.hasNext()){
		Field field = iterator.next();
		if(field instanceof NumberField){
			fieldMap.put(field.getTemplateField().getFieldName(), (NumberField)field);
		}
		else if(field instanceof TextField){
			fieldMap.put(field.getTemplateField().getFieldName(), (TextField)field);
		}
		else if(field instanceof ListField){
			fieldMap.put(field.getTemplateField().getFieldName(), (ListField)field);
		}
		else if(field instanceof RichTextField){
			fieldMap.put(field.getTemplateField().getFieldName(), (RichTextField)field);
		}
		else if(field instanceof DateField){
			fieldMap.put(field.getTemplateField().getFieldName(), (DateField)field);
		}
		else if(field instanceof CheckBoxField){
			fieldMap.put(field.getTemplateField().getFieldName(), (CheckBoxField)field);
		}
		else if(field instanceof RadioField){
			fieldMap.put(field.getTemplateField().getFieldName(), (RadioField)field);
		}
	}
}
public String getUpdateTimestamp(){
	if(updatedOn == null){
		return "";
	}
	SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
	String date = format.format(updatedOn) ;
	String fname = updatedBy.getFirstName() == null?"ABC":updatedBy.getFirstName();
	String lname = updatedBy.getLastName() == null? "XYZ" : updatedBy.getLastName();
	String name = ( fname+" "+ lname);
	return date +" : " + name;	
}
public String getCreateTimestamp(){
	SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
	String date = format.format(createdOn) ;
	String name = "";
	if(createdBy != null){
	String fname = createdBy.getFirstName() == null?"ABC":createdBy.getFirstName();
	String lname = createdBy.getLastName() == null? "XYZ" : createdBy.getLastName();
	 name = ( fname+" "+ lname);
	}
	return date +" : " + name;
}
public List<FileUploadInfo> getUploadedItems() {
	return uploadedItems;
}
public void setUploadedItems(List<FileUploadInfo> uploadedItems) {
	this.uploadedItems = uploadedItems;
}
public List<RichTextDoc> getRichTextDocs() {
	return richTextDocs;
}
public void setRichTextDocs(List<RichTextDoc> richTextDocs) {
	this.richTextDocs = richTextDocs;
}

}
