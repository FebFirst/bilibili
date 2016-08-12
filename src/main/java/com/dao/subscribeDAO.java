package com.dao;

import com.pojo.Subscribe;

/**
 * Created by frank_xiang on 2016/7/5.
 */
public interface subscribeDAO {
    public void createSubscribe(Subscribe subscribe);
    public void deleteSubscribe(int userId,String seriesName);
}
