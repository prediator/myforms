package com.myforms.web.conditions;

import java.util.Map;

import com.myforms.field.Field;
import com.myforms.web.model.Document;

public interface ProcessConditions {
public void processConditions(Map<String,Field> fields, Document document);
}
