package com.dao;

import com.pojo.CommentReport;

/**
 * Created by frank_xiang on 2016/7/8.
 */
public interface commentReportDAO {
    public void createCommentReport(CommentReport commentReport);
    public void deleteCommentReport(int commentId,int userId);
}
