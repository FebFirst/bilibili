package com.pojo;

import java.io.Serializable;

/**
 * Created by Admin on 2016/7/12.
 */
public class CommentReportPK implements Serializable {
    private int commentId;
    private int userId;

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CommentReportPK that = (CommentReportPK) o;

        if (commentId != that.commentId) return false;
        if (userId != that.userId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = commentId;
        result = 31 * result + userId;
        return result;
    }
}
