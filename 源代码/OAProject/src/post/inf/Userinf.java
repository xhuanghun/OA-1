package post.inf;

import java.util.List;


import pojo.TDatadic;
import pojo.TMenu;
import pojo.TUser;

import sun.reflect.generics.tree.BaseType;
import user.dao.PageModel;



public interface Userinf{
	public List findAll();
	public void save(TUser transientInstance);
	public TUser findById(java.lang.Integer id);
	
}
