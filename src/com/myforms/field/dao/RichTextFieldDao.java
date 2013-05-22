package com.myforms.field.dao;

import com.myforms.createdoc.RichTextDoc;
import com.myforms.field.RichTextField;

public interface RichTextFieldDao {
public void saveRichTextField(RichTextField richTextField);
public void updateRichTextField(RichTextField richTextField);
public void getRichTextField(RichTextField richTextField);
public void saveRichTextDoc(RichTextDoc richTextDoc);
}
