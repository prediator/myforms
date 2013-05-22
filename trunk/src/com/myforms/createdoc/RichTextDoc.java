package com.myforms.createdoc;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.util.CollectionUtils;

import com.myforms.usergroup.model.User;

public class RichTextDoc {
	private Long richTextDocId;
	private Long documentId;
	private String title;
	private String richText;
	private User createdBy;
	private Date createdOn;
	private List<String> dataList;
	public User getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(User createdBy) {
		this.createdBy = createdBy;
	}
	public Date getCreatedOn() {
		return createdOn;
	}
	public void setCreatedOn(Date createdOn) {
		this.createdOn = createdOn;
	}
	public Long getDocumentId() {
		return documentId;
	}
	public void setDocumentId(Long documentId) {
		this.documentId = documentId;
	}
	public String getRichText() {
		if(StringUtils.isEmpty(richText) && !CollectionUtils.isEmpty(dataList)){
			StringBuilder builder = new StringBuilder();
			for(String txt : dataList){
				builder.append(txt);
			}
			richText = builder.toString();
		}
		return richText;
	}
	public void setRichText(String richText) {
		this.richText = richText;
	}
	public Long getRichTextDocId() {
		return richTextDocId;
	}
	public void setRichTextDocId(Long richTextDocId) {
		this.richTextDocId = richTextDocId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<String> getDataList() {
		return dataList;
	}
	public void setDataList(List<String> dataList) {
		if(StringUtils.isEmpty(richText) && !CollectionUtils.isEmpty(dataList)){
			StringBuilder builder = new StringBuilder();
			for(String txt : dataList){
				builder.append(txt);
			}
			richText = builder.toString();
		}
		this.dataList = dataList;
	}

}
