package user.service.imple;

import java.util.List;


import pojo.TRole;
import pojo.TRoleMenu;
import pojo.TRoleMenuId;
import user.dao.MenuDAO;
import user.dao.PageModel;
import user.dao.RoleDAO;
import user.dao.RoleMenuDAO;
import user.dao.UserRoleDAO;
import user.service.RoleService;

public class RoleServiceImple implements RoleService{


	private RoleDAO roleDAO;
	private RoleMenuDAO roleMenuDAO;
    private UserRoleDAO userRoleDAO;
    
	public UserRoleDAO getUserRoleDAO() {
		return userRoleDAO;
	}

	public void setUserRoleDAO(UserRoleDAO userRoleDAO) {
		this.userRoleDAO = userRoleDAO;
	}

	public RoleMenuDAO getRoleMenuDAO() {
		return roleMenuDAO;
	}

	public void setRoleMenuDAO(RoleMenuDAO roleMenuDAO) {
		this.roleMenuDAO = roleMenuDAO;
	}

	public RoleDAO getRoleDAO() {
		return roleDAO;
	}

	public void setRoleDAO(RoleDAO roleDAO) {
		this.roleDAO = roleDAO;
	}

	@Override
	public boolean checkRolename(String rolename) {
		return this.roleDAO.checkRolename(rolename);
	}

	@Override
	public void delete(int rid) {
		this.roleDAO.delete(rid);
		this.roleMenuDAO.delete(rid);
	}

	@Override
	public TRole findByRid(int rid) {
		return this.roleDAO.findByRid(rid);
	}

	@Override
	public List findMidByRid(int rid) {
		return this.roleMenuDAO.findMidByRid(rid);
	}

	@Override
	public boolean isUse(int rid) {
		return this.userRoleDAO.isUser(rid);
	}

	@Override
	public List<TRole> query() {
		return this.roleDAO.query();
	}

	@Override
	public void save(TRole role) {
		this.roleDAO.save(role);
		int roleid = this.roleDAO.findMaxRoleId();
		if(role.getMid() != null){
			for (int i = 0; i < role.getMid().size(); i++) {
				int id = Integer.valueOf(role.getMid().get(i).toString());
				TRoleMenu roleMenu = new TRoleMenu();
				TRoleMenuId tRoleMenuid = new TRoleMenuId();
				tRoleMenuid.setRoleid(roleid);
				tRoleMenuid.setMenuid(id);
				roleMenu.setId(tRoleMenuid);
				this.roleMenuDAO.save(roleMenu);
			}
		}
		
	}

	@Override
	public void update(TRole role) {
		this.roleDAO.update(role);
		if(role.getMid() != null  && role.getMid().size() >0){
			this.roleMenuDAO.deleteAll(role.getRoleid());
			for (int i = 0; i < role.getMid().size(); i++) {
				int id = Integer.valueOf(role.getMid().get(i).toString());
				TRoleMenu roleMenu = new TRoleMenu();
				TRoleMenuId tRoleMenuid = new TRoleMenuId();
				tRoleMenuid.setRoleid(role.getRoleid());
				tRoleMenuid.setMenuid(id);
				roleMenu.setId(tRoleMenuid);
				this.roleMenuDAO.save(roleMenu);
			}
		}
	}

	@Override
	public PageModel search(TRole role, int currentPage, int pageSize) {
		
		return this.roleDAO.search(role, currentPage, pageSize);
	}

}
