package com.pojo;

import java.util.Collection;

/**
 * Created by Admin on 2016/7/12.
 */
public class FavoriteGroup {
    private int groupId;
    private int userId;
    private String groupName;
    private User userByUserId;
    private Collection<VideoFavorite> videoFavoritesByGroupId;

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        FavoriteGroup that = (FavoriteGroup) o;

        if (groupId != that.groupId) return false;
        if (userId != that.userId) return false;
        if (groupName != null ? !groupName.equals(that.groupName) : that.groupName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = groupId;
        result = 31 * result + userId;
        result = 31 * result + (groupName != null ? groupName.hashCode() : 0);
        return result;
    }

    public User getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(User userByUserId) {
        this.userByUserId = userByUserId;
    }

    public Collection<VideoFavorite> getVideoFavoritesByGroupId() {
        return videoFavoritesByGroupId;
    }

    public void setVideoFavoritesByGroupId(Collection<VideoFavorite> videoFavoritesByGroupId) {
        this.videoFavoritesByGroupId = videoFavoritesByGroupId;
    }
}
