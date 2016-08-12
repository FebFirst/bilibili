package com.dao.daoImpl;

import com.dao.commentReplyDAO;
import com.pojo.CommentReply;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/7/6.
 */
public class commentReplyDAOImpl extends HibernateDaoSupport implements commentReplyDAO {
    @Override
    public void createCommentReply(CommentReply commentReply) {
        getHibernateTemplate().save(commentReply);
        getHibernateTemplate().flush();
    }

    @Override
    public void deleteCommentReply(int commentId, int replyId) {
        getHibernateTemplate().delete(getHibernateTemplate().find("from CommentReply as commentreply where commentreply.commentId = ? and commentreply.replyId = ?",commentId,replyId).get(0));
    }

}
