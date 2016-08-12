package com.pojo;

import java.util.Collection;

/**
 * Created by Admin on 2016/7/12.
 */
public class InterestGroup {
    private int interestGroupId;
    private String interestGroupName;
    private Collection<GroupPost> groupPostsByInterestGroupId;
    private Collection<InterestGroupUser> interestgroupUsersByInterestGroupId;

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

        InterestGroup that = (InterestGroup) o;

        if (interestGroupId != that.interestGroupId) return false;
        if (interestGroupName != null ? !interestGroupName.equals(that.interestGroupName) : that.interestGroupName != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = interestGroupId;
        result = 31 * result + (interestGroupName != null ? interestGroupName.hashCode() : 0);
        return result;
    }

    public Collection<GroupPost> getGroupPostsByInterestGroupId() {
        return groupPostsByInterestGroupId;
    }

    public void setGroupPostsByInterestGroupId(Collection<GroupPost> groupPostsByInterestGroupId) {
        this.groupPostsByInterestGroupId = groupPostsByInterestGroupId;
    }

    public Collection<InterestGroupUser> getInterestgroupUsersByInterestGroupId() {
        return interestgroupUsersByInterestGroupId;
    }

    public void setInterestgroupUsersByInterestGroupId(Collection<InterestGroupUser> interestgroupUsersByInterestGroupId) {
        this.interestgroupUsersByInterestGroupId = interestgroupUsersByInterestGroupId;
    }

    public String getInterestGroupName() {
        return interestGroupName;
    }

    public void setInterestGroupName(String interestGroupName) {
        this.interestGroupName = interestGroupName;
    }
}
