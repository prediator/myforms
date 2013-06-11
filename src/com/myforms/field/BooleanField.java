package com.myforms.field;

public abstract class BooleanField extends  Field {
	private Boolean booleanValue;

	public Boolean getBooleanValue() {
		return booleanValue;
	}

	public void setBooleanValue(Boolean booleanValue) {
		this.booleanValue = booleanValue;
	}
}
