package com.dao;

import com.pojo.UserComment;

/**
 * Created by frank_xiang on 2016/7/5.
 */
public interface userCommentDAO {
    public void createUserComment(UserComment userComment);
    public void deleteUserComment(int userId,int commentId);
}
