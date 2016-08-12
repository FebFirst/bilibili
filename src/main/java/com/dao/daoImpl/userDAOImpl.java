package com.dao.daoImpl;

import com.dao.userDAO;
import com.pojo.*;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Admin on 2016/6/27.
 */

/**
 * userDAOImpl类对userDAO接口的方法进行了实现。<br>
 * 主要包含对user类的增删改查四个功能。
 */
public class userDAOImpl extends HibernateDaoSupport implements userDAO {
    /**
     * createUser方法实现了向数据库中增加一个user的功能
     * @param user 传入要增加的user
     */
    @Override
    public void createUser(User user) {
        getHibernateTemplate().save(user);
        getHibernateTemplate().flush();
    }

    /**
     * deleteUser方法实现了从数据库中删除一个user的功能
     * @param userId 传入userId以根据userId找到要删除的user
     */
    @Override
    public void deleteUser(int userId) {
        getHibernateTemplate().delete(getHibernateTemplate().load(User.class, userId));
        getHibernateTemplate().flush();
    }

    /**
     * updateUser方法实现了向数据库中修改一个user属性的功能
     * @param user 传入要修改的user（包含修改属性）
     */
    @Override
    public void updateUser(User user) {
        getHibernateTemplate().merge(user);
        getHibernateTemplate().flush();
    }

    /**
     * findUserById方法实现了根据userId找到一个user信息的功能
     * @param userId 传入userId作为查找因子
     * @return 返回需要查找的User类的对象
     */
    @Override
    public User findUserById(int userId) {
        return getHibernateTemplate().load(User.class, userId);
    }

    /**
     * findUserByUsername方法实现了根据username找到一个user信息的功能
     * @param username 传入username作为查找因子
     * @return 返回需要查找的User类的对象列表
     */
    @Override
    public List<User> findUserByUsername(String username) {
        return (List<User>) getHibernateTemplate().find("from User as user where user.username = ?",username);
//        if(getHibernateTemplate().find("from User as user where user.username = ?",username).size()==0)
//            return null;
//        else
//            return .get(0);
    }

    @Override
    public User findUserByEmail(String email) {
        //return (User) getHibernateTemplate().find("from User as user where user.email = ?", email.getBytes());
        List<User>result = (List<User>) getHibernateTemplate().find("from User as user where user.email = ?", email);
        if(result.size() == 0)
            return null;
        else
            return result.get(0);
    }

    @Override
    public List<User> findAllUsers() {
        System.out.println((List<User>) getHibernateTemplate().find("from User "));
        return (List<User>) getHibernateTemplate().find("from User ");
    }

    @Override
    public List<User> findLastDaySignUp(){
        return (List<User>)getHibernateTemplate().find("from User where TO_DAYS(NOW()) - TO_DAYS(lastUpdate) < 1");
    }
    public static void main(String args[]) {
        userDAOImpl tmp = new userDAOImpl();
        tmp.findUserById(13);
    }



    @Override
    public List<User>findUpersByVideoList(List<Video>videoList) {
        String hql = "select userId as uid from VideoUper where videoId = ?";
        List<User> result = new ArrayList<User>();
        List<Integer> userIdList = new ArrayList<Integer>();
        for (int i = 0; i < videoList.size(); i++)
            userIdList.add(((List<Integer>)getHibernateTemplate().find(hql, videoList.get(i).getVideoId())).get(0));
        for (int i = 0; i < userIdList.size(); i++)
            result.add(findUserById(userIdList.get(i)));
        return result;
    }



    @Override
    public User findUperByVideoId(int videoId) {
        String hql = "select userId as uid from VideoUper where videoId = ?";
        return findUserById(((List<Integer>)getHibernateTemplate().find(hql,videoId)).get(0));
//        if(userIdList.isEmpty())return null;
//        else{
//            return findUserById(userIdList.get(0));
//        }
    }


    @Override
    public List<User> findCommentPushersByCommentList(List<Comment> commentList) {
        String hql = "select userId as uid from UserComment where commentId = ?";
        List<User> result = new ArrayList<User>();
        List<Integer> userIdList = new ArrayList<Integer>();
        for (int i = 0; i < commentList.size(); i++)
            userIdList.add(((List<Integer>)getHibernateTemplate().find(hql, commentList.get(i).getCommentId())).get(0));
        for (int i = 0; i < userIdList.size(); i++)
            result.add(findUserById(userIdList.get(i)));
        return result;
    }

    @Override
    public List<User> findReplyPushersByReplyList(List<Reply> replyList) {
        String hql = "select userId as uid from UserReply where replyId = ?";
        List<User> result = new ArrayList<User>();
        List<Integer> userIdList = new ArrayList<Integer>();
        System.out.println("IDLIST>>>");

        for (int i = 0; i < replyList.size(); i++) {
            userIdList.add(((List<Integer>) getHibernateTemplate().find(hql, replyList.get(i).getReplyId())).get(0));
        }
        System.out.println("USERLIST...");
        for (int i = 0; i < userIdList.size(); i++)
            result.add(findUserById(userIdList.get(i)));
        return result;
    }

    @Override
    public List<User> findPostPushersByPostList(List<Post> postList) {
        String hql = "select userId as uid from UserPost where postId = ?";
        List<User> result = new ArrayList<User>();
        List<Integer> userIdList = new ArrayList<Integer>();
        for (int i = 0; i < postList.size(); i++)
            userIdList.add(((List<Integer>)getHibernateTemplate().find(hql, postList.get(i).getPostId())).get(0));
        for (int i = 0; i < userIdList.size(); i++)
            result.add(findUserById(userIdList.get(i)));
        return result;
    }

    @Override
    public List<User> findSendersByLetterList(List<Letter> letterList) {
        List<User> result = new ArrayList<User>();
        for (int i = 0; i < letterList.size(); i++)
            result.add(findUserById(letterList.get(i).getSenderId()));
        return result;
    }

    @Override
    public User findPostPusherByPostId(int postId) {
        String hql = "select userId as uid from UserPost where postId = ?";
        return findUserById(((List<Integer>)getHibernateTemplate().find(hql,postId)).get(0));
    }
}