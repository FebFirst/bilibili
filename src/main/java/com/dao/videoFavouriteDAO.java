package com.dao;

import com.pojo.VideoFavorite;

/**
 * Created by frank_xiang on 2016/7/5.
 */
public interface videoFavouriteDAO {
    public void createVideoFavourite(VideoFavorite videoFavorite);
    public void deleteVideoFavourite(int videoId,int groupId);
}
