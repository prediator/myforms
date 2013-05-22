package com.myforms.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.myforms.common.Notes;
import com.myforms.common.dao.DocumentNotesDao;

public class DocumentNotesServiceManagerImpl implements DocumentNotesServiceManager {

	@Autowired
	private DocumentNotesDao notesDao;
	
	@Override
	public List<Notes> getNotesByDocumentId(Long documentid) {
		// TODO Auto-generated method stub
		return getNotesDao().getNotesByDocumentId(documentid);
	}

	@Override
	public void saveNotes(Notes notes) {
		// TODO Auto-generated method stub
		getNotesDao().saveNotes(notes);
		
	}

	public DocumentNotesDao getNotesDao() {
		return notesDao;
	}

	public void setNotesDao(DocumentNotesDao notesDao) {
		this.notesDao = notesDao;
	}	

}
