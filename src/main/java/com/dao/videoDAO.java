package com.dao;


import com.pojo.Video;

import java.util.List;

/**
 * Created by frank_xiang on 2016/6/28.
 */

/**
 * videoDAO接口 提供了对video进行增删改查功能的接口，将在daoImpl包中进行具体的实现。
 */
public interface videoDAO {
    /**
     * createVideo方法实现了向数据库中增加一个video的功能
     * @param video 传入要增加的video
     */
    public void createVideo(Video video);

    /**
     * deleteVideo方法实现了从数据库中删除一个video的功能
     * @param videoId 传入videoId以根据videoId找到要删除的video
     */
    public void deleteVideo(int videoId);

    /**
     * updateVideo方法实现了向数据库中修改一个video属性的功能
     * @param video 传入要修改的video（包含修改属性）
     */
    public void updateVideo(Video video);

    /**
     * findVideoById方法实现了根据videoId找到一个video信息的功能
     * @param videoId 传入videoId作为查找因子
     * @return 返回需要查找的Video类的对象
     */
    public Video findVideoById(int videoId);

    /**
     * getAllVideoCount方法实现了查询本地库中所有Video记录的数目的功能
     * @return 返回记录条目的总数
     * @throws Exception
     */
    public int getAllVideoCount();

//    public int findMaxVideoId();

    public List<Video> findVideoListByUserId(int userId);

    public List<Video> findAllVideos();

    public List<Video> findLastDayUpload();

    public List<Video> findVideosBySubcategoryName(String subcategoryName);
}
