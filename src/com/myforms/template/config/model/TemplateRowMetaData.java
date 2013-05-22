package com.myforms.template.config.model;

import java.util.List;

public class TemplateRowMetaData {
private List<TemplateColumnMetaData> columnMetaData;

public List<TemplateColumnMetaData> getColumnMetaData() {
	return columnMetaData;
}

public void setColumnMetaData(List<TemplateColumnMetaData> columnMetaData) {
	this.columnMetaData = columnMetaData;
}


}
