package com.myforms.usergroup.service;

import java.util.List;

import com.myforms.anonymous.ClientSetupInfo;
import com.myforms.anonymous.ClientStatus;
import com.myforms.client.Client;
import com.myforms.exception.CryptographyException;
import com.myforms.usergroup.model.Role;
import com.myforms.usergroup.model.User;
import com.myforms.usergroup.model.UserBean;
/**
 * 
 * @author Mohd Irshad
 * Service class for user and groups
 */
public interface UserGroupService {
	public User getUserById(Long userId);
	public User getUserByUsername(String username);
	public void saveClient(Client client);
	public List<Client> getAllClients();
	public List<Role> getAllRoles();
	public Client getClientById(Long clientId);
	public void saveUser(User user, UserBean userBean);
	public User getPartialUserByUserName(String username);
	public void saveAnonymousClientSetupInfo(ClientSetupInfo clientSetupInfo);
	public List<ClientSetupInfo> getAllAnonymousClientSetupInfo();
	public void updateClientStatus(ClientStatus clientStatus, List<ClientSetupInfo> clientSetupInfos, List<Long> list) throws CryptographyException;
	public List<ClientSetupInfo> geAnonymousClientSetupInfos(List<Long> list);
	public User createUser(Client client, ClientSetupInfo clientSetupInfo) throws CryptographyException;
}
