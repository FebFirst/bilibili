package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.pojo.User;
import com.pojo.Video;
import com.service.userService;
import com.service.videoService;
import com.util.timeUtil;

import javax.jws.soap.SOAPBinding;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Admin on 2016/6/27.
 */
public class userAction extends baseAction {
    private userService userService;
    private videoService videoService;
    private List<Video> videoBeanList;
    private List<User> all;
    private int userId;
    private User userBean;
    private String username;
    private String password;
    private Byte gender;
    private String signature;
    private String email;
    private String birthday;
    private String lastUpdate;
    private String realName;
    private String university;
    private Map<String, Object> dataMap = new HashMap<String, Object>();
    private int experience;

    /** For Administrator **/
    public String deleteUser() throws Exception {
        try {
            System.out.println(userId + "ahhahahaha");
            userService.deleteUser(userId);
            System.out.println(userId + "lalalala");
            return SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            Map session = ActionContext.getContext().getSession();
            session.put("message","User deletion failed!");
            return  ERROR;
        }
    }

    public String updateUser() throws Exception {
        try {
            User user = userService.findUserById(userId);
            // System.out.println(userId + "gazhigazhi");
            user.setUsername(username);
            // System.out.println(username + "gazhigazhi");
            if(password != null && password.length() > 0)
                user.setPwdhash(password.getBytes());
            user.setSignature(signature);
            user.setEmail(email);
            // System.out.println(birthday + "aaaaaaa");
            if(birthday != null && birthday.length() > 0) {
                user.setBirthday(Date.valueOf(birthday));
                System.out.println(Date.valueOf(birthday) + "lalala");
            }
//            user.setBirthday(Date.valueOf("1996-01-01"));
//            System.out.println(Date.valueOf(birthday) + "lalala");

            user.setRealName(realName);
            System.out.println(user.getRealName() + "hahaha");
            user.setExperience(experience);
            user.setGender(gender);
            user.setLastUpdate(timeUtil.GetCurrentDatetime());
            userService.updateUser(user);
            return SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ERROR;
        }
    }

    public String getAllUser() throws Exception{
//        System.out.println(flag + "flaggggggg");
//        flag ++;
        all = userService.findAllUser();
        return SUCCESS;
    }


    public String getLastDaySignUp() throws Exception{
        try {
            all = userService.findLastDaySignUp();
            return SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ERROR;
        }
    }
    /** For User **/
    public String listMyVideo() throws Exception {
        dataMap.clear();
        Map Session = ActionContext.getContext().getSession();
        String email = (String)Session.get("email");
        videoBeanList = videoService.findVideosByUper(email);
        dataMap.put("videoBeanList", videoBeanList);
        return SUCCESS;
    }

    public String updatePersonalInfo() throws Exception {
        userBean.setLastUpdate(timeUtil.GetCurrentDatetime());
        System.out.println("User update " + userBean.getUserId());
        userService.updateUser(userBean);
        return SUCCESS;
    }

    public com.service.videoService getVideoService() {
        return videoService;
    }

    public void setVideoService(com.service.videoService videoService) {
        this.videoService = videoService;
    }

    public List<Video> getVideoBeanList() {
        return videoBeanList;
    }

    public void setVideoBeanList(List<Video> videoBeanList) {
        this.videoBeanList = videoBeanList;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Byte getGender() {
        return gender;
    }

    public void setGender(Byte gender) {
        this.gender = gender;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(String lastUpdate) {
        this.lastUpdate = lastUpdate;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public User getUserBean() {
        return userBean;
    }

    public void setUserBean(User userBean) {
        this.userBean = userBean;
    }

    public com.service.userService getUserService() {
        return userService;
    }

    public void setUserService(com.service.userService userService) {
        this.userService = userService;
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }


    public List<User> getAll() {
        return all;
    }

    public void setAll(List<User> all) {
        this.all = all;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }
}
