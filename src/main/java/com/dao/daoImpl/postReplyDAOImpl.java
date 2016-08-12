package com.dao.daoImpl;

import com.dao.postReplyDAO;
import com.pojo.PostReply;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/7/11.
 */
public class postReplyDAOImpl extends HibernateDaoSupport implements postReplyDAO {
    @Override
    public void createPostReply(PostReply postReply) {
        getHibernateTemplate().save(postReply);
        getHibernateTemplate().flush();
    }

    @Override
    public void deletePostReply(int postId, int replyId) {
        getHibernateTemplate().delete(getHibernateTemplate().find("from PostReply as postreply where postreply.postId = ? and postreply.replyId = ?",postId,replyId).get(0));
        getHibernateTemplate().flush();
    }
}
