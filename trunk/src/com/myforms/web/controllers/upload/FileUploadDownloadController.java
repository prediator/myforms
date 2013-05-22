package com.myforms.web.controllers.upload;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.myforms.constants.MyFormsConstants;
import com.myforms.upload.FileUploadInfo;
import com.myforms.upload.UploadItem;
import com.myforms.upload.service.FileUploadDownloadServiceManager;
import com.myforms.util.MyFormProperties;
import com.myforms.util.MyFormsUtils;
import com.myforms.util.PropertyEditor;
import com.myforms.web.model.Document;

@Controller
public class FileUploadDownloadController implements ServletContextAware {
	private ServletContext servletContext;	
	@Autowired
	private FileUploadDownloadServiceManager fileUploadDownloadServiceManager;
	
	@RequestMapping(value = "/viewFiles.html")
	public ModelAndView view(Model model, HttpServletRequest request){	
		request.getParameter(MyFormsConstants.DocumentConstants.DOCUMENT_ID);
		UploadItem uploadItem=new UploadItem();
		uploadItem.setDocumentId(ServletRequestUtils.getIntParameter(request, MyFormsConstants.DocumentConstants.DOCUMENT_ID,0));
		model.addAttribute(uploadItem);
		return new ModelAndView("common/fileUpload","files" ,"");
	}
	@RequestMapping(value = "/upload.html",method=RequestMethod.POST)
	@ResponseBody
	public String upload(Model model, HttpServletRequest request, HttpServletResponse response, UploadItem uploadItem){	
		    JSONArray array = new JSONArray();
		    FileUploadInfo fileUploadInfo = new FileUploadInfo();
			fileUploadInfo.setFileName(uploadItem.getFile().getOriginalFilename());
			String fileName = System.currentTimeMillis() +"_"+ uploadItem.getDocumentId() + fileUploadInfo.getFileName().substring(fileUploadInfo.getFileName().lastIndexOf("."),fileUploadInfo.getFileName().length());

			String location = MyFormsUtils.getFilePath(uploadItem.getDocumentId(), MyFormProperties.getInstance().getCurrentUser());
			uploadFile(uploadItem.getFile(),location,fileName);
		
			Document document = new Document();
			document.setId(uploadItem.getDocumentId());
			fileUploadInfo.setDocument(document);
			fileUploadInfo.setLocation(location+fileName);
			fileUploadInfo.setUploadDate(new Date());
			fileUploadInfo.setUploadedBy(MyFormProperties.getInstance().getCurrentUser());
			getFileUploadDownloadServiceManager().saveUploadInfo(fileUploadInfo);
			
		JSONObject object = new JSONObject();
		object.put("name", uploadItem.getFile().getOriginalFilename());
		object.put("type", "image/jpeg");
		object.put("size", uploadItem.getFile().getBytes().length);
		object.put("delete_url", "deleteUploadedDocument.html?documentId="+uploadItem.getDocumentId() + "&itemId="+fileUploadInfo.getId());
		object.put("delete_type","DELETE");
		object.put("thumbnail_url", "showFile.html?fn="+fileName+"&documentId="+uploadItem.getDocumentId());
		
		array.add(object);
		//model.addAttribute(array.toString());
		return array.toString();
	}
	
	@RequestMapping(value = "/upload.html",method=RequestMethod.GET)
	@ResponseBody
	public String upload(HttpServletResponse response, UploadItem uploadItem){	
		return prepareUploadedFilesData(uploadItem);		
	}

	@RequestMapping(value = "/download.html")
	public String download(@RequestParam("id") Long id,@RequestParam("docId") Integer docId,HttpServletResponse response) throws IOException{	
		if(id !=null && docId !=null){
			FileUploadInfo uploadInfo =  new FileUploadInfo();
			Document document = new Document();
			document.setId(docId);
			uploadInfo.setId(id);
			uploadInfo.setDocument(document);
			uploadInfo = getFileUploadDownloadServiceManager().getUploadedItemsByItemInfo(uploadInfo);
			File file = new File(uploadInfo.getLocation());
			response.setHeader("Content-Disposition", "attachment; filename=\"" + uploadInfo.getFileName() + "\"" );
			OutputStream out = response.getOutputStream();
			FileInputStream io = new FileInputStream(file);
			IOUtils.copy(io,out);
			out.flush();
			out.close();
			out = null;
			io = null;
		}
		//return new ModelAndView("common/fileUpload","files" ,"");
		return null;
	}
	
	@RequestMapping(value = "/showFile.html")
	public void writeFile(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String fileName = MyFormsUtils.getFilePath(ServletRequestUtils.getIntParameter(request,
				MyFormsConstants.DocumentConstants.DOCUMENT_ID,0), MyFormProperties.getInstance().getCurrentUser())
				+ServletRequestUtils.getStringParameter(request,"fn","");
		String mimeType = servletContext.getMimeType(fileName);
		if (mimeType.startsWith("image")) {	
			response.setHeader( "Content-Disposition", "attachment; filename=\"" + ServletRequestUtils.getStringParameter(request,"fn","") + "\"" );		}
		else {
			fileName = PropertyEditor.getInstance().getProperty(MyFormsConstants.SystemProperties.FILE_UPLOAD_DEFAULT_ICON);
			response.setHeader( "Content-Disposition", "attachment; filename=\"" + "default.jpg" + "\"" );	
			mimeType = "image/jpg";
		}
		response.setContentType(mimeType);
		BufferedImage img = new BufferedImage(80, 50, BufferedImage.TYPE_INT_RGB);
		img.createGraphics().drawImage(ImageIO.read(new File(fileName)).getScaledInstance(80, 50, Image.SCALE_SMOOTH),0,0,null);
		ImageIO.write(img, "jpg", response.getOutputStream());

		
		/*OutputStream outputStream = response.getOutputStream();
		FileInputStream inputStream = new FileInputStream(new File(fileName));
		int maxFileSize = Integer.valueOf(PropertyEditor.getInstance().getProperty(MyFormsConstants.SystemProperties.MAX_FILE_SIZE));
		byte[] buffer = new byte[maxFileSize];
		int readBytes = 0;
		while ((readBytes = inputStream.read(buffer, 0, maxFileSize)) != -1) {
            outputStream.write(buffer, 0, readBytes);
      }*/
	}
	private void uploadFile(CommonsMultipartFile file,String location, String fileName){
		try {
	           InputStream inputStream = null;
	           OutputStream outputStream = null;
	           if (file.getSize() > 0) {
	                  inputStream = file.getInputStream();
	                  File ufile = new File(location);
	                  if(!ufile.exists()){
	                	  ufile.mkdirs();
	                  }
	                  outputStream = new FileOutputStream(location + fileName);
	                  int readBytes = 0;
	                  int maxFileSize = Integer.valueOf(PropertyEditor.getInstance().getProperty(MyFormsConstants.SystemProperties.MAX_FILE_SIZE));
	                  byte[] buffer = new byte[maxFileSize];
	                  while ((readBytes = inputStream.read(buffer, 0, maxFileSize)) != -1) {
	                         outputStream.write(buffer, 0, readBytes);
	                   }
	                  outputStream.close();
	                  inputStream.close();
	                }           
	          } catch (Exception e) {
	                 e.printStackTrace();
	          }

	}

	private String prepareUploadedFilesData(UploadItem uploadItem) {
		 List<FileUploadInfo> files  = fileUploadDownloadServiceManager.getUploadedItemsByDocumentId(uploadItem.getDocumentId().longValue());
		 JSONArray array = new JSONArray();
		 if(!CollectionUtils.isEmpty(files)){
			for(FileUploadInfo info : files){
				JSONObject object = new JSONObject();
				object.put("name", info.getFileName());
				String mimeType = servletContext.getMimeType(info.getFileName());
				object.put("type", mimeType);
				File ufile = new File(info.getLocation());
				object.put("size", ufile.length());				
				object.put("delete_url", "deleteUploadedDocument.html?documentId="+uploadItem.getDocumentId() + "&itemId="+info.getId());
				object.put("delete_type","DELETE");
				object.put("thumbnail_url", "showFile.html?fn="+ufile.getName()+"&documentId=" + uploadItem.getDocumentId());
				
				array.add(object);
			}
		}
		return array.toString();		
	}
	
	@RequestMapping(value="/deleteUploadedDocument.html")
	@ResponseBody
	public String deleteUploadedDocument(HttpServletResponse response,@RequestParam("itemId") Long itemId,UploadItem uploadItem){
		FileUploadInfo uploadInfo =  new FileUploadInfo();
		if(uploadItem.getDocumentId()!=null){
		Document document = new Document();
		document.setId(uploadItem.getDocumentId());
		uploadInfo.setDocument(document);
		}
		if(itemId!=null)
		uploadInfo.setId(itemId);
		if(uploadInfo.getDocument()!=null && uploadInfo.getDocument().getId()!=null && uploadInfo.getId()!=null){
			uploadInfo = getFileUploadDownloadServiceManager().getUploadedItemsByItemInfo(uploadInfo);
			Integer count = getFileUploadDownloadServiceManager().deleteUploadedDocument(uploadInfo);
			if(count>0){
				String filePath = uploadInfo.getLocation();
				if(!StringUtils.isEmpty(filePath)){
					File file = new File(filePath);
					file.delete();
				}
			}
			
		}
		return prepareUploadedFilesData(uploadItem);
	}
	
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	public FileUploadDownloadServiceManager getFileUploadDownloadServiceManager() {
		return fileUploadDownloadServiceManager;
	}
	public void setFileUploadDownloadServiceManager(
			FileUploadDownloadServiceManager fileUploadDownloadServiceManager) {
		this.fileUploadDownloadServiceManager = fileUploadDownloadServiceManager;
	}
	
	
}
