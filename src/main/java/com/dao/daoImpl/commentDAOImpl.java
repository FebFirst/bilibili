package com.dao.daoImpl;

import com.dao.commentDAO;
import com.pojo.Comment;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by frank_xiang on 2016/6/28.
 */

/**
 * commentDAOImpl类对commentDAO接口的方法进行了实现。<br>
 * 主要包含对comment类的增删改查四个功能。
 */
public class commentDAOImpl extends HibernateDaoSupport implements commentDAO {
    /**
     * createComment方法实现了向数据库中增加一个comment的功能
     * @param comment 传入要增加的comment
     */
    @Override
    public void createComment(Comment comment) {
        getHibernateTemplate().save(comment);
        getHibernateTemplate().flush();
    }

    /**
     * deleteComment方法实现了从数据库中删除一个comment的功能
     * @param commentId 传入commentId以根据commentId找到要删除的comment
     */
    @Override
    public void deleteComment(int commentId) {
        getHibernateTemplate().delete(getHibernateTemplate().load(Comment.class, commentId));
        getHibernateTemplate().flush();
    }

    /**
     * updateComment方法实现了向数据库中修改一个comment属性的功能
     * @param comment 传入要修改的comment（包含修改属性）
     */
    @Override
    public void updateComment(Comment comment) {
        getHibernateTemplate().merge(comment);
        getHibernateTemplate().flush();
    }


    /**
     * findCommentById方法实现了根据commentId找到一个comment信息的功能
     * @param commentId 传入commentId作为查找因子
     * @return 返回需要查找的Comment类的对象
     */
    @Override
    public Comment findCommentById(int commentId) {
        return getHibernateTemplate().load(Comment.class,commentId);
    }

    @Override
    public int getAllCommentCount() {
        String hql = "select count(*) from Comment as comment";
        return Integer.parseInt(String.valueOf(getHibernateTemplate().find(hql).get(0)));
    }

//    @Override
//    public int findMaxCommentId() {
//        String hql = "select max(comment.commentId) as maxinum from Comment as comment";
//        if(getHibernateTemplate().find(hql).get(0)==null)
//            return 0;
//        else
//            return Integer.parseInt(String.valueOf(getHibernateTemplate().find(hql).get(0)));
//    }

    @Override
    public List<Comment> findCommentsByVideoId(int videoId) {
        String hql = "select commentId as cid from VideoComment where videoId = ? order by cid desc";
        List<Integer> commentIdList = (List<Integer>) getHibernateTemplate().find(hql, videoId);
        List<Comment>result = new ArrayList<Comment>();
        if (commentIdList.size() != 0)
            for(int i = 0; i < commentIdList.size(); i++){
                result.add((Comment)getHibernateTemplate().find("from Comment as comment where comment.commentId=?",commentIdList.get(i)).get(0));
            }
        return result;
    }

    @Override
    public List<Comment> findAllComments() {
        return (List<Comment>) getHibernateTemplate().find("from Comment");
    }
}
