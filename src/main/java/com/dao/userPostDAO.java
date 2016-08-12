package com.dao;

import com.pojo.UserPost;

/**
 * Created by frank_xiang on 2016/7/6.
 */
public interface userPostDAO {
    public void createUserPost(UserPost userPost);
    public void deleteUserPost(int userId,int postId);
}
