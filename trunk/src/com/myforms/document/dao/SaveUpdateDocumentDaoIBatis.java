package com.myforms.document.dao;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.commons.collections.CollectionUtils;
import org.myform.keygen.dao.KeyGenerator;
import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.ibatis.sqlmap.client.SqlMapExecutor;
import com.myforms.batch.QueryBatch;
import com.myforms.constants.MyFormsConstants;
import com.myforms.exception.runtimeexception.ConcurrentUpdateException;
import com.myforms.exception.runtimeexception.DocumentUpdateException;
import com.myforms.field.BooleanField;
import com.myforms.field.BooleanSelectedValue;
import com.myforms.field.DateField;
import com.myforms.field.Field;
import com.myforms.field.ListField;
import com.myforms.field.NumberField;
import com.myforms.field.RichTextField;
import com.myforms.field.TextField;
import com.myforms.field.config.model.TemplateField;
import com.myforms.usergroup.model.User;
import com.myforms.util.MyFormProperties;
import com.myforms.web.model.Document;

public class SaveUpdateDocumentDaoIBatis extends SqlMapClientDaoSupport implements SaveUpdateDocumentDao {

	private KeyGenerator keyGenerator;
	public void saveDocument(Document document) {
		List<QueryBatch> queries = new ArrayList<QueryBatch>();
		Integer documentId = getKeyForDocument(MyFormsConstants.Tables.DOC);
		document.setId(documentId);
		document.setDisplayId(getDisplayId(document.getUpdatedBy()));
		saveFields(document,queries);
		QueryBatch batch = new QueryBatch(MyFormsConstants.Queries.INSERT_DOCUMENT,document);
		queries.add(batch);
		executeBatch(queries);
	}
	
    private String getDisplayId(User user) {
		String finitial = (user.getFirstName() == null || user.getFirstName().length()<=0)?"X" :user.getFirstName().charAt(0)+"";
	    String linitial = (user.getLastName() == null || user.getLastName().length()<=0)?"X":user.getLastName().charAt(0)+"";
	    String did = finitial+linitial + (new Random()).nextInt(100000);
	    if(getSqlMapClientTemplate().queryForObject(MyFormsConstants.Queries.IS_DISPLAY_ID_EXIST, did) != null)
	     return getDisplayId(user);
	    else
		 return did;
	}
	private void saveFields(Document document, List<QueryBatch> queries) {
			Iterator<String> iterator = document.getFieldMap().keySet().iterator();	
			while (iterator.hasNext()) {
				String key = (String) iterator.next();
				Field field = (Field)document.getFieldMap().get(key);
				if(MyFormsConstants.FieldType.TEXT.equals(field.getFieldType())){
					saveTextField((TextField)field, document,queries);
				}
				else if(MyFormsConstants.FieldType.NUMBER.equals(field.getFieldType())){
					saveNumberField((NumberField)field, document,queries);
				}
				else if(MyFormsConstants.FieldType.LIST.equals(field.getFieldType())){
					saveListField((ListField)field, document,queries);
				}
				else if(MyFormsConstants.FieldType.RICH_TEXT.equals(field.getFieldType())){
					saveRichTextField((RichTextField)field, document,queries);
				}
				else if(MyFormsConstants.FieldType.DATE.equals(field.getFieldType())){
					saveDateField((DateField)field, document,queries);
				}
				else if(MyFormsConstants.FieldType.CHECKBOX.equals(field.getFieldType()) || MyFormsConstants.FieldType.RADIO.equals(field.getFieldType())){
					saveBooleanField((BooleanField)field, document,queries);
				}
				
			}
			
	}
	private void saveRichTextField(RichTextField field, Document document, List<QueryBatch> queries) {
		Map<String,Object> fldParams = new HashMap<String, Object>();
    	TemplateField templateField = field.getTemplateField();
    	Integer fieldId;
    	fieldId = field.getId();
    	if(fieldId == null || fieldId == 0){
    	fieldId = getKeyForFields(MyFormsConstants.Tables.FLD);
    	}
    	
    	if(fieldId != null){
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_ID, fieldId);
    	}
    	fldParams.put(MyFormsConstants.ParamsName.TEMPLATE_FIELD_ID,templateField.getFieldId());
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_VALUE,null);
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_TYPE,MyFormsConstants.FieldType.RICH_TEXT);
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_UPDATED_BY, document.getUpdatedBy().getUserId());
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_UPDATED_ON,document.getUpdatedOn()); 
    	fldParams.put(MyFormsConstants.ParamsName.DOCUMENT_ID,document.getId()); 
    	QueryBatch batch = new QueryBatch(MyFormsConstants.Queries.INSERT_FIELD,fldParams);
    	queries.add(batch);
    	
    	List<String> values = field.getDataList();
    	for(String value : values)
    	{
    		Map<String, Object> richTxtFldParams = new HashMap<String, Object>();
    		Integer richTxtFldId = getKeyForRichTextField(MyFormsConstants.Tables.RICH_TXT);
    		if(richTxtFldId != null){
    			richTxtFldParams.put(MyFormsConstants.ParamsName.RICH_TEXT_FLD_ID, richTxtFldId);
    		}
    		richTxtFldParams.put(MyFormsConstants.ParamsName.RICH_TEXT, value);
    		richTxtFldParams.put(MyFormsConstants.ParamsName.FIELD_ID, fieldId);
    		richTxtFldParams.put(MyFormsConstants.ParamsName.SEQUENCE, values.indexOf(value));
    		QueryBatch batch2 = new QueryBatch(MyFormsConstants.Queries.INSERT_RICH_TEXT_FIELD,richTxtFldParams);
    		queries.add(batch2);
    	}		
	}
	public void saveDateField(DateField field, Document document, List<QueryBatch> queries)
    {
    	Map<String,Object> fldParams = new HashMap<String, Object>();
    	TemplateField templateField = field.getTemplateField();
    	Integer fieldId;
    	fieldId = field.getId();
    	if(fieldId == null || fieldId == 0){
    	fieldId = getKeyForFields(MyFormsConstants.Tables.FLD);
    	}
    	if(fieldId!= null){
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_ID, fieldId);
    	}
    	fldParams.put(MyFormsConstants.ParamsName.TEMPLATE_FIELD_ID,templateField.getFieldId());
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_VALUE,field.getFieldValue());
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_TYPE,MyFormsConstants.FieldType.DATE);
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_UPDATED_BY, document.getUpdatedBy().getUserId());
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_UPDATED_ON,document.getUpdatedOn()); 
    	fldParams.put(MyFormsConstants.ParamsName.DOCUMENT_ID,document.getId()); 
    	QueryBatch batch = new QueryBatch(MyFormsConstants.Queries.INSERT_FIELD,fldParams);
    	queries.add(batch);
    }
	public void saveTextField(TextField field, Document document, List<QueryBatch> queries)
    {
    	Map<String,Object> fldParams = new HashMap<String, Object>();
    	TemplateField templateField = field.getTemplateField();
    	Integer fieldId;
    	fieldId = field.getId();
    	if(fieldId == null || fieldId == 0){
    	fieldId = getKeyForFields(MyFormsConstants.Tables.FLD);
    	}
    	if(fieldId!= null){
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_ID, fieldId);
    	}
    	fldParams.put(MyFormsConstants.ParamsName.TEMPLATE_FIELD_ID,templateField.getFieldId());
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_VALUE,field.getFieldValue());
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_TYPE,MyFormsConstants.FieldType.TEXT);
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_UPDATED_BY, document.getUpdatedBy().getUserId());
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_UPDATED_ON,document.getUpdatedOn()); 
    	fldParams.put(MyFormsConstants.ParamsName.DOCUMENT_ID,document.getId()); 
    	QueryBatch batch = new QueryBatch(MyFormsConstants.Queries.INSERT_FIELD,fldParams);
    	queries.add(batch);
    }
	public void saveNumberField(NumberField field, Document document, List<QueryBatch> queries)
    {
    	Map<String,Object> fldParams = new HashMap<String, Object>();
    	TemplateField templateField = field.getTemplateField();
    	Integer fieldId;
    	fieldId = field.getId();
    	if(fieldId == null || fieldId == 0){
    	fieldId = getKeyForFields(MyFormsConstants.Tables.FLD);
    	}
    	if(fieldId!= null){
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_ID, fieldId);
    	}
    	fldParams.put(MyFormsConstants.ParamsName.TEMPLATE_FIELD_ID,templateField.getFieldId());
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_VALUE,field.getFieldValue());
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_TYPE,MyFormsConstants.FieldType.NUMBER);
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_UPDATED_BY, document.getUpdatedBy().getUserId());
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_UPDATED_ON,document.getUpdatedOn()); 
    	fldParams.put(MyFormsConstants.ParamsName.DOCUMENT_ID,document.getId()); 
    	QueryBatch batch = new QueryBatch(MyFormsConstants.Queries.INSERT_FIELD,fldParams);
    	queries.add(batch);
    }
	public void saveListField(ListField field, Document document, List<QueryBatch> queries)
    {
    	Map<String,Object> fldParams = new HashMap<String, Object>();
    	TemplateField templateField = field.getTemplateField();
    	Integer fieldId;
    	fieldId = field.getId();
    	if(fieldId == null || fieldId == 0){
    	fieldId = getKeyForFields(MyFormsConstants.Tables.FLD);
    	}
    	if(fieldId!= null){
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_ID, fieldId);
    	}
    	fldParams.put(MyFormsConstants.ParamsName.TEMPLATE_FIELD_ID,templateField.getFieldId());
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_VALUE,field.getFieldValue());
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_TYPE,MyFormsConstants.FieldType.LIST);
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_UPDATED_BY, document.getUpdatedBy().getUserId());
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_UPDATED_ON,document.getUpdatedOn()); 
    	fldParams.put(MyFormsConstants.ParamsName.DOCUMENT_ID,document.getId()); 
    	QueryBatch batch = new QueryBatch(MyFormsConstants.Queries.INSERT_FIELD,fldParams);
    	queries.add(batch);
    	
    	List<String> values = field.getFieldValues();
    	if(values != null)
    	for(String value : values)
    	{
    		Map<String, Object> listParams = new HashMap<String, Object>();
    		Integer listId = getKeyForListField(MyFormsConstants.Tables.FLD_LST);
    		if(listId != null){
    			listParams.put(MyFormsConstants.ParamsName.FIELD_LIST_ID, listId);
    		}
    		listParams.put(MyFormsConstants.ParamsName.FIELD_LIST_VALUE, value);
    		listParams.put(MyFormsConstants.ParamsName.FIELD_ID, fieldId);
    		QueryBatch batch2 = new QueryBatch(MyFormsConstants.Queries.INSERT_LIST_FIELD,listParams);
    		queries.add(batch2);
    	}
    }
    private int executeBatch(final List<QueryBatch> queries){
        try {
            Integer updateCount = (Integer) getSqlMapClientTemplate().execute( new SqlMapClientCallback() {
                public Object doInSqlMapClient( SqlMapExecutor executor ) throws SQLException {
                    executor.startBatch();
                    
                   for(QueryBatch batch : queries) {
                        executor.insert( batch.getQueryName(), batch.getQueryParams() );
                    }
                    return new Integer( executor.executeBatch() );	
                }
            });
            return updateCount.intValue();
            }
        catch (Exception e ) {
            return -1;
        }
    }
    private Integer getKeyForDocument(String table) {
		return keyGenerator.generateKey(table);
	}

	private Integer getKeyForFields(String table) {
		return keyGenerator.generateKey(table);
	}
	private Integer getKeyForListField(String table)
    {
    	return keyGenerator.generateKey(table);
    }
	private Integer getKeyForRichTextField(String table) {
		return keyGenerator.generateKey(table);
	}
    public int updateDocument(Document document) throws ConcurrentUpdateException{
    	List<QueryBatch> queries = new ArrayList<QueryBatch>();
    	Integer updated = 0;
    	if(document.isDirty()){    		
    		if(isConcurrentUpdate(document)){
    			throw new ConcurrentUpdateException();
    		}
    		document.setUpdatedBy(MyFormProperties.getInstance().getCurrentUser());
    		document.setUpdatedOn(new Timestamp(System.currentTimeMillis()));
    		updated = (Integer)getSqlMapClientTemplate().update(MyFormsConstants.Queries.UPDATE_DOCUMENT, document); 
    		
    		if(updated == 0){
    			throw new DocumentUpdateException();
    		}
    		
    		updateFields(document, queries);
    	}
    	return 0;
    }
    private void updateFields(Document document, List<QueryBatch> queries) {
			addDeleteQuesries(document,queries);
			executeBatch(queries);
			queries.clear();
			saveFields(document, queries);
			executeBatch(queries);
	}

	private void addDeleteQuesries(Document document, List<QueryBatch> queries) {
		Map<String, Object> rtmap = new HashMap<String, Object>();
		rtmap.put(MyFormsConstants.ParamsName.DOCUMENT_ID, document.getId());
		rtmap.put(MyFormsConstants.ParamsName.FIELD_TYPE, MyFormsConstants.FieldType.RICH_TEXT);
		QueryBatch query1 = new QueryBatch(MyFormsConstants.Queries.DELETE_FIELDS_RICH_TEXT_FIELD,rtmap);
		
		Map<String, Object> lfmap = new HashMap<String, Object>();
		lfmap.put(MyFormsConstants.ParamsName.DOCUMENT_ID, document.getId());
		lfmap.put(MyFormsConstants.ParamsName.FIELD_TYPE, MyFormsConstants.FieldType.LIST);
		QueryBatch query2 = new QueryBatch(MyFormsConstants.Queries.DELETE_FIELDS_LIST,lfmap);
		
		lfmap = new HashMap<String, Object>();
		lfmap.put(MyFormsConstants.ParamsName.DOCUMENT_ID, document.getId());
		lfmap.put(MyFormsConstants.ParamsName.FIELD_TYPE, MyFormsConstants.FieldType.CHECKBOX);
		QueryBatch query3 = new QueryBatch("fld.deleteBooleanValues",lfmap);

		lfmap = new HashMap<String, Object>();
		lfmap.put(MyFormsConstants.ParamsName.DOCUMENT_ID, document.getId());
		lfmap.put(MyFormsConstants.ParamsName.FIELD_TYPE, MyFormsConstants.FieldType.RADIO);
		QueryBatch query4 = new QueryBatch("fld.deleteBooleanValues",lfmap);

		
		queries.add(query1);
		queries.add(query2);
		queries.add(query3);
		queries.add(query4);
		queries.add(new QueryBatch(MyFormsConstants.Queries.DELETE_FIELDS,document.getId()));
	}

	public boolean isConcurrentUpdate(Document document){
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put(MyFormsConstants.ParamsName.DOCUMENT_ID, document.getId());
    	map.put(MyFormsConstants.ParamsName.LAST_UPDT_TS, document.getUpdatedOn());
    	Integer updated = (Integer)getSqlMapClientTemplate().queryForObject(MyFormsConstants.Queries.CONCURRENT_DOCUMENT_UPDATE, map);    	
    	return updated == 1;
    }
	
	public void saveBooleanField(BooleanField field, Document document, List<QueryBatch> queries)
    {
    	Map<String,Object> fldParams = new HashMap<String, Object>();
    	TemplateField templateField = field.getTemplateField();
    	Integer fieldId;
    	fieldId = field.getId();
    	if(fieldId == null || fieldId == 0){
    	fieldId = getKeyForFields(MyFormsConstants.Tables.FLD);
    	}
    	if(fieldId!= null){
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_ID, fieldId);
    	}
    	field.setId(fieldId);
    	fldParams.put(MyFormsConstants.ParamsName.TEMPLATE_FIELD_ID,templateField.getFieldId());
    	if(field.getBooleanValue() != null && field.getBooleanValue())
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_VALUE,field.getFieldValue());
    	else
    		fldParams.put(MyFormsConstants.ParamsName.FIELD_VALUE,null);
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_TYPE,field.getFieldType());
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_UPDATED_BY, document.getUpdatedBy().getUserId());
    	fldParams.put(MyFormsConstants.ParamsName.FIELD_UPDATED_ON,document.getUpdatedOn()); 
    	fldParams.put(MyFormsConstants.ParamsName.DOCUMENT_ID,document.getId()); 
    	QueryBatch batch = new QueryBatch(MyFormsConstants.Queries.INSERT_FIELD,fldParams);
    	queries.add(batch);
    	if(field.getBooleanValue() != null && field.getBooleanValue())
    	addBooleanValues(queries, field);
    }
	/**
	 * 
	 * @param queries
	 * @param field
	 */
	private void addBooleanValues(List<QueryBatch> queries, BooleanField field) {
		if(!CollectionUtils.isEmpty(field.getSelectedValues())){
			for(BooleanSelectedValue value : field.getSelectedValues()){
				if(value.getSelected() !=null && value.getSelected()){
					value.setId(keyGenerator.generateKey(MyFormsConstants.Tables.SELECTED_BOOLEAN_VALUE).longValue());
					value.setFieldId(field.getId().longValue());
					QueryBatch batch = new QueryBatch("fld.insertBooleanSelectedValues",value);
			    	queries.add(batch);
				}
			}
		}		
	}

	public KeyGenerator getKeyGenerator() {
		return keyGenerator;
	}

	public void setKeyGenerator(KeyGenerator keyGenerator) {
		this.keyGenerator = keyGenerator;
	}
}
