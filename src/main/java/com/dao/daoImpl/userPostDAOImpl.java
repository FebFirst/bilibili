package com.dao.daoImpl;

import com.dao.userPostDAO;
import com.pojo.UserPost;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/7/6.
 */
public class userPostDAOImpl extends HibernateDaoSupport implements userPostDAO {
    @Override
    public void createUserPost(UserPost userPost) {
        getHibernateTemplate().save(userPost);
        getHibernateTemplate().flush();
    }

    @Override
    public void deleteUserPost(int userId, int postId) {
        getHibernateTemplate().delete(getHibernateTemplate().find("from UserPost as userpost where userpost.userId = ? and userpost.postId = ?",userId,postId).get(0));
        getHibernateTemplate().flush();
    }
}
