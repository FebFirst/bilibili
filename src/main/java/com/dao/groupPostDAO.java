package com.dao;

import com.pojo.GroupPost;

/**
 * Created by frank_xiang on 2016/7/6.
 */
public interface groupPostDAO {
    public void createGroupPost(GroupPost groupPost);
    public void deleteGroupPost(int groupId,int postId);
}
