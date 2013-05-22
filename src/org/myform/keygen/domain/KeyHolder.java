package org.myform.keygen.domain;

public class KeyHolder {
	private Integer keyId;
	private String tableName;
	private Integer start;
	private Integer max;
	private Integer safeVal;
	private Integer nextValue;
	public Integer getKeyId() {
		return keyId;
	}
	public void setKeyId(Integer keyId) {
		this.keyId = keyId;
	}
	public Integer getMax() {
		return max;
	}
	public void setMax(Integer max) {
		this.max = max;
	}
	public Integer getSafeVal() {
		return safeVal;
	}
	public void setSafeVal(Integer safeVal) {
		this.safeVal = safeVal;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public Integer getNextValue() {
		return nextValue;
	}
	public void setNextValue(Integer nextValue) {
		this.nextValue = nextValue;
	}

}
