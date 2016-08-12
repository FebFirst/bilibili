package com.service;

import com.pojo.Comment;
import com.pojo.User;

import java.util.List;

/**
 * Created by frank_xiang on 2016/7/5.
 */
public interface commentService {
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

    public int getAllCommentCount();

//    public int findMaxCommentId();

    public void makeCommentOnVideo(int videoId, String email, Comment comment);

    public void reportComment(int commentId, String email, String reason);

    public void commentThumbCount(int commentId);

    public List<Comment> findCommentsByVideoId(int videoId);

    public List<User> findCommentPushersByCommentList(List<Comment>commentList);

    public List<Comment> findAllComments();
}
