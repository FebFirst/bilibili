package com.pojo;

import java.io.Serializable;

/**
 * Created by Admin on 2016/7/12.
 */
public class GroupPostPK implements Serializable {
    private int postId;
    private int interestGroupId;

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getInterestGroupId() {
        return interestGroupId;
    }

    public void setInterestGroupId(int interestGroupId) {
        this.interestGroupId = interestGroupId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        GroupPostPK that = (GroupPostPK) o;

        if (postId != that.postId) return false;
        if (interestGroupId != that.interestGroupId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = postId;
        result = 31 * result + interestGroupId;
        return result;
    }
}
