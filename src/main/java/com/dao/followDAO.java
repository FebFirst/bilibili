package com.dao;

import com.pojo.Follow;

/**
 * Created by frank_xiang on 2016/7/8.
 */
public interface followDAO {
    public void createFollow(Follow follow);
    public void deleteFollow(int followerId,int followeeId);
}
