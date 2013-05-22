package com.myforms.usergroup.dao;

import java.util.List;

import org.myform.keygen.dao.KeyGenerator;
import org.myform.keygen.dao.KeyGeneratorAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.myforms.client.Client;
import com.myforms.constants.MyFormsConstants;
import com.myforms.usergroup.model.Role;
import com.myforms.usergroup.model.User;

public class UserGroupDaoIBatis  extends SqlMapClientDaoSupport  implements UserGroupDao, KeyGeneratorAware{
	@Autowired(required=true)
	private KeyGenerator keyGenerator;
	public User getUserById(Long userId) {
		return (User)getSqlMapClientTemplate().queryForObject("User.getUserById", userId);
	}

	public User getUserByUsername(String username) {
		return (User)getSqlMapClientTemplate().queryForObject("User.getUserByUsername", username);
	}
	public List<Role> getAllRoles() {
		return (List<Role>)getSqlMapClientTemplate().queryForList("User.getAllRoles");
	}
	public void saveClient(Client client) {
		client.setClientId(new Long(keyGenerator.generateKey(MyFormsConstants.Tables.CLIENT)));
		getSqlMapClientTemplate().insert("clnt.saveClient", client);
	}
	public List<Client> getAllClients(){
		return (List<Client>)getSqlMapClientTemplate().queryForList("clnt.getAllClients");
	}

	public void setKeyGenerator(KeyGenerator keyGenerator) {
		this.keyGenerator =keyGenerator;
	}

	public KeyGenerator getKeyGenerator() {
		return keyGenerator;
	}

	public Client getClientById(Long clientId) {
		return  (Client)getSqlMapClientTemplate().queryForObject("clnt.getClientById", clientId);
	}

	public void saveUser(User user) {
		user.setUserId(keyGenerator.generateKey(MyFormsConstants.Tables.USERS));
		getSqlMapClientTemplate().insert("User.saveUser", user);
	}

	public User getPartialUserByUserName(String username) {
		return (User)getSqlMapClientTemplate().queryForObject("User.getPartialUserByUsername", username);
	}
	
}
