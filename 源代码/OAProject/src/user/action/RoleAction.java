package user.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;

import pojo.TMenu;
import pojo.TRole;
import pojo.TRoleMenu;
import pojo.TRoleMenuId;
import pojo.TUser;
import user.service.MenuService;
import user.service.RoleService;
import user.service.UserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;



public class RoleAction extends BaseAction implements ModelDriven<TRole>{
	private TRole role=new TRole();
	
	private RoleService roleService;
	
	private MenuService menuService;
	
	private UserService userService;
	private static String oldrolename;
	public TRole getModel() {
		return role;
	}
	private List<TMenu> menulist;
	private List<Integer> midlist;
	private List<TRoleMenu> roleAndMenuslist;
	public RoleService getRoleService() {
		return roleService;
	}
	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}
	
	public MenuService getMenuService() {
		return menuService;
	}
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}
	public List<TMenu> getMenulist() {
		return menulist;
	}
	public void setMenulist(List<TMenu> menulist) {
		this.menulist = menulist;
	}
	public List<Integer> getMidlist() {
		return midlist;
	}
	public void setMidlist(List<Integer> midlist) {
		this.midlist = midlist;
	}
	public List<TRoleMenu> getRoleAndMenuslist() {
		return roleAndMenuslist;
	}
	public void setRoleAndMenuslist(List<TRoleMenu> roleAndMenuslist) {
		this.roleAndMenuslist = roleAndMenuslist;
	}
	/**
	 * 去添加页面
	 * @return
	 */
	public String doinit(){
		
		menulist=menuService.seach();
		this.role.setRoleinfo("没有角色信息,请补充完整");
		return "edit";
	}
	public String saveOrUpdate(){
		TUser nowUser=(TUser) request.getSession().getAttribute("user");
		TUser user1 = userService.findByUserid(nowUser.getUserid());
        role.setUpdateuser(user1.getUsername());
		if (role.getRoleid()!= null && role.getRoleid()>0) {
			TRole trole = this.roleService.findByRid(role.getRoleid());
			role.setIsdel(trole.getIsdel());
			role.setAddtime(trole.getAddtime());
			role.setUpdatetime(new Date());
			this.roleService.update(role);
			this.message="修改角色成功";
			this.addDefaultURL("角色列表", "rolelist!view");		
		}else{
			role.setAddtime(new Date());
			role.setUpdatetime(new Date());
			role.setIsdel(0);
			this.roleService.save(role);
			this.message="新增角色成功";
			this.addDefaultURL("角色列表", "rolelist!view");
			this.addURL("继续添加", "role!doinit");
		}
		return SUCCESS;
	}
	public String updatePage() throws IllegalAccessException, InvocationTargetException{
		midlist=new ArrayList<Integer>();
		menulist=menuService.seach();
		TRole rolestr=this.roleService.findByRid(role.getRoleid());
		oldrolename = rolestr.getRolename();
		BeanUtils.copyProperties(role, rolestr);
		roleAndMenuslist=this.roleService.findMidByRid(role.getRoleid());	
   		for (int i = 0; i < roleAndMenuslist.size(); i++) {
   		 	midlist.add(roleAndMenuslist.get(i).getId().getMenuid());
		}
		return "edit";
	}
	public String checkRolename(){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		PrintWriter out  = null;
        String lastName = null;
		try {
			out= response.getWriter();
			lastName = new String(role.getRolename().getBytes("ISO-8859-1"), "GBK");
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(oldrolename +"角色名" + lastName);
		if(!lastName.equals(oldrolename)){
			boolean flag=roleService.checkRolename(lastName);
			System.out.println(flag);
			if (flag) {
				// 存在
				out.print("1");
			} else {
				// 不存在
				out.print("0");
			}	
		}else{
			out.print("0");
		}
		oldrolename = null;
		return null;
	}
	/**
	 * 删除角色
	 * @return
	 */
	public String delete(){
		if(!roleService.isUse(role.getRoleid())){
			roleService.delete(role.getRoleid());
			this.message="操作成功";			
		}else {
			this.message="该角色已被使用，无法删除";
		}
		this.addDefaultURL("", "rolelist!view");		
		return SUCCESS;
		
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
}
