package org.myform.fcondition.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.myform.fcondition.process.ConditionUtil;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.myforms.constants.MyFormsConstants;
import com.myforms.logging.MyFormsLogger;
import com.myforms.web.model.Document;

public class ConditionProcessorInterceptor extends HandlerInterceptorAdapter {
@Override
public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView model) throws Exception {
	MyFormsLogger.getLogger().info("Adding conditions");
	if(model != null){
		Document document = (Document)model.getModel().get(MyFormsConstants.DocumentConstants.DOCUMENT);
		if(document != null)
			ConditionUtil.processConditions(document);
		model.getModel().put(MyFormsConstants.DocumentConstants.DOCUMENT,document);
	}
	
	super.postHandle(arg0, arg1, arg2, model);
	MyFormsLogger.getLogger().debug("Conditions Added");
	MyFormsLogger.getLogger().info("Conditions Added");
}
}
