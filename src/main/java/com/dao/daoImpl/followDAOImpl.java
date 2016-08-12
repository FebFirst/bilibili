package com.dao.daoImpl;

import com.pojo.Follow;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.dao.followDAO;

/**
 * Created by frank_xiang on 2016/7/8.
 */
public class followDAOImpl extends HibernateDaoSupport implements followDAO {
    @Override
    public void createFollow(Follow follow) {
        getHibernateTemplate().save(follow);
        getHibernateTemplate().flush();
    }

    @Override
    public void deleteFollow(int followerId, int followeeId) {
        getHibernateTemplate().delete(getHibernateTemplate().find("from Follow as follow where follow.followerId = ? and follow.followeeId = ?",followerId,followeeId).get(0));
        getHibernateTemplate().flush();
    }
}
