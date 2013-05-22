package com.myforms.menu.dao;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.myforms.constants.MyFormsConstants;
import com.myforms.menu.Menu;

public class MenuDaoIBatis extends SqlMapClientDaoSupport implements MenuDao {

	public Menu getMenuByGroup(String groupName) {
		// TODO Auto-generated method stub
		return (Menu)getSqlMapClientTemplate().queryForObject(MyFormsConstants.Queries.GET_MENU,groupName);
	}

}
