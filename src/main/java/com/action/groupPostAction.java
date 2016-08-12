package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.pojo.Post;
import com.pojo.Reply;
import com.pojo.User;
import com.service.postService;
import com.service.replyService;
import com.service.userService;
import com.util.timeUtil;

import java.util.List;
import java.util.Map;

/**
 * Created by Admin on 2016/6/27.
 */
public class groupPostAction extends baseAction {
    private postService postService;
    private replyService replyService;
    private userService userService;

    //用于发帖功能
    private int interestGroupId;
    private String postContent;

    //用于举报功能
    private int postId;
    private String reason;

    //用于显示帖子及回复信息
    private int groupId;
    private Post postBean;
    private User userBean;
    private List<Post> postList;
    private List<Reply> replyList;
    private List<User> replyPusherList;

    public String delete() throws Exception {
        postService.deletePost(postId);
        return SUCCESS;
    }

    public String listPosts() throws Exception {
        postList = postService.findAllPosts();
        return SUCCESS;
    }

    public String publish(){
        Map Session = ActionContext.getContext().getSession();
        String email = (String)Session.get("email");
        Post post = new Post();
//        post.setPostId(postService.findMaxPostId() + 1);
        post.setThumbCount(0);
        post.setContent(postContent);
        post.setCreateTime(timeUtil.GetCurrentDatetime());
        post.setPostPusher(email);
        System.out.println("PC:"+postContent+"IGI::"+interestGroupId);
        postService.postPublish(email, interestGroupId, post);
        return SUCCESS;
    }

    public String report(){
        Map Session = ActionContext.getContext().getSession();
        String email = (String)Session.get("email");
        postService.reportPost(postId, email, reason);
        return SUCCESS;
    }

    public String thumbCount(){
        postService.postThumbCount(postId);
        return SUCCESS;
    }

    public String enterPost(){
        postBean = postService.findPostById(postId);
        userBean = postService.findPostPusherByPostId(postId);
        replyList = replyService.findRepliesByPostId(postId);
        replyPusherList = replyService.findReplyPushersByReplyList(replyList);
        return SUCCESS;
    }

    public postService getPostService() {
        return postService;
    }

    public void setPostService(postService postService) {
        this.postService = postService;
    }

    public int getInterestGroupId() {
        return interestGroupId;
    }

    public void setInterestGroupId(int interestGroupId) {
        this.interestGroupId = interestGroupId;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Post getPostBean() {
        return postBean;
    }

    public void setPostBean(Post postBean) {
        this.postBean = postBean;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public replyService getReplyService() {
        return replyService;
    }

    public void setReplyService(replyService replyService) {
        this.replyService = replyService;
    }

    public List<Reply> getReplyList() {
        return replyList;
    }

    public void setReplyList(List<Reply> replyList) {
        this.replyList = replyList;
    }

    public List<Post> getPostList() {
        return postList;
    }

    public void setPostList(List<Post> postList) {
        this.postList = postList;
    }

    public com.service.userService getUserService() {
        return userService;
    }

    public void setUserService(com.service.userService userService) {
        this.userService = userService;
    }

    public User getUserBean() {
        return userBean;
    }

    public void setUserBean(User userBean) {
        this.userBean = userBean;
    }

    public List<User> getReplyPusherList() {
        return replyPusherList;
    }

    public void setReplyPusherList(List<User> replyPusherList) {
        this.replyPusherList = replyPusherList;
    }
}
