package com.action;

import com.mongodb.service.userBehaviorService;
import com.pojo.User;

/**
 * Created by Admin on 2016/7/14.
 */
public class userBehaviorRecord extends baseAction {
    private static final int favoriteIncrement = 15;
    private static final int thumbIncrement = 10;
    private static final int watchedIncrement = 5;
    private com.service.userService userService;
    private com.service.videoService videoService;
    private userBehaviorService userBehaviorService;
    private String email;
    private int videoId;

    public String favoriteBehavior() {
        User user = userService.findUserByEmail(email);
        userBehaviorService.increaseRating(user.getUserId(), videoId, favoriteIncrement);
        return SUCCESS;
    }

    public String thumbBehavior() {
        User user = userService.findUserByEmail(email);
        userBehaviorService.increaseRating(user.getUserId(), videoId, thumbIncrement);
        return SUCCESS;
    }

    public String watchedBehavior() {
        User user = userService.findUserByEmail(email);
        userBehaviorService.increaseRating(user.getUserId(), videoId, watchedIncrement);
        return SUCCESS;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

//    public com.service.userService getUserService() {
//        return userService;
//    }

    public void setUserService(com.service.userService userService) {
        this.userService = userService;
    }

//    public com.service.videoService getVideoService() {
//        return videoService;
//    }

    public void setVideoService(com.service.videoService videoService) {
        this.videoService = videoService;
    }

//    public userBehaviorService getUserBehaviorService() {
//        return userBehaviorService;
//    }

    public void setUserBehaviorService(userBehaviorService userBehaviorService) {
        this.userBehaviorService = userBehaviorService;
    }
}
