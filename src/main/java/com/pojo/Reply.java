package com.pojo;

import java.util.Collection;

/**
 * Created by Admin on 2016/7/12.
 */
public class Reply {
    private int replyId;
    private String content;
    private int thumbCount;
    private String replyPusher; /** Reply pusher's email **/
    private Collection<CommentReply> commentRepliesByReplyId;
    private Collection<PostReply> postRepliesByReplyId;
    private Collection<ReplyReport> replyReportsByReplyId;
    private Collection<UserReply> userRepliesByReplyId;

    public int getReplyId() {
        return replyId;
    }

    public void setReplyId(int replyId) {
        this.replyId = replyId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getThumbCount() {
        return thumbCount;
    }

    public void setThumbCount(int thumbCount) {
        this.thumbCount = thumbCount;
    }

    public String getReplyPusher() {
        return replyPusher;
    }

    public void setReplyPusher(String replyPusher) {
        this.replyPusher = replyPusher;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Reply reply = (Reply) o;

        if (replyId != reply.replyId) return false;
        if (thumbCount != reply.thumbCount) return false;
        if (content != null ? !content.equals(reply.content) : reply.content != null) return false;
        if (replyPusher != null ? !replyPusher.equals(reply.replyPusher) : reply.replyPusher != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = replyId;
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + thumbCount;
        result = 31 * result + (replyPusher != null ? replyPusher.hashCode() : 0);
        return result;
    }

    public Collection<CommentReply> getCommentRepliesByReplyId() {
        return commentRepliesByReplyId;
    }

    public void setCommentRepliesByReplyId(Collection<CommentReply> commentRepliesByReplyId) {
        this.commentRepliesByReplyId = commentRepliesByReplyId;
    }

    public Collection<PostReply> getPostRepliesByReplyId() {
        return postRepliesByReplyId;
    }

    public void setPostRepliesByReplyId(Collection<PostReply> postRepliesByReplyId) {
        this.postRepliesByReplyId = postRepliesByReplyId;
    }

    public Collection<ReplyReport> getReplyReportsByReplyId() {
        return replyReportsByReplyId;
    }

    public void setReplyReportsByReplyId(Collection<ReplyReport> replyReportsByReplyId) {
        this.replyReportsByReplyId = replyReportsByReplyId;
    }

    public Collection<UserReply> getUserRepliesByReplyId() {
        return userRepliesByReplyId;
    }

    public void setUserRepliesByReplyId(Collection<UserReply> userRepliesByReplyId) {
        this.userRepliesByReplyId = userRepliesByReplyId;
    }
}
