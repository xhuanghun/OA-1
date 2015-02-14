package pojo;

import java.util.Date;


/**
 * TMenu entity. @author MyEclipse Persistence Tools
 */

public class TMenu  implements java.io.Serializable {


    // Fields    

     private Integer menuid;
     private String menuname;
     private String link;
     private Integer pid;
     private Date addtime;
     private String updateuser;
     private Date updatetime;
     private Integer isdel;
     private Integer orderid;
     

    // Constructors

    /** default constructor */
    public TMenu() {
    }

    
    /** full constructor */
    public TMenu(String menuname, String link, Integer pid, Date addtime, String updateuser, Date updatetime, Integer isdel, Integer orderid) {
        this.menuname = menuname;
        this.link = link;
        this.pid = pid;
        this.addtime = addtime;
        this.updateuser = updateuser;
        this.updatetime = updatetime;
        this.isdel = isdel;
        this.orderid = orderid;
    }

   
    // Property accessors

    public Integer getMenuid() {
        return this.menuid;
    }
    
    public void setMenuid(Integer menuid) {
        this.menuid = menuid;
    }

    public String getMenuname() {
        return this.menuname;
    }
    
    public void setMenuname(String menuname) {
        this.menuname = menuname;
    }

    public String getLink() {
        return this.link;
    }
    
    public void setLink(String link) {
        this.link = link;
    }

    public Integer getPid() {
        return this.pid;
    }
    
    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Date getAddtime() {
        return this.addtime;
    }
    
    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public String getUpdateuser() {
        return this.updateuser;
    }
    
    public void setUpdateuser(String updateuser) {
        this.updateuser = updateuser;
    }

    public Date getUpdatetime() {
        return this.updatetime;
    }
    
    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    public Integer getIsdel() {
        return this.isdel;
    }
    
    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }

    public Integer getOrderid() {
        return this.orderid;
    }
    
    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }


	@Override
	public String toString() {
		return "TMenu [addtime=" + addtime + ", isdel=" + isdel + ", link="
				+ link + ", menuid=" + menuid + ", menuname=" + menuname
				+ ", orderid=" + orderid + ", pid=" + pid + ", updatetime="
				+ updatetime + ", updateuser=" + updateuser + "]";
	}
   








}