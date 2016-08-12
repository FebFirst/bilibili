package com.dao.daoImpl;

import com.dao.videoReportDAO;
import com.pojo.VideoReport;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/7/6.
 */
public class videoReportDAOImpl extends HibernateDaoSupport implements videoReportDAO {
    @Override
    public void createVideoReport(VideoReport videoReport) {
        getHibernateTemplate().save(videoReport);
        getHibernateTemplate().flush();
    }

    @Override
    public void deleteVideoReport(int userId, int videoId) {
        getHibernateTemplate().delete(getHibernateTemplate().find("from VideoReport as videoreport where videoreport.videoId = ? and videoreport.userId = ?",videoId,userId).get(0));
        getHibernateTemplate().flush();
    }
}
