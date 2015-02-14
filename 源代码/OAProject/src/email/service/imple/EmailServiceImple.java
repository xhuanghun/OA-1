package email.service.imple;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import pojo.TEmail;
import pojo.TEmailFile;
import pojo.TReceiveemail;
import pojo.TReceiveemailId;
import pojo.TUser;
import email.dao.TEmailDAO;
import email.dao.TEmailFileDAO;
import email.dao.TReceiveemailDAO;
import email.dao.TUserDAO;
import email.service.inf.EmailServiceInf;
import email.tools.FileTool;
import email.tools.PageSupport;

public class EmailServiceImple implements EmailServiceInf {
	private TEmailDAO emailDAO;
	private TEmailFileDAO emailFileDAO;
	private TReceiveemailDAO receiveemailDAO;
	private TUserDAO userDao;
	

	public TUserDAO getUserDao() {
		return userDao;
	}

	public void setUserDao(TUserDAO userDao) {
		this.userDao = userDao;
	}

	public TEmailDAO getEmailDAO() {
		return emailDAO;
	}

	public void setEmailDAO(TEmailDAO emailDAO) {
		this.emailDAO = emailDAO;
	}

	public TEmailFileDAO getEmailFileDAO() {
		return emailFileDAO;
	}

	public void setEmailFileDAO(TEmailFileDAO emailFileDAO) {
		this.emailFileDAO = emailFileDAO;
	}

	public TReceiveemailDAO getReceiveemailDAO() {
		return receiveemailDAO;
	}

	public void setReceiveemailDAO(TReceiveemailDAO receiveemailDAO) {
		this.receiveemailDAO = receiveemailDAO;
	}

	// 更新邮件
	@Override
	public void update(TEmail email, int type, List<File> emailFile,
			List<String> emailFileFileName, String receiveUserNames) {
		
		String userName = ((TUser)ServletActionContext.getRequest().getSession().getAttribute("user")).getUsername();
		
		// 新附件
		List<TEmailFile> emailFiles = getEmailFileName(emailFileFileName);
		// 读取老附件
		List<TEmailFile> oldEmailFiles = emailFileDAO.findByEmailId(email
				.getId());
		// 删除原来的附件列表
		email.getEmailFiles().clear();
		// 加入老附件
		email.getEmailFiles().addAll(oldEmailFiles);
		if (emailFiles != null && emailFiles.size() > 0) {
			for (TEmailFile tEmailFile : emailFiles) {
				tEmailFile.setEmail(email);
				email.getEmailFiles().add(tEmailFile);
			}
		}
		email.setIsfile(email.getEmailFiles().size() > 0 ? true : false);
		email.setEmailmode(type == 0 ? false : true);
		email.setSenddate(new Date());
		// 保存之前 清除一下缓存
		emailDAO.getHibernateTemplate().clear();
		emailDAO.update(email);
		// 删除中间表的所有数据
		receiveemailDAO.deleteByEmailId(email.getId());
		//中间表保存发件人信息
		TReceiveemail sendUser = new TReceiveemail(true, false, true);
		sendUser.setId(new TReceiveemailId(email, userName));
		receiveemailDAO.save(sendUser);
		//中间表保存收件人信息
		String[] userNames = receiveUserNames.split(";");
		for (String user : userNames) {
			TReceiveemail receiveemail = new TReceiveemail(false, false, false);
			receiveemail.setId(new TReceiveemailId(email, user));
			receiveemailDAO.save(receiveemail);
		}
		//拷贝附件
		if (emailFiles != null && emailFiles.size() > 0) {
			copyFile(emailFile, emailFiles);
		}

	}

	// 添加邮件
	@Override
	public void save(TEmail email, int type, List<File> emailFile,
			List<String> emailFileFileName, String receiveUserNames) {
		String userName = ((TUser)ServletActionContext.getRequest().getSession().getAttribute("user")).getUsername();
		List<TEmailFile> emailFiles = getEmailFileName(emailFileFileName);
		if (emailFiles != null && emailFiles.size() > 0) {
			for (TEmailFile tEmailFile : emailFiles) {
				tEmailFile.setEmail(email);
				email.getEmailFiles().add(tEmailFile);
			}
		}	
		email.setIsfile(email.getEmailFiles().size() > 0 ? true : false);
		email.setEmailmode(type == 0 ? false : true);
		email.setSenddate(new Date());
		emailDAO.save(email);
		//中间表保存发件人信息
		TReceiveemail sendUser = new TReceiveemail(true, false, true);
		sendUser.setId(new TReceiveemailId(email, userName));
		receiveemailDAO.save(sendUser);
		
		String[] userNames = receiveUserNames.split(";");
		for (String user : userNames) {
			TReceiveemail receiveemail = new TReceiveemail(false, false, false);
			receiveemail.setId(new TReceiveemailId(email, user));
			receiveemailDAO.save(receiveemail);
		}
		if (emailFiles != null && emailFiles.size() > 0) {
			copyFile(emailFile, emailFiles);
		}

	}

	// 生成新文件名 返回TEmailFile
	public List<TEmailFile> getEmailFileName(List<String> emailFileFileName) {
		List<TEmailFile> emailFiles = new ArrayList<TEmailFile>();
		if (emailFileFileName == null || emailFileFileName.size() == 0) {
			return emailFiles;
		}
		for (int i = 0; i < emailFileFileName.size(); i++) {
			String newName = FileTool.makeNewFileName(emailFileFileName.get(i));
			TEmailFile file = new TEmailFile();
			file.setNewname(newName);
			file.setOldname(emailFileFileName.get(i));
			emailFiles.add(file);
		}
		return emailFiles;
	}

	// 拷贝文件
	public void copyFile(List<File> emailFile, List<TEmailFile> emailFiles) {
		if (emailFile == null || emailFile.size() == 0) {
			return;
		}
		String realPath = ServletActionContext.getServletContext().getRealPath(
				"/emailFile");
		for (int i = 0; i < emailFile.size(); i++) {
			File newFile = new File(realPath + "/"
					+ emailFiles.get(i).getNewname());
			FileTool.copyFile(emailFile.get(i), newFile);
		}
	}

	/*
	 * public static void main(String[] args) { String s = "111;222;333;444;";
	 * System.out.println(s.split(";").length); }
	 */

	// 根据邮件id 获得收件人名字字符串
	@Override
	public String getReceiveUserNames(int emailId) {
		String userName = ((TUser)ServletActionContext.getRequest().getSession().getAttribute("user")).getUsername();
		String receiveUserNames = "";
		List<TReceiveemail> receiveemails = receiveemailDAO
				.findByEmailId(emailId);
		for (TReceiveemail receiveemail : receiveemails) {
			if(!receiveemail.getId().getUsername().equals(userName)){
				receiveUserNames += receiveemail.getId().getUsername() + ";";
			}
			
		}
		return receiveUserNames;
	}

	// 根据邮件id和当前在线用户名  获取单个邮件(TReceiveemail)
	@Override
	public TReceiveemail getReceiveemail(int emailId) {
		String userName = ((TUser)ServletActionContext.getRequest().getSession().getAttribute("user")).getUsername();
		TReceiveemail receiveemail = receiveemailDAO.findById(emailId, userName);
		if(receiveemail.getIssend()==false && receiveemail.getIsread()==false){
			receiveemail.setIsread(true);
			receiveemailDAO.getHibernateTemplate().clear();
			receiveemailDAO.update(receiveemail);
		}
		
		return receiveemail;
	}
//删除附件
	@Override
	public boolean deleteFile(int fileid) {
		TEmailFile emailFile = emailFileDAO.findById(fileid);		
		String fileName = emailFile.getNewname();
		emailFileDAO.delete(emailFile);
		String realPath = ServletActionContext.getServletContext().getRealPath(
				"/emailFile");
		File file = new File(realPath + "/" + fileName);
		if (file.exists()) {
			file.delete();
		}
		return true;
	}

//根据附件ID  取得附件
	@Override
	public TEmailFile getEmailFile(int fileid) {		
		return emailFileDAO.findById(fileid);
	}
	/**
	 * 伪删除邮件
	 * 还原邮件
	 */

	@Override
	public boolean setIsDel(int emailId, int type) {
		//获取当前登录用户名
		String userName = ((TUser)ServletActionContext.getRequest().getSession().getAttribute("user")).getUsername();
		TReceiveemail receiveemail = receiveemailDAO.findById(emailId, userName);
		if(type == 4){
			receiveemailDAO.delete(receiveemail);
			
		}else{
			boolean isdel = (type==3?true:false);
			if(receiveemail.getIsdel() != isdel){
				receiveemail.setIsdel(isdel);
				receiveemailDAO.update(receiveemail);
			}
			
		}		
		return true;
	}
	//根据位置（type） 获取邮件列表
	//type  0:草稿箱   1：已发邮件  2：收件箱   3:垃圾箱
	@Override
	public boolean emailList(int type) {
		HttpServletRequest request = ServletActionContext.getRequest();
		String userName = ((TUser)request.getSession().getAttribute("user")).getUsername();
		int emailmode = -1;
		int isread = -1;
		int isdel = -1;
		int issend = -1;
		if(type==0){
			emailmode = isdel = 0;
			isread = issend = 1;
		}else if(type==1){
			emailmode = isread = issend = 1;
			isdel = 0;			
		}else if(type==2){
			emailmode = 1;
			isdel = issend = 0;
		}else{
			isdel = 1;
		}
		List<TReceiveemail> receiveemails = receiveemailDAO.findByUserName(userName, emailmode, isread, isdel, issend, new PageSupport(request));
		request.setAttribute("emails", receiveemails);
		System.out.println(receiveemails);
		List<String> usernames = new ArrayList<String>();
		for (TReceiveemail receiveemail : receiveemails) {
			if(receiveemail.getIssend()){
				usernames.add(getReceiveUserNames(receiveemail.getId().getEmail().getId()));				
			}else{
				usernames.add(getSendUserName(receiveemail.getId().getEmail().getId()));
			}
		}
		request.setAttribute("usernames", usernames);
		return true;
	}

	@Override
	public String getSendUserName(int emailId) {
		
		return receiveemailDAO.getSendUserName(emailId);
	}

	@Override
	public boolean getUnreadCount() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String userName = ((TUser)request.getSession().getAttribute("user")).getUsername();
		int unreadCount =  receiveemailDAO.totalCount(userName, 1, 0, 0, 0);
		request.setAttribute("unreadCount", unreadCount);
		return true;
	}

	@Override
	public List<String> getUserNameList() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String userName = ((TUser)request.getSession().getAttribute("user")).getUsername();
		String nameKey = request.getParameter("nameKey");
		return userDao.getUserNameList(userName, nameKey);
	}

}
