package org.myform.menu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.myforms.constants.MyFormsConstants;
import com.myforms.menu.Menu;
import com.myforms.menu.service.MenuServiceManager;
import com.myforms.usergroup.model.User;
import com.myforms.util.MyFormProperties;

public class MenuProcessorInterceptor extends HandlerInterceptorAdapter{
	private MenuServiceManager menuServiceManager;
@Override
public void postHandle(HttpServletRequest req, HttpServletResponse res, Object object, ModelAndView modelAndView) throws Exception {
	if(modelAndView != null){
	String groupName = (String)modelAndView.getModel().get(MyFormsConstants.PageGroup.KEY);
	if(StringUtils.hasLength(groupName)){
		Menu menu = menuServiceManager.getMenuByGroup(groupName);
		modelAndView.getModel().put(MyFormsConstants.PageGroup.MENU, menu);
	}
	User user = MyFormProperties.getInstance().getCurrentUser();
	
	if(user != null){
	modelAndView.getModel().put(MyFormsConstants.NAME, user.getName());
	String clientName = user.getClient().getClientName() + "/" + user.getClient().getClientId();
	modelAndView.getModel().put(MyFormsConstants.CLIENT, clientName);
	}
	
	}
	super.postHandle(req, res, object, modelAndView);
}
public MenuServiceManager getMenuServiceManager() {
	return menuServiceManager;
}
public void setMenuServiceManager(MenuServiceManager menuServiceManager) {
	this.menuServiceManager = menuServiceManager;
}
}
