package com.pojo;

/**
 * Created by Admin on 2016/7/12.
 */
public class UserComment {
    private int userId;
    private int commentId;
    private byte isThumb;
    private User userByUserId;
    private Comment commentByCommentId;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
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

        UserComment that = (UserComment) o;

        if (userId != that.userId) return false;
        if (commentId != that.commentId) return false;
        if (isThumb != that.isThumb) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + commentId;
        result = 31 * result + (int) isThumb;
        return result;
    }

    public User getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(User userByUserId) {
        this.userByUserId = userByUserId;
    }

    public Comment getCommentByCommentId() {
        return commentByCommentId;
    }

    public void setCommentByCommentId(Comment commentByCommentId) {
        this.commentByCommentId = commentByCommentId;
    }
}
