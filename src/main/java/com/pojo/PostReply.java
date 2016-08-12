package com.pojo;

/**
 * Created by Admin on 2016/7/12.
 */
public class PostReply {
    private int replyId;
    private int postId;
    private Reply replyByReplyId;
    private Post postByPostId;

    public int getReplyId() {
        return replyId;
    }

    public void setReplyId(int replyId) {
        this.replyId = replyId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PostReply postReply = (PostReply) o;

        if (replyId != postReply.replyId) return false;
        if (postId != postReply.postId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = replyId;
        result = 31 * result + postId;
        return result;
    }

    public Reply getReplyByReplyId() {
        return replyByReplyId;
    }

    public void setReplyByReplyId(Reply replyByReplyId) {
        this.replyByReplyId = replyByReplyId;
    }

    public Post getPostByPostId() {
        return postByPostId;
    }

    public void setPostByPostId(Post postByPostId) {
        this.postByPostId = postByPostId;
    }
}
