package com.pojo;

/**
 * Created by Admin on 2016/7/12.
 */
public class UserReply {
    private int userId;
    private int replyId;
    private byte isThumb;
    private Reply replyByReplyId;
    private User userByUserId;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getReplyId() {
        return replyId;
    }

    public void setReplyId(int replyId) {
        this.replyId = replyId;
    }

    public byte getIsThumb() {
        return isThumb;
    }

    public void setIsThumb(byte isThumb) {
        this.isThumb = isThumb;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserReply userReply = (UserReply) o;

        if (userId != userReply.userId) return false;
        if (replyId != userReply.replyId) return false;
        if (isThumb != userReply.isThumb) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + replyId;
        result = 31 * result + (int) isThumb;
        return result;
    }

    public Reply getReplyByReplyId() {
        return replyByReplyId;
    }

    public void setReplyByReplyId(Reply replyByReplyId) {
        this.replyByReplyId = replyByReplyId;
    }

    public User getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(User userByUserId) {
        this.userByUserId = userByUserId;
    }
}
