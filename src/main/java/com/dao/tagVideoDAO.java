package com.dao;

import com.pojo.TagVideo;

/**
 * Created by frank_xiang on 2016/7/8.
 */
public interface tagVideoDAO {
    public void createTagVideo(TagVideo tagVideo);
    public void deleteTagVideo(String tagName,int videoId);
}
