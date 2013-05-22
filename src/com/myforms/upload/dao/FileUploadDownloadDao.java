package com.myforms.upload.dao;

import java.util.List;

import com.myforms.upload.FileUploadInfo;

public interface FileUploadDownloadDao {
	public void saveUploadInfo(FileUploadInfo fileUploadInfo);
	public List<FileUploadInfo> getUploadedItemsByDocumentId(Long documentId);
	public FileUploadInfo getUploadedItemsByItemInfo(FileUploadInfo uploadInfo);
	public Integer deleteUploadedDocument(FileUploadInfo fileUploadInfo);

}
