package com.dao.daoImpl;

import com.dao.replyDAO;
import com.pojo.Comment;
import com.pojo.Reply;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by frank_xiang on 2016/6/28.
 */

/**
 * replyDAOImpl类对replyDAO接口的方法进行了实现。<br>
 * 主要包含对reply类的增删改查四个功能。
 */
public class replyDAOImpl extends HibernateDaoSupport implements replyDAO {
    /**
     * createReply方法实现了向数据库中增加一个reply的功能
     * @param reply 传入要增加的reply
     */
    @Override
    public void createReply(Reply reply) {
        getHibernateTemplate().save(reply);
        getHibernateTemplate().flush();
    }

    /**
     * deleteReply方法实现了从数据库中删除一个reply的功能
     * @param replyId 传入replyId以根据replyId找到要删除的reply
     */
    @Override
    public void deleteReply(int replyId) {
        getHibernateTemplate().delete(getHibernateTemplate().load(Reply.class,replyId));
        getHibernateTemplate().flush();
    }

    /**
     * updateReply方法实现了向数据库中修改一个reply属性的功能
     * @param reply 传入要修改的reply（包含修改属性）
     */
    @Override
    public void updateReply(Reply reply) {
        getHibernateTemplate().merge(reply);
        getHibernateTemplate().flush();
    }

    /**
     * findReplyById方法实现了根据replyId找到一个reply信息的功能
     * @param replyId 传入replyId作为查找因子
     * @return 返回需要查找的Reply类的对象
     */
    @Override
    public Reply findReplyById(int replyId) {
        return getHibernateTemplate().load(Reply.class,replyId);
    }

//    @Override
//    public int findMaxReplyId() {
//        String hql = "select max(reply.replyId) as maxinum from Reply as reply";
//        if( getHibernateTemplate().find(hql).get(0) == null)
//            return 0;
//        else
//            return Integer.parseInt(String.valueOf(getHibernateTemplate().find(hql).get(0)));
//    }

    @Override
    public List<Reply> findRepliesByCommentId(int commentId) {
        String hql = "select replyId as rid from CommentReply where commentId = ?";
        List<Integer> replyIdList = (List<Integer>) getHibernateTemplate().find(hql, commentId);
        List<Reply> result = new ArrayList<Reply>();
        if (replyIdList.size() !=0) {
            for(int i = 0; i < replyIdList.size(); i++){
                result.add((Reply) getHibernateTemplate().find("from Reply as reply where reply.replyId = ?", replyIdList.get(i)).get(0));
                //getHibernateTemplate().flush();
            }
        }
        return result;
    }

    @Override
    public List<Reply> findRepliesByPostId(int postId) {
        String hql = "select replyId as rid from PostReply where postId = ?";
        List<Integer> replyIdList = (List<Integer>) getHibernateTemplate().find(hql, postId);
        List<Reply> result = new ArrayList<Reply>();
        if (replyIdList.size() != 0){
            for(int i = 0; i < replyIdList.size(); i++){
                result.add((Reply)getHibernateTemplate().find("from Reply as reply where reply.replyId = ?", replyIdList.get(i)).get(0));
            }
        }
        return result;
    }

    @Override
    public List<Reply> findAllReplies() {
        return (List<Reply>) getHibernateTemplate().find("from Reply ");
    }
}
