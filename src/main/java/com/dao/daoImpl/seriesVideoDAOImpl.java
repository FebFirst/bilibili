package com.dao.daoImpl;

import com.dao.seriesVideoDAO;
import com.pojo.SeriesVideo;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/7/8.
 */
public class seriesVideoDAOImpl extends HibernateDaoSupport implements seriesVideoDAO {
    @Override
    public void createSeriesVideo(SeriesVideo seriesVideo) {
        getHibernateTemplate().save(seriesVideo);
        getHibernateTemplate().flush();
    }

    @Override
    public void deleteSeriesVideo(String seriesName, int videoId) {
        getHibernateTemplate().delete(getHibernateTemplate().find("from SeriesVideo as seriesvideo where seriesvideo.seriesName=? and seriesvideo.videoId=?",seriesName,videoId).get(0));
        getHibernateTemplate().flush();
    }
}
