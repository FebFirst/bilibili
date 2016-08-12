package com.pojo;

/**
 * Created by Admin on 2016/7/12.
 */
public class GroupPost {
    private int postId;
    private int interestGroupId;
    private InterestGroup interestGroupByInterestGroupId;
    private Post postByPostId;

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

        GroupPost groupPost = (GroupPost) o;

        if (postId != groupPost.postId) return false;
        if (interestGroupId != groupPost.interestGroupId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = postId;
        result = 31 * result + interestGroupId;
        return result;
    }

    public InterestGroup getInterestGroupByInterestGroupId() {
        return interestGroupByInterestGroupId;
    }

    public void setInterestGroupByInterestGroupId(InterestGroup interestGroupByInterestGroupId) {
        this.interestGroupByInterestGroupId = interestGroupByInterestGroupId;
    }

    public Post getPostByPostId() {
        return postByPostId;
    }

    public void setPostByPostId(Post postByPostId) {
        this.postByPostId = postByPostId;
    }
}
