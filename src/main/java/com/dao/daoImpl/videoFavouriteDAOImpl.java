package com.dao.daoImpl;

import com.dao.videoFavouriteDAO;
import com.pojo.VideoFavorite;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/7/5.
 */
public class videoFavouriteDAOImpl extends HibernateDaoSupport implements videoFavouriteDAO {
    @Override
    public void createVideoFavourite(VideoFavorite videoFavorite) {
        getHibernateTemplate().save(videoFavorite);
        getHibernateTemplate().flush();
    }

    @Override
    public void deleteVideoFavourite(int videoId, int groupId) {
        getHibernateTemplate().delete(getHibernateTemplate().find("from VideoFavorite as videofavourite where videofavourite .videoId=? and videofavourite .groupId=?",videoId,groupId).get(0));
        getHibernateTemplate().flush();
    }
}
