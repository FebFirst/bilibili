package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.pojo.FavoriteGroup;
import com.service.userService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Admin on 2016/6/27.
 */
public class videoFavoriteAction extends baseAction {
    private userService userService;
    private String groupName;
    private int groupId;
    private int videoId;

    private Map<String, Object> dataMap = new HashMap<String, Object>();

    private List<FavoriteGroup> favoriteGroupList;
    public videoFavoriteAction() {
    }

    public String listFavoriteGroup(){
        Map Session = ActionContext.getContext().getSession();
        String email = (String)Session.get("email");
        favoriteGroupList = userService.findFavourtiteGroupsByEmail(email);
        System.out.println("FGL::"+favoriteGroupList.size());
        dataMap.put("favoriteGroupList",favoriteGroupList);
        return SUCCESS;
    }

    public String createFile()throws Exception{
        Map Session = ActionContext.getContext().getSession();
        String email = (String) Session.get("email");
        userService.addFavouriteGroup(email, groupName);
        System.out.println("GN::"+groupName);
//        groupId=userService.findGroupIdByGroupName(groupName);
//        System.out.println("GID::"+groupId);
//        addVideo();
        return SUCCESS;
    }

    public String addVideo()throws Exception{
        userService.addVideoToFavouriteGroup(videoId, groupId);
        return SUCCESS;
    }

    public void setUserService(com.service.userService userService) {
        this.userService = userService;
    }

    public int getGroupId(){
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public int getVideoId(){
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public List<FavoriteGroup> getFavoriteGroupList() {
        return favoriteGroupList;
    }

    public void setFavoriteGroupList(List<FavoriteGroup> favoriteGroupList) {
        this.favoriteGroupList = favoriteGroupList;
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }
}
