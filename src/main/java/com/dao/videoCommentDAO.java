package com.dao;


import com.pojo.VideoComment;

/**
 * Created by frank_xiang on 2016/7/5.
 */
public interface videoCommentDAO {
    public void createVideoComment(VideoComment videoComment);
    public void deleteVideoComment(int videoId,int commentId);
}
