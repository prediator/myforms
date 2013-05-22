package com.myforms.template.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.myform.keygen.dao.KeyGenerator;
import org.springframework.util.CollectionUtils;

import com.myforms.constants.MyFormsConstants;
import com.myforms.field.Field;
import com.myforms.field.FieldEnum;
import com.myforms.field.FieldFactory;
import com.myforms.field.List;
import com.myforms.field.config.model.FieldType;
import com.myforms.field.config.model.TemplateField;
import com.myforms.logging.MyFormsLogger;
import com.myforms.template.config.model.Template;
import com.myforms.template.config.model.TemplateColumnMetaData;
import com.myforms.template.config.model.TemplateMetaData;
import com.myforms.template.config.model.TemplateRowMetaData;
import com.myforms.util.MyFormProperties;
import com.myforms.util.MyFormsUtils;
import com.myforms.util.PropertyEditor;

public class TemplateDTOImpl implements TemplateDTO {
	private KeyGenerator keyGenerator;
	public Template transferToTemplate(TemplateMetaData templateMetaData) {
		Template template = new Template();
		template.setTemplateId(keyGenerator.generateKey(MyFormsConstants.Tables.TMPL));
		Template parentTemplate = null;
		template.setDescription(templateMetaData.getDescription());
		template.setCreatedBy(MyFormProperties.getInstance().getCurrentUser());
		template.setCreateDocEnabled(templateMetaData.getCreateDocEnabled()==null?false:true);
		template.setCreatedOn(new Timestamp(System.currentTimeMillis()));
		template.setIsAbstract(templateMetaData.getIsAbstarct()== null ?false:true);
		template.setIsCommon(false);
		template.setIsEnable(templateMetaData.getIsEnabled());
		
		if(templateMetaData.getParentTemplateId()!= null && templateMetaData.getParentTemplateId() != 0){
			parentTemplate = new Template();
			parentTemplate.setTemplateId(templateMetaData.getParentTemplateId());
		}
		template.setParentTemplate(parentTemplate);
		template.setTemplateName(templateMetaData.getTemplateName());
		template.setTemplateTitle(templateMetaData.getTemplateName());
		template.setUploadDocEnabled(templateMetaData.getUploadDocEnabled()==null?false:true);
		template.setVersion(PropertyEditor.getInstance().getProperty(MyFormsConstants.VERSION));
		template.setTemplateFieldMap(prepareFieldMap(templateMetaData, template));
		prepareRenderXml(template, templateMetaData);
		template.setVersion(MyFormsConstants.VERSION);
		return template;
	}
	private Map<String, TemplateField> prepareFieldMap(TemplateMetaData templateMetaData,Template template){
		Map<String, TemplateField> fieldMap =  new HashMap<String, TemplateField>();
		if(!CollectionUtils.isEmpty(templateMetaData.getRowMetaData())){
			for(TemplateRowMetaData rowMetaData : templateMetaData.getRowMetaData()){
				if(!CollectionUtils.isEmpty(rowMetaData.getColumnMetaData())){
					for(TemplateColumnMetaData columnMetaData : rowMetaData.getColumnMetaData()){
						MyFormsLogger.getLogger().info(this.getClass(),"prepareFieldMap",columnMetaData.getFieldProperties().toString());
						String fldName = prepareTemplateField(columnMetaData.getFieldProperties(),fieldMap, template);
						columnMetaData.getFieldProperties().put(MyFormsConstants.TemplateConstants.FIELD_NAME, fldName);
					}
				}
			}
		}
		
		return fieldMap;
	}
	private String prepareTemplateField(Map<String, String> fieldProperties, Map<String, TemplateField> fieldMap, Template template) {
		TemplateField templateField = new TemplateField();
		templateField.setTemplate(template);
		templateField.setCreatedOn(new Timestamp(System.currentTimeMillis()));
		templateField.setCreatedBy(MyFormProperties.getInstance().getCurrentUser());
		templateField.setFieldId(keyGenerator.generateKey(MyFormsConstants.Tables.TMPL_FLD));
		
		FieldType fieldType = new FieldType();
		fieldType.setFieldType(fieldProperties.get(MyFormsConstants.TemplateConstants.TYPE));
		fieldType.setFieldTypeId(FieldEnum.getFieldEnum(fieldType.getFieldType()).getId());
		templateField.setFieldType(fieldType);
		
		templateField.setDefaultValue(fieldProperties.get(MyFormsConstants.TemplateConstants.DEFAULT));
		templateField.setIsRequired(StringUtils.isEmpty(fieldProperties.get(MyFormsConstants.TemplateConstants.REQUIRED) )? 
				false : Boolean.valueOf(fieldProperties.get(MyFormsConstants.TemplateConstants.REQUIRED).trim()));
		templateField.setIsEnabled(StringUtils.isEmpty(fieldProperties.get(MyFormsConstants.TemplateConstants.ENABLED) )? 
				false : Boolean.valueOf(fieldProperties.get(MyFormsConstants.TemplateConstants.ENABLED).trim()));
		templateField.setIsVisible(StringUtils.isEmpty(fieldProperties.get(MyFormsConstants.TemplateConstants.VISISBLE) )? 
				false : Boolean.valueOf(fieldProperties.get(MyFormsConstants.TemplateConstants.VISISBLE).trim()));
		templateField.setFieldTitle(fieldProperties.get(MyFormsConstants.TemplateConstants.LABEL));
		templateField.setFieldHeltText(fieldProperties.get(MyFormsConstants.TemplateConstants.HELP_TEXT));
		templateField.setFieldLegth(0);
		templateField.setVersion(MyFormsConstants.VERSION);
		
		if(MyFormsConstants.FieldType.LIST.equalsIgnoreCase(templateField.getFieldType().getFieldType())){
			String selectedList = fieldProperties.get(MyFormsConstants.TemplateConstants.SELECTED_LIST);
			if(!StringUtils.isEmpty(selectedList)){
				String[] list = selectedList.split(MyFormsConstants.FIELD_LIST_SEPARATOR);
				if(list.length == 2){
					Long id = Long.valueOf(list[1].trim());
					List tList = new List();
					tList.setId(id);
					templateField.setList(tList);
				}
			}
		}
		
		templateField.setFieldName(getFieldName(templateField.getFieldTitle(),templateField.getFieldId()));
		fieldMap.put(templateField.getFieldName(), templateField);
		return templateField.getFieldName();
	}
	private String getFieldName(String fieldTitle, Integer id) {
		if(!StringUtils.isEmpty(fieldTitle)){
			fieldTitle = fieldTitle.toUpperCase().replace(" ", "_");
			fieldTitle = fieldTitle + "_" +id.toString();
			return fieldTitle;
		}
		else{
			throw new RuntimeException("Invalid Field Data");
		}
		//return null;
	}
	
	private void prepareRenderXml(Template template, TemplateMetaData templateMetaData){
		Document ftlOutput = DocumentHelper.createDocument();
        Element rootElement = ftlOutput.addElement("sections");
        Element section = rootElement.addElement("section");
        section.addAttribute("name", "common");
        section.addAttribute("title", "General Section");
        int rowNum = 0;
        int colNum = 0;
        Element tr = null;
        for(TemplateRowMetaData rowMetaData : templateMetaData.getRowMetaData()){
			if(!CollectionUtils.isEmpty(rowMetaData.getColumnMetaData())){
				for(TemplateColumnMetaData columnMetaData : rowMetaData.getColumnMetaData()){
					String fldType = columnMetaData.getFieldProperties().get(MyFormsConstants.TemplateConstants.TYPE);
					if(colNum == 3 || colNum == 0 || MyFormsConstants.FieldType.RICH_TEXT.equals(fldType)){
						tr = addTrTdElements(section,"tr",0,0);
						rowNum++;
						colNum = 0;
					}
					Element td = addTrTdElements(tr,"td",
							 Integer.valueOf(columnMetaData.getFieldProperties().get(MyFormsConstants.TemplateConstants.ROW_SPAN)),
									 Integer.valueOf(columnMetaData.getFieldProperties().get(MyFormsConstants.TemplateConstants.COL_SPAN)));
					Element fld = td.addElement("FIELD");
					fld.addAttribute("NAME",columnMetaData.getFieldProperties().get(MyFormsConstants.TemplateConstants.FIELD_NAME));
					colNum++;
					if(colNum == 3){
						colNum = 0;
						rowNum ++;
					}
					
					
				}
			}
		}
        template.setRenderXml(rootElement.asXML());
	}
	private Element addTrTdElements(Element root, String tag, int colspan,int rowspan){
		Element element = root.addElement(tag) ;
		if(MyFormsConstants.TemplateXMLConstants.TD.equalsIgnoreCase(tag))
		{
			if(colspan >0 )
			element.addAttribute(MyFormsConstants.TemplateXMLConstants.COLSPAN, colspan+"");
			if(rowspan >0 )
			element.addAttribute(MyFormsConstants.TemplateXMLConstants.ROWSPAN, rowspan+"");
		}
		return element;
	}
	public KeyGenerator getKeyGenerator() {
		return keyGenerator;
	}
	public void setKeyGenerator(KeyGenerator keyGenerator) {
		this.keyGenerator = keyGenerator;
	}

}
