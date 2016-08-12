package com.dao.daoImpl;

import com.dao.tagVideoDAO;
import com.pojo.TagVideo;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/7/8.
 */
public class tagVideoDAOImpl extends HibernateDaoSupport implements tagVideoDAO {
    @Override
    public void createTagVideo(TagVideo tagVideo) {
        getHibernateTemplate().save(tagVideo);
        getHibernateTemplate().flush();
    }

    @Override
    public void deleteTagVideo(String tagName, int videoId) {
        getHibernateTemplate().delete(getHibernateTemplate().find("from TagVideo as tagvideo where tagvideo.tagName=? and tagvideo.videoId=?",tagName,videoId).get(0));
        getHibernateTemplate().flush();
    }
}
