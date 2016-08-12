package com.pojo;

/**
 * Created by Admin on 2016/7/12.
 */
public class InterestGroupUser {
    private int userId;
    private int interestGroupId;
    private User userByUserId;
    private InterestGroup interestGroupByInterestGroupId;

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

        InterestGroupUser that = (InterestGroupUser) o;

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

    public User getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(User userByUserId) {
        this.userByUserId = userByUserId;
    }

    public InterestGroup getInterestGroupByInterestGroupId() {
        return interestGroupByInterestGroupId;
    }

    public void setInterestGroupByInterestGroupId(InterestGroup interestGroupByInterestGroupId) {
        this.interestGroupByInterestGroupId = interestGroupByInterestGroupId;
    }
}
