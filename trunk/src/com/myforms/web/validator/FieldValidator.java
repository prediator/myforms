package com.myforms.web.validator;

import java.util.List;

import org.springframework.validation.Errors;

import com.myforms.field.Field;
import com.myforms.web.model.Document;

public interface FieldValidator {
public void validate(List<Field> fields, Document document, Errors errors);
}
