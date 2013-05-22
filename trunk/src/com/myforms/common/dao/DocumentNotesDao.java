package com.myforms.common.dao;

import java.util.List;

import com.myforms.common.Notes;

public interface DocumentNotesDao {
	   public List<Notes> getNotesByDocumentId(Long documentid);
	   public void saveNotes(Notes notes);
}
