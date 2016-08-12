package com.dao;

import com.pojo.VideoReport;

/**
 * Created by frank_xiang on 2016/7/6.
 */
public interface videoReportDAO {
    public void createVideoReport(VideoReport videoReport);
    public void deleteVideoReport(int userId,int videoId);
}
