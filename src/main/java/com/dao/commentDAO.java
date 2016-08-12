package com.dao;

import com.pojo.Comment;

import java.util.List;

/**
 * Created by frank_xiang on 2016/6/28.
 */

/**
 * commentDAO接口 提供了对comment进行增删改查功能的接口，将在daoImpl包中进行具体的实现。
 */
public interface commentDAO {
    /**
     * createComment方法实现了向数据库中增加一个comment的功能
     * @param comment 传入要增加的comment
     */
    public void createComment(Comment comment);

    /**
     * deleteComment方法实现了从数据库中删除一个comment的功能
     * @param commentId 传入commentId以根据commentId找到要删除的comment
     */
    public void deleteComment(int commentId);

    /**
     * updateComment方法实现了向数据库中修改一个comment属性的功能
     * @param comment 传入要修改的comment（包含修改属性）
     */
    public void updateComment(Comment comment);

    /**
     * findCommentById方法实现了根据commentId找到一个comment信息的功能
     * @param commentId 传入commentId作为查找因子
     * @return 返回需要查找的Comment类的对象
     */
    public Comment findCommentById(int commentId);

    /**
     * getAllCommentCount方法实现了查询本地库中所有Comment记录的数目的功能
     * @return 返回记录条目的总数
     * @throws Exception
     */
    public int getAllCommentCount();

//    public int findMaxCommentId();

    public List<Comment> findCommentsByVideoId(int videoId);

    public List<Comment> findAllComments();
}
