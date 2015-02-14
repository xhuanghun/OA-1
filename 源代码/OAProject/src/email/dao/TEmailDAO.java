package email.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import pojo.TEmail;
import pojo.TEmailFile;

/**
 	* A data access object (DAO) providing persistence and search support for TEmail entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see pojo.TEmail
  * @author MyEclipse Persistence Tools 
 */

public class TEmailDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(TEmailDAO.class);



	protected void initDao() {
		//do nothing
	}
    //添加邮件
    public void save(TEmail email) {
        log.debug("saving TEmail instance");
        try {
            getHibernateTemplate().save(email);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    //删除邮件
	public void delete(TEmail email) {
        log.debug("deleting TEmail instance");
        try {
            getHibernateTemplate().delete(email);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
	//修改邮件
    public void update(TEmail email) {
        log.debug("updating TEmail instance");
        try {
            getHibernateTemplate().update(email);
            log.debug("update successful");
        } catch (RuntimeException re) {
            log.error("update failed", re);
            throw re;
        }
    }
    //通过emailId获取邮件       
    public TEmail findById( int emailId) {
        log.debug("getting TEmail instance with id: " + emailId);
        try {
            TEmail Email = (TEmail) getHibernateTemplate()
                    .get("pojo.TEmail", emailId);
            return Email;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
   /* *//**
     * 通过用户名和状态来获取邮件列表      
     * @param userName 用户名
     * @param nemailmode 邮件状态（已发送/草稿箱）
     * @param isdel 邮件状态（0:正常   1：垃圾箱  2：彻底删除（伪删除））
     * @param isread 是否已读
     * @return
     *//*    
    public List<TEmail> findByUserName(String userName,boolean nemailmode,int isdel) {
        log.debug("getting List<TEmail>  with userName: " + userName);
        try {
        	String hql = "from TEmail where senduser=? and nisfile=? and isdel=? order by senddate desc";
        	List<TEmail> Emails = getHibernateTemplate().find(hql, userName,nemailmode,isdel);
            return Emails;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    //查询总邮件数
    public Integer totalCount(String userName,boolean nemailmode,int isdel) {
        log.debug("getting totalNum  with userName: " + userName);
        try {
        	String hql = "select count(*) from TEmail where senduser=? and nisfile=? and isdel=?";
        	int totalCount = (Integer)getHibernateTemplate().find(hql, userName,nemailmode,isdel).listIterator().next();
            return totalCount;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    */
    
 /*  public List findByExample(TEmail instance) {
        log.debug("finding TEmail instance by example");
        try {
            List results = getHibernateTemplate().findByExample(instance);
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    public List findByProperty(String propertyName, Object value) {
      log.debug("finding TEmail instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from TEmail as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findBySenduser(Object senduser
	) {
		return findByProperty(SENDUSER, senduser
		);
	}
	
	public List findByStitle(Object stitle
	) {
		return findByProperty(STITLE, stitle
		);
	}
	
	public List findByNisfile(Object nisfile
	) {
		return findByProperty(NISFILE, nisfile
		);
	}
	
	public List findByScontent(Object scontent
	) {
		return findByProperty(SCONTENT, scontent
		);
	}
	
	public List findByNemailmode(Object nemailmode
	) {
		return findByProperty(NEMAILMODE, nemailmode
		);
	}
	
	public List findByIsdel(Object isdel
	) {
		return findByProperty(ISDEL, isdel
		);
	}
	

	public List findAll() {
		log.debug("finding all TEmail instances");
		try {
			String queryString = "from TEmail";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public TEmail merge(TEmail detachedInstance) {
        log.debug("merging TEmail instance");
        try {
            TEmail result = (TEmail) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(TEmail instance) {
        log.debug("attaching dirty TEmail instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(TEmail instance) {
        log.debug("attaching clean TEmail instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static TEmailDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (TEmailDAO) ctx.getBean("TEmailDAO");
	}*/
   /* public static void main(String[] args) {
		TEmailDAO dao = (TEmailDAO)new ClassPathXmlApplicationContext("applicationContext.xml").getBean("TEmailDAO");
		TEmail email = new TEmail();
		email.setStitle("biaoti");
		TEmailFile emailFile = new TEmailFile(email, "111", "222");
		email.getEmailFiles().add(emailFile);
		dao.save(email);
		
	}*/
}