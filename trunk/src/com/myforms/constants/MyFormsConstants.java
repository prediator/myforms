package com.myforms.constants;

import java.util.HashMap;
import java.util.Map;


public interface MyFormsConstants {
public String VERSION = "0.0.0.1";
public String TEMPLATE_PATH = "template/";

public String CURRENT_USER_KEY = "currentuser";
public String NAME = "user_name";
public String CLIENT = "client";
public String LIST_VAL_SEPARATOR = ",";
public String FILE_SEPARATOR = "/";
public int MAX_COLS = 3;
public String EMPTY_SRING = "";
public String FIELD_LIST_SEPARATOR = "~";
public String NA = "N/A";
	public interface TemplateXMLConstants
	{
	   public String ROOT_ELEMENT_NAME = "sections";
	   public String SECTION_ELEMENT_NAME = "section";
	   public String TD = "td";
	   public String TR="tr";
	   public String ATTRIB_SEC_NAME = "name";
	   public String ATTRIB_SEC_TITLE = "title";
	   public String DIV = "div";
	   public String PATH_TO_SECTION = "//section";
	   public String ELEMENT_FIELD = "field";
	   public String ATTRIB_FIELD_NAME = "name";
	   public String FTL_FIELD_TAG = "@documentRenderEditMode.renderField";
	   public String ATTRIB_FTL_FIELD = "fieldName";
	   public String COLSPAN = "colspan";
	   public String ROWSPAN = "rowspan";
	   public String FTL_SAVE_PATH ="ftlSavePath";
	   public String XML_REGX = "<\\?xml.*\\?>(\\n)*";
	   public String FTL_PATH = "WEB-INF/classes/com/myforms/template/ftl";
	   public String FTL_COPY_PATH ="ftlCommonPath";
	   public String CLASS = "class";
	   public String CLASS_NAME = "main_table";
	   public String UPLOAD_DOWNLOAD_DOCUMENT = "<@documentRenderEditMode.renderUplodaDownloadDoc document/>";
	}
	public interface FileExtensions
	{
		String FTL = ".ftl";
	}
	public interface SystemProperties
	{
		public String XML_PATH = "java.util.xmlpath";
		public String ENVIROMENT = "java.env";
		public String ATTRIB_KEY = "key";
		public String ATTRIB_ENV = "env";
		public String UPLOAD_LOCATION  = "myform.upload.location";
		public String MAX_FILE_SIZE = "myform.upload.filesize";
		public String FILE_UPLOAD_DEFAULT_ICON = "myform.upload_icon.default";
	}
	public interface FieldType{
		public String TEXT = "TXT";
		public String LIST = "LIST";
		public String RADIO = "RADIO";
		public String CHECKBOX = "CHKBOX";
		public String FILE = "FILE";
		public String LABEL = "LBL";
		public String PASSWORD = "PSWD";
		public String RICH_TEXT = "RICHTXT";
		public String DATE = "DT";
		public String NUMBER = "NUM";
	}
	public Map<String, String> HtmlFieldType = new HashMap<String, String>(){{
		put(MyFormsConstants.FieldType.TEXT, "text");
		put(MyFormsConstants.FieldType.LIST, "select");
		put(MyFormsConstants.FieldType.RADIO, "radio");
		put(MyFormsConstants.FieldType.CHECKBOX, "checkbox");
		put(MyFormsConstants.FieldType.LABEL, "label");
		put(MyFormsConstants.FieldType.PASSWORD, "text");
		put(MyFormsConstants.FieldType.RICH_TEXT, "textarea");
		put(MyFormsConstants.FieldType.DATE, "text");
		put(MyFormsConstants.FieldType.NUMBER, "text");
	}};
	public interface FieldId{
		public int TEXT = 1;
		public int LIST = 2;
		public int RADIO = 3;
		public int CHECKBOX = 4;
		public int FILE = 5;
		public int LABEL = 6;
		public int PASSWORD = 7;
		public int RICH_TEXT = 7;
		public int DATE = 8;
	}
	public interface DocumentConstants
	{
		public String DOCUMENT = "document";
		public String DOCUMENT_ID = "documentId";
		public String TEMPLATE_ID = "templateId";
		public String DISPLAY_ID = "documentId";
	}
	public interface ExceptionMsg{
		public String INVALID_PROP_EXCEPTION = "Invalid Exception";
		public String INVALID_ENV_MESG = "Environment is not set for the property. Please set java.env property at start up";
		public String INVALID_TEMPLATE_MSG = "Template is invalid";
		public String INVALID_BATCH_PARAM_EXCEPTION = "Invalid argument for batch query";
		public String DOCUMENT_NOT_FOUND = "Document with display id {0} Not Found!! <br/> Please Report error to system admin.<br/>Thanks";
		public String DOCUMENT_CONCURRENT_UPDATE_EXCEPTION = "Document has been update by some other user!!";
		public String DOCUMENT_UPDATE_EXCEPTION = "Some problem occured while updating the document.<br/>Please try later.";

	}
	public interface ParamsName{
		public String TEMPLATE_FIELD_ID = "templateFieldId";
		public String FIELD_ID = "fieldId";
		public String FIELD_TYPE = "fieldType";
		public String FIELD_VALUE = "fieldValue";
		public String FIELD_UPDATED_ON = "updatedOn";
		public String FIELD_UPDATED_BY = "updatedBy";
		public String FIELD_LIST_ID = "fieldListId";
		public String FIELD_LIST_VALUE = "fieldListValue";
		public String DOCUMENT_ID = "documentId";
		public String RICH_TEXT_FLD_ID = "richTextId";
		public String RICH_TEXT = "richText";
		public String SEQUENCE = "sequence";
		public String LAST_UPDT_TS = "lastUptTimeStampp";
		public String NEW_VALUE = "newValue";
		public String TABLE_NAME = "tableName";
		public String RICH_TEXT_DOC_ID = "richTextDocId";
		public String RICH_TEXT_ID = "richTextId";
		
		public String CLNT_TMPL_ID = "clientTmplId";
		public String CLNT_ID = "clientId";
		public String TEMPLATE_ID = "templateId";
	}
	public interface Queries{
		public String INSERT_FIELD = "fld.saveField";
		public String INSERT_LIST_FIELD = "fld.saveListField";
		public String INSERT_RICH_TEXT_FIELD = "fld.saveRichTextField";
		public String INSERT_DOCUMENT = "document.saveDocument";
		public String CONCURRENT_DOCUMENT_UPDATE = "document.isConcurrentUpdate";
		public String UPDATE_DOCUMENT = "document.updateDocument";
		public String DELETE_FIELDS = "fld.deleteFieldByDocId";
		public String DELETE_FIELDS_LIST = "fld.deleteFieldListByDocId";
		public String DELETE_FIELDS_RICH_TEXT_FIELD = "fld.deleteRTFieldByDocId";	
		public String GET_KEY_GEN = "key.getKeyGenByTablename";
		public String UPT_KEY_GEN = "key.updateKeygen";
		public String GET_MENU = "menu.getMenuByGroup";
		public String IS_DISPLAY_ID_EXIST = "document.isDisplayIdExist";
		public String INSERT_UPLOAD_INFO = "uploadInfo.saveUploadedInfo";
		public String GET_UPLOADED_ITEM = "uploadInfo.getUploadedItemsByDocumentId";
		public String GET_UPLOADED_ITEM_BY_ITEM = "uploadInfo.getUploadedItemsByItemInfo";
		public String DELETE_UPLOADED_DOCUMENT= "uploadInfo.deleteUploadedDocument";
		public String SAVE_RT_DOC = "rtDoc.saveRichTextDoc";
		public String SAVE_RT_DOC_DATA = "rtDoc.saveRichTextDocData";
		public String GET_NOTES_BY_DOCUMENT_ID = "notes.getNotesByDocumentId";
		public String SAVE_NOTES = "notes.saveNotes";
		public String DELETE_RT_DOC_DATA = "rtDoc.deleteRichTextDocDataByRTId";
		public String  GET_RT_DOC = "rtDoc.getRichTextDocById";
		public String GET_LIST_FOR_USER = "list.getListByListUserId";
		public String SAVE_LIST = "list.saveList";
		public String SAVE_LIST_VAL = "list.saveListValue";
		public String SAVE_TEMPLATE = "template.saveTemplate";
		public String SAVE_CLNT_TMPL = "template.saveClientTemplate";
		public String SAVE_TEMPLATE_FLD = "templateField.saveTemplateField";
	}
	public interface JsonFieldNames{

		public String CELL = "cell";
		public String ROWS = "rows";
		public String PAGE = "page";
		public String TOTAL = "total";
		public interface Template {
			public String TEMPLATE_ID = "templateId";
			public String TEMPLATE_NAME = "templateName";
			public String TEMPLATE_TITLE = "templateTitle";
			public String TEMPLATE_DESCRIPTION = "description";
		}
		public interface Document {
			public String DOCUMENT_ID = "documentId";
			public String TEMPLATE_NAME = "templateName";
			public String DOCUMENT_TITLE = "title";
			public String CREATED_BY = "createdBy";
			public String CREATED_ON = "createdOn";
		}
	}
	public interface HashConstants{
		public int FIRST_PRIME = 17;
		public int SECOND_PRIME = 33;
		public  Map<String, Integer> FIELD_IDS = new HashMap<String, Integer>(){
			{
				put(MyFormsConstants.FieldType.TEXT, 1);
				put(MyFormsConstants.FieldType.LIST, 2);
				put(MyFormsConstants.FieldType.RADIO, 3);
				put(MyFormsConstants.FieldType.CHECKBOX, 4);
				put(MyFormsConstants.FieldType.FILE,5);
				put(MyFormsConstants.FieldType.PASSWORD, 7);
				put(MyFormsConstants.FieldType.RICH_TEXT, 7);
				put(MyFormsConstants.FieldType.DATE, 9);
			}
		};

	}
	
	public interface Conditions{
		String OP_EQUAL = "EQ";
		String OP_NOT_EQUAL = "NOTEQ";
		String VIS_DISPLAY = "DISPLAY";
		String VIS_NONE = "NONE";
		public Map<String, String> operators = new HashMap<String, String>(){{
			put(OP_EQUAL,"==");
			put(OP_NOT_EQUAL,"!=");
		}};
	}
	public interface ConditionType{
		String VISIBILTY = "DISPLAY";
		String REQUIRED = "REQUIRED";
	}
	public interface Boolean{
		String TRUE = "TRUE";
		String FALSE = "FALSE";
		String AND = "&&";
		String OR = "||";
	}
	public interface Tables {
		public String DOC = "tran_doc";
		public String FLD = "tran_fld";
		public String FLD_LST="tran_fld_list";
		public String  RICH_TXT ="tran_rich_txt";
		public String UPLOAD_INFO = "upld_doc";
		public String RTEXT = "rtxt";
		public String DOC_RTEXT = "doc_rtxt";
		public String DOC_NOTES = "doc_notes";		
		public String TMPL = "tmpl";
		public String TMPL_FLD = "fld";
		public String LIST = "list";
		public String LIST_VAL = "list_val";
		public String CLNT_TMPL = "clnt_tmpl";
		public String CLIENT = "clnt";
		public String USERS = "users";
		public String USER_ROLES = "user_roles";
		public String USER_ACCESS = "user_access";
		public String USER_ACCESS_NODE = "user_acc_node";
	}
	public interface PageGroup{
		String KEY = "MENU_GROUP_KEY";
		String MENU = "myFormsMenu";
		String HOME = "home";
		String TEMPLATE = "template";
		String CREATE_UPDATE_TEMPLATE = "cutemplate";
	}
	public interface ERROR_CODE{
		int TITLE_REQUIRED = -1000000001;
	}
	public interface TemplateConstants{
		public String VISISBLE = "visible";
		public String ENABLED = "ebalbled";
		public String ROW_SPAN = "rsan";
		public String LABEL = "label";
		public String TYPE = "type";
		public String REQUIRED = "required";
		public String DEFAULT = "defaultValue";
		public String COL_SPAN = "csan";
		public String HELP_TEXT = "helpText";
		public String SELECTED_LIST = "selectedList";
		public String FIELD_NAME = "fldName";
	}
	public interface RacfConstants{
		String NODE_SEPARATOR=".";
		String VALUE_SEPARATOR ="-";
		String CLIENT_NODE = "CLIENT";
		String TEMPLATE_NODE = "TEMPLATE";
		String ROOT = "RACF"+NODE_SEPARATOR + CLIENT_NODE;	
		String FULL_ACCESS = "*";
		String READ_ACCESS = "R";
		String EDIT_ACCESS = "E";		
		Map<String, String> ACCESS_MAP= new HashMap<String, String>(){
			{
				put("Read", READ_ACCESS);
				put("Edit", EDIT_ACCESS);
			}	
		};
	}
	public String DATE_FORMAT = "MM/dd/yyyy";
	public int RT_DATA_LENTGH = 999;
	public String CLIENT_ACCESS_NODE = "Client";
}
