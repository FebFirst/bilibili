package com.dao.daoImpl;

import com.dao.postReportDAO;
import com.pojo.PostReport;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/7/11.
 */
public class postReportDAOImpl extends HibernateDaoSupport implements postReportDAO {
    @Override
    public void createPostReport(PostReport postReport) {
        getHibernateTemplate().save(postReport);
        getHibernateTemplate().flush();
    }

    @Override
    public void deletePostReport(int postId, int userId) {
        getHibernateTemplate().delete(getHibernateTemplate().find("from PostReport as postreport where postreport.postId = ? and postreport.userId = ?",postId,userId).get(0));
        getHibernateTemplate().flush();
    }
}
