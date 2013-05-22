package com.myforms.createdoc.validator;

import org.apache.commons.lang.StringUtils;

import com.myforms.createdoc.RichTextDoc;
import com.myforms.exception.runtimeexception.RichTextDocValidationException;

public class RTDocValidatorImpl implements RTDocValidator{

	public void validate(RichTextDoc richTextDoc) throws RichTextDocValidationException {
		if(StringUtils.isEmpty(richTextDoc.getTitle())){
			throw new RichTextDocValidationException("Title field is required.");
		}		
	}

}
