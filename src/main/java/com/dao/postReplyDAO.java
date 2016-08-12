package com.dao;

import com.pojo.PostReply;

/**
 * Created by frank_xiang on 2016/7/11.
 */
public interface postReplyDAO {
    public void createPostReply(PostReply postReply);
    public void deletePostReply(int postId, int replyId);
}
