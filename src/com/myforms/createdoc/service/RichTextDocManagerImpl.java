package com.myforms.createdoc.service;

import java.util.Date;
import java.util.List;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.myforms.constants.MyFormsConstants;
import com.myforms.createdoc.RichTextDoc;
import com.myforms.createdoc.dao.RichTextDocDao;
import com.myforms.createdoc.validator.RTDocValidator;
import com.myforms.exception.runtimeexception.DocumentNotFoundException;
import com.myforms.exception.runtimeexception.Message;
import com.myforms.exception.runtimeexception.RichTextDocValidationException;
import com.myforms.field.RichTextField;
import com.myforms.template.config.model.Template;
import com.myforms.util.MyFormProperties;
import com.myforms.util.MyFormsUtils;
import com.myforms.web.model.Document;

public class RichTextDocManagerImpl implements RichTextDocManager{
	private RichTextDocDao richTextDocDao;
	private RTDocValidator rTDocValidator;
	public RichTextDocDao getRichTextDocDao() {
		return richTextDocDao;
	}

	public void setRichTextDocDao(RichTextDocDao richTextDocDao) {
		this.richTextDocDao = richTextDocDao;
	}

	public RichTextDoc getRichTextDoc(RichTextDoc richTextDoc) {
		return richTextDocDao.getRichTextDoc(richTextDoc);	
	}

	public void getRichTextDocListByDocumentId(Integer documentId) {
		// TODO Auto-generated method stub
		
	}

	public void saveRichTextDoc(RichTextDoc richTextDoc) throws RichTextDocValidationException{
		rTDocValidator.validate(richTextDoc);
		richTextDoc.setCreatedOn(new Date(System.currentTimeMillis()));
		richTextDoc.setCreatedBy(MyFormProperties.getInstance().getCurrentUser());
		richTextDoc.setDataList(MyFormsUtils.convertToDataList(richTextDoc.getRichText()));
		richTextDocDao.saveRichTextDoc(richTextDoc);
		
	}

	public void updateRichTextDoc(RichTextDoc richTextDoc) {
		// TODO Auto-generated method stub
		
	}

	public RTDocValidator getRTDocValidator() {
		return rTDocValidator;
	}

	public void setRTDocValidator(RTDocValidator docValidator) {
		rTDocValidator = docValidator;
	}
}
