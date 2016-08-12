package com.dao;

import com.pojo.PostReport;

/**
 * Created by frank_xiang on 2016/7/11.
 */
public interface postReportDAO {
    public void createPostReport(PostReport postReport);
    public void deletePostReport(int postId, int userId);
}
