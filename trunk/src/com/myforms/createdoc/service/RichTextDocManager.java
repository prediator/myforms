package com.myforms.createdoc.service;

import com.myforms.createdoc.RichTextDoc;
import com.myforms.exception.runtimeexception.RichTextDocValidationException;
import com.myforms.field.RichTextField;

public interface RichTextDocManager {
public void updateRichTextDoc(RichTextDoc richTextDoc);
public RichTextDoc getRichTextDoc(RichTextDoc richTextDoc);
public void getRichTextDocListByDocumentId(Integer documentId);
public void saveRichTextDoc(RichTextDoc richTextDoc) throws RichTextDocValidationException;
}
