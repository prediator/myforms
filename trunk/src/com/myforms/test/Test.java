package com.myforms.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.myforms.document.service.SaveUpdateDocumentServiceManager;

public class Test {
	  public static void main(String[] args) {
	    ApplicationContext ctx = new ClassPathXmlApplicationContext("../../../WEB-INF/applicationContext.xml");
	    SaveUpdateDocumentServiceManager myService = (SaveUpdateDocumentServiceManager)ctx.getBean("interceptedService");
	    myService.saveDocument(null);
	  }
	}