package com.myforms.common.service;

import java.util.List;

import com.myforms.common.Notes;

public interface DocumentNotesServiceManager {
   public List<Notes> getNotesByDocumentId(Long documentid);
   public void saveNotes(Notes notes);
}
