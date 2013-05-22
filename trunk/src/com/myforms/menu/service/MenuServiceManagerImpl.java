package com.myforms.menu.service;

import com.myforms.menu.Menu;
import com.myforms.menu.dao.MenuDao;

public class MenuServiceManagerImpl implements MenuServiceManager {
private MenuDao menuDao;
	public Menu getMenuByGroup(String groupName) {
		return menuDao.getMenuByGroup(groupName);
	}
	public MenuDao getMenuDao() {
		return menuDao;
	}
	public void setMenuDao(MenuDao menuDao) {
		this.menuDao = menuDao;
	}

}
