package com.mongodb.service;

import com.mongodb.pojo.userBehavior;

import java.util.List;

/**
 * Created by Admin on 2016/7/15.
 */
public interface userBehaviorService {
    public List<userBehavior> findAllBehaviors();

    public List<userBehavior> findBehaviorsByUserId(int userId);

    public List<userBehavior> findBehaviorByVideoId(int videoId);

    public void createBehavior(userBehavior userBehavior);

    public void deleteBehaviorsByUserId(int userId);

    public void deleteBehaviorsByVideoId(int videoId);

    public void deleteBehavior(int userId, int videoId);

    public void updateBehavior(int userId, int videoId, int rating);

    public void increaseRating(int userId, int videoId, int inc);
}
