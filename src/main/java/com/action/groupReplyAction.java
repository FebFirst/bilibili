package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.pojo.Reply;
import com.service.replyService;

import java.util.Map;

/**
 * Created by Admin on 2016/6/27.
 */
public class groupReplyAction extends replyAction {
    private com.service.replyService replyService;
    private int postId;
    private String replyContent;

    public String reply(){
        Map Session = ActionContext.getContext().getSession();
        String email = (String)Session.get("email");
        Reply reply = new Reply();
        reply.setContent(replyContent);
        reply.setThumbCount(0);
//        reply.setReplyId(replyService.findMaxReplyId() + 1);
        reply.setReplyPusher(email);
        replyService.makeReplyOnPost(postId, email, reply);
        return SUCCESS;
    }

    public replyService getReplyService() {
        return replyService;
    }

    public void setReplyService(replyService replyService) {
        this.replyService = replyService;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent;
    }
}
