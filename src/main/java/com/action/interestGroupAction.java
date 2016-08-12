package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.pojo.InterestGroup;
import com.pojo.Post;
import com.pojo.User;
import com.service.postService;
import com.service.userService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Admin on 2016/6/27.
 */
public class interestGroupAction extends baseAction {
    private int interestGroupId;
    private userService userService;
    private postService postService;

    //用于显示我的兴趣圈功能
    private List<InterestGroup> myGroupList;
    private List<InterestGroup> groupList;
    private Map<String, Object> dataMap = new HashMap<String, Object>();

    //用于显示兴趣圈功能
    private List<Post> postList;
    private List<User> postPusherList;
    private boolean isJoined;
    private InterestGroup interestGroupBean;

    public String addInterestGroup() {
        Map Session = ActionContext.getContext().getSession();
        String email = (String)Session.get("email");
        userService.addInterestGroup(email, interestGroupId);
        return SUCCESS;
    }

    public String quitInterestGroup(){
        Map Session = ActionContext.getContext().getSession();
        String email = (String)Session.get("email");
        userService.quitInterestGroup(email,interestGroupId);
        return SUCCESS;
    }

    public String listInterestGroup() {
         //Map Session = ActionContext.getContext().getSession();
        groupList=userService.findGroupsAll();
        dataMap.put("groupList",groupList);
        //Session.put("groupList",groupList);
        System.out.println(groupList.size());
        return SUCCESS;
    }

    public String listInterestGroupByUser() {
        //dataMap.clear();
        Map Session = ActionContext.getContext().getSession();
        String email = (String) Session.get("email");
        myGroupList = userService.findGroupsByEmail(email);
        dataMap.put("myGroupList", myGroupList);
        listInterestGroup();
        System.out.println(myGroupList.size());
        return SUCCESS;
    }

    public String enterGroup() {
        Map Session = ActionContext.getContext().getSession();
        String email = (String) Session.get("email");
        isJoined = userService.isJoinedInterestGroup(email,interestGroupId);
        interestGroupBean = userService.findGroupById(interestGroupId);
        postList = postService.findPostsByGroupId(interestGroupId);
        postPusherList = postService.findPostPushersByPostList(postList);
        return SUCCESS;
    }



    public void setInterestGroupId(int interestGroupId) {
        this.interestGroupId = interestGroupId;
    }

    public int getInterestGroupId(){
        return interestGroupId;
    }

    public void setUserService(userService userService) {
        this.userService = userService;
    }

    public userService getUserService(){return userService;}

    public List<InterestGroup> getMyGroupList() {
        return myGroupList;
    }

    public void setMyGroupList(List<InterestGroup> myGroupList) {
        this.myGroupList = myGroupList;
    }

    public com.service.postService getPostService() {
        return postService;
    }

    public void setPostService(com.service.postService postService) {
        this.postService = postService;
    }


    public List<Post> getPostList() {
        return postList;
    }

    public void setPostList(List<Post> postListBean) {
        this.postList = postListBean;
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }

    public List<InterestGroup> getGroupList() {
        return groupList;
    }

    public void setGroupList(List<InterestGroup> groupList) {
        this.groupList = groupList;
    }

    public boolean isJoined() {
        return isJoined;
    }

    public void setJoined(boolean joined) {
        isJoined = joined;
    }

    public List<User> getPostPusherList() {
        return postPusherList;
    }

    public void setPostPusherList(List<User> postPusherList) {
        this.postPusherList = postPusherList;
    }

    public InterestGroup getInterestGroupBean() {
        return interestGroupBean;
    }

    public void setInterestGroupBean(InterestGroup interestGroupBean) {
        this.interestGroupBean = interestGroupBean;
    }
}
