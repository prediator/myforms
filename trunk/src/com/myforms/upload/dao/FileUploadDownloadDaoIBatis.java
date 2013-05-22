package com.myforms.upload.dao;

import java.util.List;

import org.myform.keygen.dao.KeyGenerator;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.myforms.constants.MyFormsConstants;
import com.myforms.upload.FileUploadInfo;

public class FileUploadDownloadDaoIBatis extends SqlMapClientDaoSupport implements FileUploadDownloadDao {

	private KeyGenerator keyGenerator;
	
	public KeyGenerator getKeyGenerator() {
		return keyGenerator;
	}

	public void setKeyGenerator(KeyGenerator keyGenerator) {
		this.keyGenerator = keyGenerator;
	}

	public void saveUploadInfo(FileUploadInfo fileUploadInfo) {
		Long uploadId = getKeyGenerator().generateKey(MyFormsConstants.Tables.UPLOAD_INFO).longValue();
		fileUploadInfo.setId(uploadId);
		getSqlMapClientTemplate().insert(MyFormsConstants.Queries.INSERT_UPLOAD_INFO, fileUploadInfo);
	}
	
	public List<FileUploadInfo> getUploadedItemsByDocumentId(Long documentId){
		return (List<FileUploadInfo>)getSqlMapClientTemplate().queryForList(MyFormsConstants.Queries.GET_UPLOADED_ITEM,documentId);
	}

	@Override
	public FileUploadInfo getUploadedItemsByItemInfo(FileUploadInfo uploadInfo) {
		// TODO Auto-generated method stub
		return (FileUploadInfo)getSqlMapClientTemplate().queryForObject(MyFormsConstants.Queries.GET_UPLOADED_ITEM_BY_ITEM, uploadInfo);
	}

	@Override
	public Integer deleteUploadedDocument(FileUploadInfo fileUploadInfo) {
		// TODO Auto-generated method stub
		return (Integer)getSqlMapClientTemplate().delete(MyFormsConstants.Queries.DELETE_UPLOADED_DOCUMENT,fileUploadInfo);
	}

}
