package com.myforms.web.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.myforms.common.Notes;
import com.myforms.common.service.DocumentNotesServiceManager;
import com.myforms.constants.MyFormsConstants;
import com.myforms.util.MyFormProperties;
import com.myforms.web.model.Document;


@Controller
public class DocumentNotesController {
	
	@Autowired
	private DocumentNotesServiceManager documentNotesServiceManager;
	
	@RequestMapping(value = "/notes.html")
	public ModelAndView viewDocumentNotes(Model model, HttpServletRequest request){	
		String docId = request.getParameter(MyFormsConstants.DocumentConstants.DOCUMENT_ID);
		if(!StringUtils.isEmpty(docId)){
			List<Notes> notes = new ArrayList<Notes>();
			notes = getDocumentNotesServiceManager().getNotesByDocumentId(Long.parseLong(docId));
			model.addAttribute("documentNotes",notes);
		}
		return new ModelAndView("common/notes", "notes","");
	}
	
	@RequestMapping(value = "/addNotes.html")
	public ModelAndView addDocumentNotes(Model model, HttpServletRequest request,Notes note){	
		String docId = request.getParameter(MyFormsConstants.DocumentConstants.DOCUMENT_ID);
		if(!StringUtils.isEmpty(docId)){
			Document document = new Document();
			document.setId(Integer.parseInt(docId));
			note.setDocument(document);
			note.setCreatedOn(new Date(System.currentTimeMillis()));
			note.setUser(MyFormProperties.getInstance().getCurrentUser());
			getDocumentNotesServiceManager().saveNotes(note);
			List<Notes> notes = new ArrayList<Notes>();
			notes = getDocumentNotesServiceManager().getNotesByDocumentId(Long.parseLong(docId));
			model.addAttribute("documentNotes",notes);
		}
		return new ModelAndView("common/notes", "notes","");
	}

	public DocumentNotesServiceManager getDocumentNotesServiceManager() {
		return documentNotesServiceManager;
	}

	public void setDocumentNotesServiceManager(
			DocumentNotesServiceManager documentNotesServiceManager) {
		this.documentNotesServiceManager = documentNotesServiceManager;
	}

	

}
