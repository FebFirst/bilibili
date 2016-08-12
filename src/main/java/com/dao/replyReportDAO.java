package com.dao;

import com.pojo.ReplyReport;

import java.util.List;

/**
 * Created by frank_xiang on 2016/7/8.
 */
public interface replyReportDAO {
    public void createReplyReport(ReplyReport replyReport);
    public void deleteReplyReport(int replyId,int userId);

    public List<ReplyReport> getReplyReport();
    public void updateReplyReport(ReplyReport replyReport);
}
