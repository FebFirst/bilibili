package com.dao;

import com.pojo.CommentReply;

/**
 * Created by frank_xiang on 2016/7/6.
 */
public interface commentReplyDAO {
    public void createCommentReply(CommentReply commentReply);
    public void deleteCommentReply(int commentId,int replyId);
}
