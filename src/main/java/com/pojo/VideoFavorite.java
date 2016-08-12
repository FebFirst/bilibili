package com.pojo;

/**
 * Created by Admin on 2016/7/12.
 */
public class VideoFavorite {
    private int videoId;
    private int groupId;
    private FavoriteGroup favoriteGroupByGroupId;
    private Video videoByVideoId;

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        VideoFavorite that = (VideoFavorite) o;

        if (videoId != that.videoId) return false;
        if (groupId != that.groupId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = videoId;
        result = 31 * result + groupId;
        return result;
    }

    public FavoriteGroup getFavoriteGroupByGroupId() {
        return favoriteGroupByGroupId;
    }

    public void setFavoriteGroupByGroupId(FavoriteGroup favoriteGroupByGroupId) {
        this.favoriteGroupByGroupId = favoriteGroupByGroupId;
    }

    public Video getVideoByVideoId() {
        return videoByVideoId;
    }

    public void setVideoByVideoId(Video videoByVideoId) {
        this.videoByVideoId = videoByVideoId;
    }
}
