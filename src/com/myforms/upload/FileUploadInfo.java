package com.myforms.upload;

import java.util.Date;

import com.myforms.usergroup.model.User;
import com.myforms.web.model.Document;

public class FileUploadInfo {
private Long id;
private Document document;
private String fileName;
private Date uploadDate;
private User uploadedBy;
private String location;
public Document getDocument() {
	return document;
}
public void setDocument(Document document) {
	this.document = document;
}
public String getFileName() {
	return fileName;
}
public void setFileName(String fileName) {
	this.fileName = fileName;
}
public Long getId() {
	return id;
}
public void setId(Long id) {
	this.id = id;
}
public String getLocation() {
	return location;
}
public void setLocation(String location) {
	this.location = location;
}
public Date getUploadDate() {
	return uploadDate;
}
public void setUploadDate(Date uploadDate) {
	this.uploadDate = uploadDate;
}
public User getUploadedBy() {
	return uploadedBy;
}
public void setUploadedBy(User uploadedBy) {
	this.uploadedBy = uploadedBy;
}

}
