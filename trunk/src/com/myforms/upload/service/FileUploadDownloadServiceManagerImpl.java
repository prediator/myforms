package com.myforms.upload.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.myforms.upload.FileUploadInfo;
import com.myforms.upload.dao.FileUploadDownloadDao;

public class FileUploadDownloadServiceManagerImpl implements
		FileUploadDownloadServiceManager {
	
    @Autowired
	private FileUploadDownloadDao fileUploadDownloadDao;
	
	public void saveUploadInfo(FileUploadInfo fileUploadInfo) {
		// TODO Auto-generated method stub
		getFileUploadDownloadDao().saveUploadInfo(fileUploadInfo);

	}

	public FileUploadDownloadDao getFileUploadDownloadDao() {
		return fileUploadDownloadDao;
	}

	public void setFileUploadDownloadDao(FileUploadDownloadDao fileUploadDownloadDao) {
		this.fileUploadDownloadDao = fileUploadDownloadDao;
	}

	@Override
	public List<FileUploadInfo> getUploadedItemsByDocumentId(Long documentId) {
		// TODO Auto-generated method stub
		return getFileUploadDownloadDao().getUploadedItemsByDocumentId(documentId);
	}

	@Override
	public FileUploadInfo getUploadedItemsByItemInfo(FileUploadInfo uploadInfo) {
		// TODO Auto-generated method stub
		return getFileUploadDownloadDao().getUploadedItemsByItemInfo(uploadInfo);
	}

	@Override
	public Integer deleteUploadedDocument(FileUploadInfo fileUploadInfo) {
		// TODO Auto-generated method stub
		return getFileUploadDownloadDao().deleteUploadedDocument(fileUploadInfo);
	}
	
	

}
