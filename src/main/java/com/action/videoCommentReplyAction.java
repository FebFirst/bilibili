package com.action;


import com.opensymphony.xwork2.ActionContext;
import com.pojo.Reply;
import com.service.replyService;

import java.util.Map;

/**
 * Created by Admin on 2016/6/27.
 */
public class videoCommentReplyAction extends replyAction {
    private replyService replyService;
    private int commentId;
    private String replyContent;

    public String replyComment() throws Exception{
        Map Session = ActionContext.getContext().getSession();
        String email = (String)Session.get("email");
        Reply reply = new Reply();
//        reply.setReplyId(replyService.findMaxReplyId() + 1);
        reply.setContent(replyContent);
        reply.setThumbCount(0);
        reply.setReplyPusher(email);
        replyService.makeReplyOnComment(commentId, email, reply);
        return SUCCESS;
    }


    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public com.service.replyService getReplyService() {
        return replyService;
    }

    public void setReplyService(com.service.replyService replyService) {
        this.replyService = replyService;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }
}
