package com.myforms.usergroup.dao;

import java.util.List;

import com.myforms.client.Client;
import com.myforms.usergroup.model.Role;
import com.myforms.usergroup.model.User;

public interface UserGroupDao {
	public User getUserById(Long userId);
	public User getUserByUsername(String username);
	public void saveClient(Client client);
	public List<Client> getAllClients();
	public List<Role> getAllRoles();
	public Client getClientById(Long clientId);
	public void saveUser(User user);
	public User getPartialUserByUserName(String username);
}
