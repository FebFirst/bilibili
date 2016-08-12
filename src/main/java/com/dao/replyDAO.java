package com.dao;

/**
 * Created by frank_xiang on 2016/6/28.
 */

import com.pojo.Reply;

import java.util.List;

/**
 * replyDAO接口 提供了对reply进行增删改查功能的接口，将在daoImpl包中进行具体的实现。
 */
public interface replyDAO {
    /**
     * createReply方法实现了向数据库中增加一个reply的功能
     * @param reply 传入要增加的reply
     */
    public void createReply(Reply reply);

    /**
     * deleteReply方法实现了从数据库中删除一个reply的功能
     * @param replyId 传入replyId以根据replyId找到要删除的reply
     */
    public void deleteReply(int replyId);

    /**
     * updateReply方法实现了向数据库中修改一个reply属性的功能
     * @param reply 传入要修改的reply（包含修改属性）
     */
    public void updateReply(Reply reply);

    /**
     * findReplyById方法实现了根据replyId找到一个reply信息的功能
     * @param replyId 传入replyId作为查找因子
     * @return 返回需要查找的Reply类的对象
     */
    public Reply findReplyById(int replyId);

//    public int findMaxReplyId();

    public List<Reply> findRepliesByCommentId(int commentId);

    public List<Reply> findRepliesByPostId(int postId);

    public List<Reply> findAllReplies();
}
