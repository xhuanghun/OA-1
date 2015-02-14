package user.service.imple;

import java.util.List;



import pojo.TMenu;

import user.dao.MenuDAO;
import user.dao.RoleDAO;
import user.dao.RoleMenuDAO;
import user.service.MenuService;

public class MenuServiceImple implements MenuService{
	private MenuDAO menuDAO;
	private RoleMenuDAO roleMenuDAO;
	public MenuDAO getMenuDAO() {
		return menuDAO;
	}

	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}

	

	@Override
	public boolean checkMenuname(String menuname, int mid, int pid) {
		return this.menuDAO.checkMenuname(menuname, mid, pid);
	}

	@Override
	public void delete(int mid, int pid) {
		this.menuDAO.delete(mid, pid);
	}

	@Override
	public void down(TMenu menu) {
		this.menuDAO.down(menu);
	}

	@Override
	public TMenu findByMid(int mid) {
		return this.menuDAO.findByMid(mid);
	}

	@Override
	public boolean isUse(int mid) {
		return this.roleMenuDAO.isUse(mid);
	}

	@Override
	public void save(TMenu menu) {
		this.menuDAO.save(menu);
	}

	@Override
	public List<TMenu> seach() {
		return this.menuDAO.seach();
	}

	@Override
	public void up(TMenu menu) {
		this.menuDAO.up(menu);
	}

	@Override
	public void update(TMenu menu) {
		this.menuDAO.update(menu);
	}

	public RoleMenuDAO getRoleMenuDAO() {
		return roleMenuDAO;
	}

	public void setRoleMenuDAO(RoleMenuDAO roleMenuDAO) {
		this.roleMenuDAO = roleMenuDAO;
	}
	
	

}
