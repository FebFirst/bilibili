package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.pojo.Reply;
import com.pojo.ReplyReport;
import com.service.replyService;

import java.util.List;
import java.util.Map;

/**
 * Created by Admin on 2016/6/27.
 */
public class replyAction extends baseAction {
    private replyService replyService;
    private int replyId;
    private int userId;
    private String reason;
    private List<Reply> replyList;
    private List<ReplyReport> reportList;
    private Reply reply;
    public String listReplies() throws Exception {
        replyList = replyService.findAllReplies();
        return SUCCESS;
    }

    public String findReplyById() throws Exception{
        try {
//            System.out.println(replyId + "reason");
            reply = replyService.findReplyById(replyId);
            System.out.println(reply.getContent());
            return SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ERROR;
        }
    }

    public String deleteReply() throws Exception {
        replyService.deleteReply(replyId);
        return SUCCESS;
    }

    public String report(){
        System.out.println(reason.length());
        Map Session = ActionContext.getContext().getSession();
        String email = (String)Session.get("email");
        replyService.reportReply(replyId, email, reason);
        return SUCCESS;
    }

    public String thumbCount(){
        replyService.replyThumbCount(replyId);
        return SUCCESS;
    }
    public String getReplyReport() throws Exception{
        try{
            reportList =  replyService.getReplyReport();
            return SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ERROR;
        }
    }

    public String updateReplyReport() throws Exception{
        try{
            ReplyReport report = new ReplyReport();
//            reason = new String(reason.getBytes("ISO-8859-1"), "GBK");
            report.setReason(reason);

            report.setReplyId(replyId);
            report.setUserId(userId);

            System.out.println(report.getReason()+ report.getUserId() +report.getReplyId() + "啊啊啊啊啊啊");
            replyService.updateReplyReport(report);
//            rrd = new replyReportDAOImpl();
//            rrd.createReplyReport(report);
            return SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ERROR;
        }
    }

    public String deleteReplyReport() throws Exception{
        try{
            replyService.deleteReplyReport(replyId,userId);
            return SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ERROR;
        }
    }

    public replyService getReplyService() {
        return replyService;
    }

    public void setReplyService(replyService replyService) {
        this.replyService = replyService;
    }

    public int getReplyId() {
        return replyId;
    }

    public void setReplyId(int replyId) {
        this.replyId = replyId;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public List<Reply> getReplyList() {
        return replyList;
    }

    public void setReplyList(List<Reply> replyList) {
        this.replyList = replyList;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getUserId() {
        return userId;
    }

    public List<ReplyReport> getReportList() {
        return reportList;
    }

    public void setReportList(List<ReplyReport> reportList) {
        this.reportList = reportList;
    }

    public Reply getReply() {
        return reply;
    }

    public void setReply(Reply reply) {
        this.reply = reply;
    }
}
