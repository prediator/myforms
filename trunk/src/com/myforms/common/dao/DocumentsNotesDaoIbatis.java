package com.myforms.common.dao;

import java.util.List;

import org.myform.keygen.dao.KeyGenerator;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.myforms.common.Notes;
import com.myforms.constants.MyFormsConstants;

public class DocumentsNotesDaoIbatis extends SqlMapClientDaoSupport implements DocumentNotesDao{

	private KeyGenerator keyGenerator;
	
	@Override
	public List<Notes> getNotesByDocumentId(Long documentid) {
		// TODO Auto-generated method stub
		return (List<Notes>)getSqlMapClientTemplate().queryForList(MyFormsConstants.Queries.GET_NOTES_BY_DOCUMENT_ID, documentid);
	}

	@Override
	public void saveNotes(Notes notes) {
		// TODO Auto-generated method stub
		Long id = getKeyGenerator().generateKey(MyFormsConstants.Tables.DOC_NOTES).longValue();
		notes.setId(id);
		getSqlMapClientTemplate().insert(MyFormsConstants.Queries.SAVE_NOTES, notes);
	}

	public KeyGenerator getKeyGenerator() {
		return keyGenerator;
	}

	public void setKeyGenerator(KeyGenerator keyGenerator) {
		this.keyGenerator = keyGenerator;
	}
	
	

}
