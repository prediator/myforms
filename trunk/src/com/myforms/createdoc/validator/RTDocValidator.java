package com.myforms.createdoc.validator;

import com.myforms.createdoc.RichTextDoc;
import com.myforms.exception.runtimeexception.RichTextDocValidationException;

public interface RTDocValidator {
public void validate(RichTextDoc richTextDoc) throws RichTextDocValidationException;
}
