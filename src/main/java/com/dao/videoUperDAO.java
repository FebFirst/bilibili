package com.dao;

import com.pojo.VideoUper;

/**
 * Created by frank_xiang on 2016/7/7.
 */
public interface videoUperDAO {
    public void createVideoUper(VideoUper videoUper);
    public void deleteVideoUper(int userId,int videoId);
}
