package email.action;


import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;


import org.apache.struts2.ServletActionContext;

import pojo.TEmailFile;

import com.opensymphony.xwork2.ActionSupport;

import email.service.inf.EmailServiceInf;
public class DownLoadAction extends ActionSupport {
	private int fileId;
	private String fileName;
	private String newFileName;
	private EmailServiceInf emailService;
	
	
	
	
	
	//在Struts.xml中配置参数  获取文件名
	// <param name="contentDisposition">attachment;filename="${fileName}"</param>
	


		public String getFileName() {
			// 中文需要转码编码
			try {
				fileName = new String(fileName.getBytes(), "ISO-8859-1");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return fileName;
		}

		public EmailServiceInf getEmailService() {
			return emailService;
		}

		public void setEmailService(EmailServiceInf emailService) {
			this.emailService = emailService;
		}

		public int getFileId() {
			return fileId;
		}

		public void setFileId(int fileId) {
			this.fileId = fileId;
		}

		public String getNewFileName() {
			return newFileName;
		}

		public void setNewFileName(String newFileName) {
			this.newFileName = newFileName;
		}

		public void setFileName(String fileName) {
			this.fileName = fileName;
		}


		@Override
		public String execute() throws Exception {
			//通过fid 获得文件名和真实文件名
			TEmailFile emailFile = emailService.getEmailFile(fileId);
			fileName = emailFile.getOldname();
			newFileName = emailFile.getNewname();		
			return "success";
		}

		// 默认提供getInputStream() 可以修改名字 返回值类型InputStream
		public InputStream getInputStream() throws FileNotFoundException {
			//得到文件的全路径
			String filePath = ServletActionContext.getServletContext().getRealPath(
					"/emailFile/" + newFileName);
			return new FileInputStream(filePath);
		}

	

}
