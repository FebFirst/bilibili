package com.dao.daoImpl;

import com.dao.userCommentDAO;
import com.pojo.UserComment;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/7/5.
 */
public class userCommentDAOImpl extends HibernateDaoSupport implements userCommentDAO {
    @Override
    public void createUserComment(UserComment userComment) {
        getHibernateTemplate().save(userComment);
        getHibernateTemplate().flush();
    }

    @Override
    public void deleteUserComment(int userId, int commentId) {
        getHibernateTemplate().delete(getHibernateTemplate().find("from UserComment as usercomment where usercomment.userId = ? and usercomment.commentId = ?",userId,commentId).get(0));
        getHibernateTemplate().flush();
    }
}
