package com.pojo;

import java.io.Serializable;

/**
 * Created by Admin on 2016/7/12.
 */
public class Follow {
    private int followerId;
    private int followeeId;
    private String createdTime;
    private User userByFollowerId;
    private User userByFolloweeId;

    public int getFollowerId() {
        return followerId;
    }

    public void setFollowerId(int followerId) {
        this.followerId = followerId;
    }

    public int getFolloweeId() {
        return followeeId;
    }

    public void setFolloweeId(int followeeId) {
        this.followeeId = followeeId;
    }

    public String getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Follow follow = (Follow) o;

        if (followerId != follow.followerId) return false;
        if (followeeId != follow.followeeId) return false;
        if (createdTime != null ? !createdTime.equals(follow.createdTime) : follow.createdTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = followerId;
        result = 31 * result + followeeId;
        result = 31 * result + (createdTime != null ? createdTime.hashCode() : 0);
        return result;
    }

    public User getUserByFollowerId() {
        return userByFollowerId;
    }

    public void setUserByFollowerId(User userByFollowerId) {
        this.userByFollowerId = userByFollowerId;
    }

    public User getUserByFolloweeId() {
        return userByFolloweeId;
    }

    public void setUserByFolloweeId(User userByFolloweeId) {
        this.userByFolloweeId = userByFolloweeId;
    }
}
