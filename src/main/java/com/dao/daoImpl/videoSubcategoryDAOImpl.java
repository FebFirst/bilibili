package com.dao.daoImpl;

import com.dao.videoSubcategoryDAO;
import com.pojo.VideoSubcategory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/7/8.
 */
public class videoSubcategoryDAOImpl extends HibernateDaoSupport implements videoSubcategoryDAO {
    @Override
    public void createVideoSubcategory(VideoSubcategory videoSubcategory) {
        getHibernateTemplate().save(videoSubcategory);
        getHibernateTemplate().flush();
    }

    @Override
    public void deleteVideoSubcategory(int videoId, String subcategoryName) {
        getHibernateTemplate().delete(getHibernateTemplate().find("from VideoSubcategory as videosubcategory where videosubcategory.videoId = ? and videosubcategory.subcategoryName = ?",videoId,subcategoryName).get(0));
        getHibernateTemplate().flush();
    }
}
