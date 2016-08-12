package com.pojo;

/**
 * Created by Admin on 2016/7/18.
 */
public class TagVideo {
    private int videoId;
    private int tagId;
    private Tag tagByTagId;

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TagVideo tagVideo = (TagVideo) o;

        if (videoId != tagVideo.videoId) return false;
        if (tagId != tagVideo.tagId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = videoId;
        result = 31 * result + tagId;
        return result;
    }

    public Tag getTagByTagId() {
        return tagByTagId;
    }

    public void setTagByTagId(Tag tagByTagId) {
        this.tagByTagId = tagByTagId;
    }
}
