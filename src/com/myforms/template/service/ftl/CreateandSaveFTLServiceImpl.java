package com.myforms.template.service.ftl;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.myforms.constants.MyFormsConstants;
import com.myforms.template.config.model.Template;
import com.myforms.util.MyFormProperties;
import com.myforms.util.PropertyEditor;

public class CreateandSaveFTLServiceImpl implements CreateandSaveFTLService {

	private static String editImport = "<#import \"../common/documentRenderEditMode.ftl\" as documentRenderEditMode>";
	private static String header = "<#include \"../common/header.ftl\">";
	private static String footer = "<#include \"../common/footer.ftl\">";

	public void createFTLFromTemplate(Template template) throws DocumentException, IOException{
		Document document = createDocument(template.getRenderXml());
		Element ftlRootElement = createFtlOutputDocument();
	    Document ftlOutputDocument = ftlRootElement.getDocument();
	    ftlOutputDocument.asXML();
	    Iterator<Element> sectionList = document.selectNodes(MyFormsConstants.TemplateXMLConstants.PATH_TO_SECTION).iterator();
	    while(sectionList.hasNext())
	    {
	    	Element section = sectionList.next();
	    	addSectionToFtl(section,ftlRootElement);
	    	
	    	List<Element> trs = section.elements();
	    	for(Element tr : trs)
	    	{
	    		Element trElement= addTrTdElements(ftlRootElement,MyFormsConstants.TemplateXMLConstants.TR,0,0);
	    		List<Element> tds = tr.elements();
	    		//to add remaing cols in the tr
	    		int totalColSpan = 0;
	    		for(Element td :tds)
	    		{
	    			String cspan = td.attributeValue(MyFormsConstants.TemplateXMLConstants.COLSPAN);
	    			String rspan = td.attributeValue(MyFormsConstants.TemplateXMLConstants.ROWSPAN);
	    			totalColSpan = Integer.parseInt(cspan.trim()) + totalColSpan;
	    			int colspan = (cspan != null && !"".equals(cspan))?Integer.parseInt(cspan):0;
	    			int rowspan = (rspan != null && !"".equals(rspan))?Integer.parseInt(rspan):0;
	    			Element tdElement= addTrTdElements(trElement,MyFormsConstants.TemplateXMLConstants.TD,colspan,rowspan);
                    addFieldElementToTD(tdElement,td);
	    		}
	    		totalColSpan = MyFormsConstants.MAX_COLS-totalColSpan;
	    		for(int i=0;i<totalColSpan;i++){
	    			Element emptyTdElement= addTrTdElements(trElement,MyFormsConstants.TemplateXMLConstants.TD,1,1);	    			
	    		}
	    	}
	    	
	    }
	    writeXMLtoFTL(ftlOutputDocument.asXML(),template.getTemplateId().toString(),template);
	    
	}

	

	private void addFieldElementToTD(Element target, Element source) {
		List<Element> fields = source.elements();
		for(Element field :fields)
		{
		   Element ftlField =	target.addElement(MyFormsConstants.TemplateXMLConstants.FTL_FIELD_TAG);
		   Iterator<Attribute> attributes = field.attributes().iterator();
			
			while (attributes.hasNext()) {
				Attribute attribute = (Attribute) attributes.next();				
				ftlField.addAttribute(MyFormsConstants.TemplateXMLConstants.ATTRIB_FTL_FIELD,attribute.getText());			
			}
		}
		
	}

	private void addSectionToFtl(Element section, Element ftlRootElement) {
		Element tr=addTrTdElements(ftlRootElement,MyFormsConstants.TemplateXMLConstants.TR,0,0);
		Element td = addTrTdElements(tr,MyFormsConstants.TemplateXMLConstants.TD,3,0);
		Element div = td.addElement(MyFormsConstants.TemplateXMLConstants.DIV);
		
		Iterator<Attribute> attributes = section.attributes().iterator();
		
		while (attributes.hasNext()) {
			Attribute attribute = (Attribute) attributes.next();
			if(!MyFormsConstants.TemplateXMLConstants.ATTRIB_SEC_TITLE.equalsIgnoreCase(attribute.getName()))
			{
				div.addAttribute(attribute.getName(), attribute.getText());
			}
			else {
				div.setText(attribute.getText());
			}
			
		}
		
	}
	private Element addTrTdElements(Element root, String tag, int colspan,int rowspan){
		Element element = root.addElement(tag) ;
		if(MyFormsConstants.TemplateXMLConstants.TD.equalsIgnoreCase(tag))
		{
			if(colspan >0 )
			element.addAttribute(MyFormsConstants.TemplateXMLConstants.COLSPAN, colspan+"");
			if(rowspan >0 )
			element.addAttribute(MyFormsConstants.TemplateXMLConstants.ROWSPAN, rowspan+"");
		}
		return element;
	}
	public void createFTLFromTemplateList(
			Collection<Template> templateCollection) throws DocumentException, IOException{
	   for(Template template : templateCollection)
		   createFTLFromTemplate(template);

	}
    private Document createDocument(String xmlString) throws DocumentException
    {
    	Document document = DocumentHelper.parseText(xmlString);
    	return document;
    }
    private Element createFtlOutputDocument()
    {
    	  Document ftlOutput = DocumentHelper.createDocument();
          Element rootElement = ftlOutput.addElement("table");
          rootElement.addAttribute("cellspacing", "10");
          rootElement.addAttribute(MyFormsConstants.TemplateXMLConstants.CLASS, MyFormsConstants.TemplateXMLConstants.CLASS_NAME);
          return rootElement;
    }
    private void writeXMLtoFTL(String xml,String filename, Template template) throws IOException {
		Pattern pattern = Pattern.compile(MyFormsConstants.TemplateXMLConstants.XML_REGX);
		Matcher matcher = pattern.matcher(xml);
		xml = matcher.replaceFirst("");
		xml = editImport +xml;
		if(template.getUploadDocEnabled()){
			//xml = xml + MyFormsConstants.TemplateXMLConstants.UPLOAD_DOWNLOAD_DOCUMENT;
		}
		xml =  header + xml + footer; 
		String filePath = PropertyEditor.getInstance().getProperty(MyFormsConstants.TemplateXMLConstants.FTL_SAVE_PATH )+ 
							filename + MyFormsConstants.FileExtensions.FTL;
		File file = new File(filePath);
		if(file.exists())
			file.delete();
		BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(file));
		bufferedWriter.write(xml);
		bufferedWriter.flush();
		bufferedWriter.close();
		
	}



	public void copyCommonFTLs(String rootPath) throws IOException {
		String complerePath = rootPath + MyFormsConstants.TemplateXMLConstants.FTL_PATH;
		File src = new File(complerePath);
		File dest = new File(PropertyEditor.getInstance().getProperty(MyFormsConstants.TemplateXMLConstants.FTL_COPY_PATH).toString());
		copyDirectory(src, dest);
	}
	public void copyDirectory(File srcPath, File dstPath) throws IOException{
		if (srcPath.isDirectory())
		{
			if (!dstPath.exists())
			{
				dstPath.mkdir();
			}

			String files[] = srcPath.list();
			for(int i = 0; i < files.length; i++)
			{
				copyDirectory(new File(srcPath, files[i]), new File(dstPath, files[i]));
			}
		}
		else
		{
			if(!srcPath.exists())
			{
				throw new IOException();
			}
			else
			{
				InputStream in = new FileInputStream(srcPath);
		        OutputStream out = new FileOutputStream(dstPath);
    
				// Transfer bytes from in to out
		        byte[] buf = new byte[1024];
				int len;
		        while ((len = in.read(buf)) > 0) {
					out.write(buf, 0, len);
				}
				in.close();
		        out.close();
			}
		}
		
	}
}
