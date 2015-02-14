package post.test;

import java.awt.event.MouseAdapter;
import java.sql.Clob;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.mapping.Array;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sun.org.apache.bcel.internal.generic.LSTORE;

import pojo.TUser;
import post.dao.TStatusTimeDAO;
import post.inf.PostFileInf;
import post.inf.PostInf;
import post.inf.PostUserInf;
import post.inf.StatusTimeInf;
import post.inf.Userinf;
import post.pojo.TPost;
import post.pojo.TPostFile;
import post.pojo.TPostUser;
import post.pojo.TPostUserId;
import post.pojo.TStatusTime;

public class Test extends HibernateDaoSupport {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// Session sessio
		 
		// PostFileInf dao = (PostFileInf) applicationContext
		// .getBean("postfileDAO");
		// List<TPostFile> files=dao.findByProperty("postid",53);
		// for (TPostFile tPostFile : files) {
		// System.out.println(tPostFile.getSoldname());
		// }

		// dao.save(new TBatch("batch4"));
		// TPost post=new TPost();
		// post.setStitle("bb");
		// post.setScontent(Hibernate.createClob(" "));
		//		
		// dao.save(post,"sasdasdasdasdsadsadasdasdasdas");

		// TPost post=dao.findById(52);

		// �ַ���ֶ�
		// Clob clob = post.getScontent();
		// try {
		// String content = clob.getSubString((long) 1, (int) clob.length());
		// System.out.println("content:" + content);
		// } catch (SQLException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }

		// PostFileInf dao = (PostFileInf) applicationContext
		// .getBean("postfileDAO");
		// dao.deleteall("post.pojo.TPostFile.postid", 84);
		// List<TPost> postlist = dao.findByPropertyDESC("nstatus", 1);
		// for (TPost tPost : postlist) {
		// System.out.println(tPost.getPostid());
		// }

		// List<TPost> postlist = dao.findBystitledate("me","2013-8-17",
		// "","1");
		// for (TPost tPost : postlist) {
		// System.out.println(tPost.getStitle());
		// }
		// System.out.println("sas");

//		 ApplicationContext applicationContext = new
//		 ClassPathXmlApplicationContext(
//		 "post_applicationContext.xml");
//		 Userinf userdao = (Userinf) applicationContext.getBean("userDAO");
		// for (int i = 0; i <10; i++) {
		// TUser tUser=new TUser();
		// tUser.setUsername("name"+i);
		// userdao.save(tUser);
		// }
		// List<TUser> users = userdao.findAll();
		//
		// for (TUser tUser : users) {
		// System.out.println(tUser.getUsername());
		//
		// }

//		ApplicationContext applicationContext = new ClassPathXmlApplicationContext(
//				"post_applicationContext.xml");
//		PostUserInf postuserdao = (PostUserInf) applicationContext.getBean("postuserDAO");
//		List<TPostUser> postUsers=postuserdao.findBypostuserid(9, 19);
//		TPostUser postUser=postUsers.get(0);
//		postUser.getId().setNisread(1);
//		TPostUserId postUserId=new TPostUserId();
//		postUserId.setSuserid(9);
//		
//		postUserId.setPostid(19);
//		TPostUser postUser2=postuserdao.findById(postUserId);
//		System.out.println(postUser2.getId().getSuserid());
//		postUser2.setNisread(1);
//		
//		postuserdao.saveorupdate(postUser2);
		
//		System.out.println(postUsers.get(0).getId().getPostid());
		
//		userdao.findById(1);
//		List<TPostUser> postUsers=postuserdao.findBypostid(20);
//		for (TPostUser tPostUser : postUsers) {
//			postuserdao.delete(tPostUser);
//		}
//		ApplicationContext applicationContext = new
//		 ClassPathXmlApplicationContext(
//		 "post_applicationContext.xml");
//		 StatusTimeInf statusTimedao = (StatusTimeInf) applicationContext.getBean("statustimeDAO");
////		 TStatusTime statusTime=new TStatusTime(2);
////		 statusTimedao.save(statusTime);
//		TStatusTime  statusTime= statusTimedao.findById(1);
//			statusTime.setNtime(3);
//			statusTimedao.saveorupdate(statusTime);
//			
//			Date  date=new Date();
//			System.out.println(date.getYear());
//			System.out.println(date.getMonth());
//			System.out.println(date.getDate());
//			System.out.println(date.getDay());
		
		
		
		// Calendar ��date���
//		ApplicationContext applicationContext = new
//		 ClassPathXmlApplicationContext(
//		 "post_applicationContext.xml");
//		 PostInf dao = (PostInf) applicationContext.getBean("postDAO");
//		Calendar calendar = Calendar.getInstance();
//		Date date = calendar.getTime();
//		StatusTimeInf statusTimedao = (StatusTimeInf) applicationContext.getBean("statustimeDAO");
//		
//		
//		
//		
//		
////		 �ṩ�˷ḻ�ĳ������ͻ�������е�����
//		int year = calendar.get(Calendar.YEAR);
//		int month = calendar.get(Calendar.MONTH) + 1;// 1�·�0 �·�+1
//		int day = calendar.get(Calendar.DAY_OF_MONTH);
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		
//		String monthstr="";
//		String daystr="";
//		if(month<10){
//			monthstr ="0"+month;
//		}else{
//			monthstr=""+month;
//		}
//		if(day<10){
//			daystr ="0"+day;
//		}else{
//			daystr=""+day;
//		}
//		
//		String nowdate=year+"-"+monthstr+"-"+daystr;
//		TStatusTime statusTime=statusTimedao.findById(1);
//		int statusdate=statusTime.getNtime();
//		List<TPost> posts=dao.findByPropertyDESC("nstatus", 0);
//		
//		for (TPost tPost : posts) {
//			Date newtime;
//			Date addtime1;
//			
//			
//			try {
//				String addtime=sdf.format(tPost.getAddtime());
//				newtime = sdf.parse(nowdate);
//				addtime1=sdf.parse(addtime);
//				int addyear=addtime1.getYear();
//				addyear=addyear-100+2000;
//				int addmonth=addtime1.getMonth()+1;
//				int addday=addtime1.getDate();
//				addday=addday+statusdate;
//				
//				if(addday>30){
//					addday=addday % 30;
//					addmonth=addmonth+1;
//					if(addmonth>12){
//						addmonth=addmonth%12;
//						addyear=addyear+1;
//					}
//				}
//				
//				String addtimestr=addyear+"-"+addmonth+"-"+addday ;
//				
//				addtime1=sdf.parse(addtimestr);
//				
//				
//				if(addtime1.before(newtime)){
//					System.out.println("���ڵ�ǰʱ��");
//					
//					
//				}else{
//					System.out.println("���ڵ�ǰʱ��");
//					tPost.setNstatus(1);
//					dao.saveOrUpdate(tPost);
//					
//				}
//			} catch (ParseException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//			
//		}
		
		
		
		
		
		
		
		
//		ApplicationContext applicationContext = new
//		 ClassPathXmlApplicationContext(
//		 "post_applicationContext.xml");
//		 PostInf dao = (PostInf) applicationContext.getBean("postDAO");
//		Calendar calendar = Calendar.getInstance();
//		Date date = calendar.getTime();
//		StatusTimeInf statusTimedao = (StatusTimeInf) applicationContext.getBean("statustimeDAO");
//		Date newtime;
//		Date addtime1;
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		TPost tPost=dao.findById(23);
//		
//		
//		String addtime=sdf.format(tPost.getAddtime());
//		try {
//			addtime1=sdf.parse(addtime);
//			int addyear=addtime1.getYear();
//			addyear=addyear-100+2000;
//			int addmonth=addtime1.getMonth()+1;
//			int addday=addtime1.getDate();
//			addday=addday+3;
//			
//			if(addday>30){
//				addday=addday % 30;
//				addmonth=addmonth+1;
//				if(addmonth>12){
//					addmonth=addmonth%12;
//					addyear=addyear+1;
//				}
//			}else{
//				addday=addday-3;
//			}
//			
//			
//			System.out.println(addday+"  "+  addmonth+"  "+  addyear);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		
//		
//		
//		
		
//		ApplicationContext applicationContext = new
//		 ClassPathXmlApplicationContext(
//		 "post_applicationContext.xml");
//		PostUserInf dao = (PostUserInf) applicationContext.getBean("postuserDAO");
//		 PostInf postdao = (PostInf) applicationContext.getBean("postDAO");
//		 List<TPostUser> postUsers=dao.findByusernisread(21, 0);
//		 List<TPost> posts=new ArrayList<TPost>();
//		 for (TPostUser tPostUser : postUsers) {
//			 int postid=tPostUser.getId().getPostid();
//			 TPost post=postdao.findById(postid);
//			 posts.add(post);
//			
//		}
////		 
//		Calendar calendar = Calendar.getInstance();
//		Date date = calendar.getTime();
//		int year = calendar.get(Calendar.YEAR);
//		int month = calendar.get(Calendar.MONTH) + 1;// 1�·�0 �·�+1
//		int day = calendar.get(Calendar.DAY_OF_MONTH);
//		
//		String monthstr="";
//		String daystr="";
//		if(month<10){
//			monthstr ="0"+month;
//		}else{
//			monthstr=""+month;
//		}
//		if(day<10){
//			daystr ="0"+day;
//		}else{
//			daystr=""+day;
//		}
//		
//		String nowdate=year+"-"+monthstr+"-"+daystr;
//		 
//		 System.out.println(nowdate);
		String s="<p>5555555<A>444</A>5555</p>";
		
//		String xx=Regex.Replace(s,@"<div[^>]*>([\s\S]*?)</div>","<p>$1</p>");
		
//		test(s);
		
		
		

	}
	
	
	
	
}
