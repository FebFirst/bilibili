package com.dao.daoImpl;

import com.dao.commentReportDAO;
import com.pojo.CommentReply;
import com.pojo.CommentReport;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/7/8.
 */
public class commentReportDAOImpl extends HibernateDaoSupport implements commentReportDAO {
    @Override
    public void createCommentReport(CommentReport commentReport) {
        getHibernateTemplate().save(commentReport);
        getHibernateTemplate().flush();
    }

    @Override
    public void deleteCommentReport(int commentId, int userId) {
        getHibernateTemplate().delete(getHibernateTemplate().find("from CommentReport as commentreport where commentreport.commentId = ? and commentreport.userId = ?",commentId,userId).get(0));
        getHibernateTemplate().flush();
    }
}
