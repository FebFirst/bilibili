package com.dao.daoImpl;

import com.dao.replyReportDAO;
import com.pojo.ReplyReport;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;

/**
 * Created by frank_xiang on 2016/7/8.
 */
public class replyReportDAOImpl extends HibernateDaoSupport implements replyReportDAO {
    @Override
    public void createReplyReport(ReplyReport replyReport) {
        getHibernateTemplate().save(replyReport);
        getHibernateTemplate().flush();
    }

    @Override
    public void deleteReplyReport(int replyId, int userId) {
        getHibernateTemplate().delete(getHibernateTemplate().find("from ReplyReport as replyreport where replyreport.replyId = ? and replyreport.userId = ?",replyId,userId).get(0));
        getHibernateTemplate().flush();
    }

    @Override
    public List<ReplyReport> getReplyReport(){
        try {
            String hql = "from ReplyReport";
            return (List)getHibernateTemplate().find(hql);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void updateReplyReport(ReplyReport replyReport){
        try{
            String hql = "UPDATE ReplyReport SET reason= \'" + replyReport.getReason() +
                    "\' WHERE replyId ="+replyReport.getReplyId()+ " and userId=" +replyReport.getUserId();
//            System.out.println(replyReport.getReason());
//            getHibernateTemplate().find("update ReplyReport set reason=? where replyId=? and userId = ?",
//                    replyReport.getReason(),replyReport.getReplyId(),replyReport.getUserId());
            getHibernateTemplate().bulkUpdate(hql);
            getHibernateTemplate().flush();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
