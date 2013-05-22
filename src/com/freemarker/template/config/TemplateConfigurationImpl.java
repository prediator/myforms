package com.freemarker.template.config;

import java.io.File;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class TemplateConfigurationImpl implements TemplateConfiguration {
	Configuration cfg = null;
	Template template = null;
	
	public Configuration getCfg() {
		return cfg;
	}
	public void setCfg(Configuration cfg) {
		this.cfg = cfg;
	}
	public Template getTemplate() {
		return template;
	}
	public void setTemplate(Template template) {
		this.template = template;
	}
	@Override
	public void execute(){
		
		 Template temp = null;
		try {
			temp = cfg.getTemplate("test.ftl");
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	        /* Create a data-model */
	        Map root = new HashMap();
	        root.put("user", "Big Joe");
	        Map latest = new HashMap();
	        root.put("latestProduct", latest);
	        latest.put("url", "products/greenmouse.html");
	        latest.put("name", "green mouse");

	        /* Merge data-model with template */
	        Writer out = new OutputStreamWriter(System.out);
	        try {
				temp.process(root, out);
			} catch (TemplateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        try {
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        template = temp;

	}
	@Override
	public void setup() throws IOException {
		try{
			 cfg = new Configuration();
	        cfg.setDirectoryForTemplateLoading(
	                new File("c:/templates"));
	        cfg.setObjectWrapper(new DefaultObjectWrapper());
		}catch (IOException e) {
			throw e;
		}
		
	}
	
	public static void main(String[] args) {
		TemplateConfigurationImpl tm =new TemplateConfigurationImpl();
		try {
			tm.setup();
			tm.execute();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
