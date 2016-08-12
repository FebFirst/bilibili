package com.dao;

import com.pojo.SeriesVideo;

/**
 * Created by frank_xiang on 2016/7/8.
 */
public interface seriesVideoDAO {
    public void createSeriesVideo(SeriesVideo seriesVideo);
    public void deleteSeriesVideo(String seriesName,int videoId);
}
