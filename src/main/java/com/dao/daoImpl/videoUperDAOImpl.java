package com.dao.daoImpl;

import com.dao.videoUperDAO;
import com.pojo.VideoUper;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/7/7.
 */
public class videoUperDAOImpl extends HibernateDaoSupport implements videoUperDAO {
    @Override
    public void createVideoUper(VideoUper videoUper) {
        getHibernateTemplate().save(videoUper);
        getHibernateTemplate().flush();
    }

    @Override
    public void deleteVideoUper(int userId, int videoId) {
        getHibernateTemplate().delete(getHibernateTemplate().find("from VideoUper as videouper where videouper.videoId = ? and videouper.userId = ?",videoId,userId).get(0));
        getHibernateTemplate().flush();
    }
}
