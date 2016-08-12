package com.pojo;

import java.io.Serializable;
import java.util.Collection;

/**
 * Created by Admin on 2016/7/12.
 */
public class Post {
    private int postId;
    private String content;
    private String createTime;
    private int thumbCount;
    private String postPusher;  /** post pusher's email **/
    private Collection<GroupPost> groupPostsByPostId;
    private Collection<PostReply> postRepliesByPostId;
    private Collection<PostReport> postReportsByPostId;
    private Collection<UserPost> userPostsByPostId;

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public int getThumbCount() {
        return thumbCount;
    }

    public void setThumbCount(int thumbCount) {
        this.thumbCount = thumbCount;
    }

    public String getPostPusher() {
        return postPusher;
    }

    public void setPostPusher(String postPusher) {
        this.postPusher = postPusher;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Post post = (Post) o;

        if (postId != post.postId) return false;
        if (thumbCount != post.thumbCount) return false;
        if (content != null ? !content.equals(post.content) : post.content != null) return false;
        if (createTime != null ? !createTime.equals(post.createTime) : post.createTime != null) return false;
        if (postPusher != null ? !postPusher.equals(post.postPusher) : post.postPusher != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = postId;
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + thumbCount;
        result = 31 * result + (postPusher != null ? postPusher.hashCode() : 0);
        return result;
    }

    public Collection<GroupPost> getGroupPostsByPostId() {
        return groupPostsByPostId;
    }

    public void setGroupPostsByPostId(Collection<GroupPost> groupPostsByPostId) {
        this.groupPostsByPostId = groupPostsByPostId;
    }

    public Collection<PostReply> getPostRepliesByPostId() {
        return postRepliesByPostId;
    }

    public void setPostRepliesByPostId(Collection<PostReply> postRepliesByPostId) {
        this.postRepliesByPostId = postRepliesByPostId;
    }

    public Collection<PostReport> getPostReportsByPostId() {
        return postReportsByPostId;
    }

    public void setPostReportsByPostId(Collection<PostReport> postReportsByPostId) {
        this.postReportsByPostId = postReportsByPostId;
    }

    public Collection<UserPost> getUserPostsByPostId() {
        return userPostsByPostId;
    }

    public void setUserPostsByPostId(Collection<UserPost> userPostsByPostId) {
        this.userPostsByPostId = userPostsByPostId;
    }
}
