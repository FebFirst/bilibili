package com.pojo;

/**
 * Created by Admin on 2016/7/12.
 */
public class ReplyReport {
    private int replyId;
    private int userId;
    private String reason;
    private User userByUserId;
    private Reply replyByReplyId;

    public int getReplyId() {
        return replyId;
    }

    public void setReplyId(int replyId) {
        this.replyId = replyId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ReplyReport that = (ReplyReport) o;

        if (replyId != that.replyId) return false;
        if (userId != that.userId) return false;
        if (reason != null ? !reason.equals(that.reason) : that.reason != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = replyId;
        result = 31 * result + userId;
        result = 31 * result + (reason != null ? reason.hashCode() : 0);
        return result;
    }

    public User getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(User userByUserId) {
        this.userByUserId = userByUserId;
    }

    public Reply getReplyByReplyId() {
        return replyByReplyId;
    }

    public void setReplyByReplyId(Reply replyByReplyId) {
        this.replyByReplyId = replyByReplyId;
    }
}
