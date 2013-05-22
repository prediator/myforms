package com.myforms.usergroup.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.util.CollectionUtils;

import com.myforms.client.Client;
import com.myforms.constants.MyFormsConstants;
import com.myforms.racf.AccessType;
import com.myforms.racf.Racf;
import com.myforms.racf.service.RacfService;
import com.myforms.usergroup.dao.UserGroupDao;
import com.myforms.usergroup.model.Role;
import com.myforms.usergroup.model.User;
import com.myforms.usergroup.model.UserBean;

public class UserGroupServiceImpl implements UserGroupService {
	
	@Autowired(required = true)
	private UserGroupDao userGroupDao;
	private RacfService racfService;
	
	public User getUserById(Long userId) {
		return userGroupDao.getUserById(userId);
	}
	public void saveClient(Client client) {
		userGroupDao.saveClient(client);
	}
	public List<Client> getAllClients()
	{
		return userGroupDao.getAllClients();
	}
	@Required
	public User getUserByUsername(String username) {
		return userGroupDao.getUserByUsername(username);
	}

	public UserGroupDao getUserGroupDao() {
		return userGroupDao;
	}

	public void setUserGroupDao(UserGroupDao userGroupDao) {
		this.userGroupDao = userGroupDao;
	}
	public List<Role> getAllRoles() {
		return userGroupDao.getAllRoles();
	}
	public Client getClientById(Long clientId) {
		return userGroupDao.getClientById(clientId);
	}
	public void saveUser(User user, UserBean userBean) {
		userGroupDao.saveUser(user);
		List<String> racfNodes = createRacfNode(userBean, user);
		Racf racf = createRacfProfile(racfNodes, user, userBean);
		racfService.saveRacf(racf);
	}
	public User getPartialUserByUserName(String username) {
		return userGroupDao.getPartialUserByUserName(username);
	}
	public RacfService getRacfService() {
		return racfService;
	}
	public void setRacfService(RacfService racfService) {
		this.racfService = racfService;
	}
	private List<String> createRacfNode(UserBean userBean, User u){
		AccessType accessType= racfService.getAccessTypeByName(MyFormsConstants.CLIENT_ACCESS_NODE);
		List<String> fullAccess = new ArrayList<String>();
		List<String> nodes = new ArrayList<String>();
		if(!CollectionUtils.isEmpty(userBean.getAccessNodes())){
			StringBuffer rootNode = new StringBuffer(MyFormsConstants.RacfConstants.ROOT );
			rootNode.append(MyFormsConstants.RacfConstants.VALUE_SEPARATOR);
			rootNode.append(u.getClient().getClientId());
			rootNode.append(MyFormsConstants.RacfConstants.NODE_SEPARATOR );
			if(userBean.getAccessNodes().contains(accessType.getAccessId())){
				rootNode.append(MyFormsConstants.RacfConstants.FULL_ACCESS);
				nodes.add(rootNode.toString());
				return nodes;
			}
			rootNode.append(MyFormsConstants.RacfConstants.TEMPLATE_NODE);
			rootNode.append(MyFormsConstants.RacfConstants.NODE_SEPARATOR);
			if (userBean.getAccessNodes().contains(accessType.getAccessTypes().get(0).getAccessId())){				
				rootNode.append(MyFormsConstants.RacfConstants.FULL_ACCESS);
				nodes.add(rootNode.toString());
				return nodes;
			}
			else{
				for(String val: userBean.getAccessNodes()){
					if(val.contains(MyFormsConstants.RacfConstants.NODE_SEPARATOR)){
						nodes.add(rootNode.toString() + val);
					}
				}
			}
		}
		return nodes;
	}
	private Racf createRacfProfile(List<String> racfNodes, User user,UserBean userBean) {
		Racf racf = new Racf();
		racf.setRacfNodes(racfNodes);
		racf.setUser(user);
		Role role = new Role();
		role.setRoleId(Long.valueOf(userBean.getRole()));
		racf.setUserRoles(Arrays.asList(new Role[]{role}));
		return racf;
	}
}
