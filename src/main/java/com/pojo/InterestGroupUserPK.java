package com.pojo;

import java.io.Serializable;

/**
 * Created by Admin on 2016/7/12.
 */
public class InterestGroupUserPK implements Serializable {
    private int userId;
    private int interestGroupId;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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

        InterestGroupUserPK that = (InterestGroupUserPK) o;

        if (userId != that.userId) return false;
        if (interestGroupId != that.interestGroupId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + interestGroupId;
        return result;
    }
}
