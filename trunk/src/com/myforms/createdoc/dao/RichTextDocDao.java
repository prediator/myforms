package com.myforms.createdoc.dao;

import com.myforms.createdoc.RichTextDoc;
import com.myforms.field.RichTextField;

public interface RichTextDocDao {
public void updateRichTextDoc(RichTextDoc richTextDoc);
public RichTextDoc getRichTextDoc(RichTextDoc richTextDoc);
public void getRichTextDocListByDocumentId(Integer documentId);
public void saveRichTextDoc(RichTextDoc richTextDoc);
}
