package com.myforms.web.validator;

public class TextFieldValidator extends AbstractFieldValidator {
private static TextFieldValidator textFieldValidator;
static{
	textFieldValidator = new TextFieldValidator();
}
private TextFieldValidator(){}
public static TextFieldValidator getInstance(){
	return textFieldValidator;
}
}
