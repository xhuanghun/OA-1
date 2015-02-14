package post.pojo;

import java.sql.Clob;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * TPost entity. @author MyEclipse Persistence Tools
 */

public class TPost implements java.io.Serializable {

	// Fields

	private Integer postid;
	private String suser;
	private String stitle;
	private Clob scontent;
	private String scontentstr;
	private Date begindate;
	private Date enddate;
	private int nstatus;
	private int nisfile;
	private Date addtime;
	private String updateuser;
	private Date updatetime;


	// Constructors

	/** default constructor */
	public TPost() {
	}

	/** full constructor */
	public TPost(String suser, String stitle, Date begindate,
			Date enddate, int nstatus, int nisfile, Date addtime,
			String updateuser, Date updatetime ) {
		this.suser = suser;
		this.stitle = stitle;
		this.begindate = begindate;
		this.enddate = enddate;
		this.nstatus = nstatus;
		this.nisfile = nisfile;
		this.addtime = addtime;
		this.updateuser = updateuser;
		this.updatetime = updatetime;
		
	}

	// Property accessors

	public Integer getPostid() {
		return this.postid;
	}

	public String getScontentstr() {
		return scontentstr;
	}

	public void setScontentstr(String scontentstr) {
		this.scontentstr = scontentstr;
	}

	public void setPostid(Integer postid) {
		this.postid = postid;
	}

	public String getSuser() {
		return this.suser;
	}

	public void setSuser(String suser) {
		this.suser = suser;
	}

	public String getStitle() {
		return this.stitle;
	}

	public void setStitle(String stitle) {
		this.stitle = stitle;
	}

	

	public Clob getScontent() {
		return scontent;
	}

	public void setScontent(Clob scontent) {
		this.scontent = scontent;
	}

	public Date getBegindate() {
		return this.begindate;
	}

	public void setBegindate(Date begindate) {
		this.begindate = begindate;
	}

	public Date getEnddate() {
		return this.enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	

	public int getNstatus() {
		return nstatus;
	}

	public void setNstatus(int nstatus) {
		this.nstatus = nstatus;
	}

	public int getNisfile() {
		return nisfile;
	}

	public void setNisfile(int nisfile) {
		this.nisfile = nisfile;
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

	@Override
	public String toString() {
		return "TPost [addtime=" + addtime + ", begindate=" + begindate
				+ ", enddate=" + enddate + ", nisfile=" + nisfile
				+ ", nstatus=" + nstatus + ", postid=" + postid + ", scontent="
				+ scontent + ", stitle=" + stitle + ", suser=" + suser
				+ ", updatetime=" + updatetime + ", updateuser=" + updateuser
				+ "]";
	}

	

	
}