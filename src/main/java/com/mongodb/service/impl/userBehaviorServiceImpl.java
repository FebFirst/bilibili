package com.mongodb.service.impl;

import com.mongodb.pojo.userBehavior;
import com.mongodb.service.userBehaviorService;

import java.util.List;

/**
 * Created by Admin on 2016/7/15.
 */
public class userBehaviorServiceImpl implements userBehaviorService {
    private com.mongodb.dao.userBehaviorDAO userBehaviorDAO;

    @Override
    public List<userBehavior> findAllBehaviors() {
        return userBehaviorDAO.findAllBehaviors();
    }

    @Override
    public List<userBehavior> findBehaviorsByUserId(int userId) {
        return userBehaviorDAO.findBehaviorsByUserId(userId);
    }

    @Override
    public List<userBehavior> findBehaviorByVideoId(int videoId) {
        return userBehaviorDAO.findBehaviorByVideoId(videoId);
    }

    @Override
    public void createBehavior(userBehavior userBehavior) {
        userBehaviorDAO.createBehavior(userBehavior);
    }

    @Override
    public void deleteBehaviorsByUserId(int userId) {
        userBehaviorDAO.deleteBehaviorsByUserId(userId);
    }

    @Override
    public void deleteBehaviorsByVideoId(int videoId) {
        userBehaviorDAO.deleteBehaviorsByVideoId(videoId);
    }

    @Override
    public void deleteBehavior(int userId, int videoId) {
        userBehaviorDAO.deleteBehavior(userId, videoId);
    }

    @Override
    public void updateBehavior(int userId, int videoId, int rating) {
        userBehaviorDAO.updateBehavior(userId, videoId, rating);
    }

    @Override
    public void increaseRating(int userId, int videoId, int inc) {
        userBehaviorDAO.increaseRating(userId, videoId, inc);
    }

    public void setUserBehaviorDAO(com.mongodb.dao.userBehaviorDAO userBehaviorDAO) {
        this.userBehaviorDAO = userBehaviorDAO;
    }
}
