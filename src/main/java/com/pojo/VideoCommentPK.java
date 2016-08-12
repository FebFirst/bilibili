package com.pojo;

import java.io.Serializable;

/**
 * Created by Admin on 2016/7/12.
 */
public class VideoCommentPK implements Serializable {
    private int videoId;
    private int commentId;

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        VideoCommentPK that = (VideoCommentPK) o;

        if (videoId != that.videoId) return false;
        if (commentId != that.commentId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = videoId;
        result = 31 * result + commentId;
        return result;
    }
}
