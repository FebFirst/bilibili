package com.service;

import com.pojo.Category;
import com.pojo.User;
import com.pojo.Video;

import java.util.List;

/**
 * Created by frank_xiang on 2016/7/4.
 */
public interface videoService {
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
     * 视频转码
     * @param ffmpegPath    转码工具的存放路径
     * @param upFilePath    用于指定要转换格式的文件,要截图的视频源文件
     * @param codcFilePath    格式转换后的的文件保存路径
     * @param mediaPicPath    截图保存路径
     * @return
     * @throws Exception
     */
    public boolean executeCodecs(String ffmpegPath,String upFilePath, String codcFilePath, String mediaPicPath)throws Exception;

    /**
     * 查询本地库中所有记录的数目
     * @return
     * @throws Exception
     */
    public int getAllVideoCount();

//    public int findMaxVideoId();

    public Category findCategoryByName(String categoryName);

    public void videoThumbCount(int videoId);

    public void videoReport(String email, int videoId);

    public void addVideoUper(String email,int videoId);

    public List<Video> findVideosByUper(String email);

    public List<User> findUpersByVideoList(List<Video>videoList);

    public User findUperByVideoId(int videoId);

    public List<Video> findAllVideos();

    public List<Video> findLastDayUpload();
	
	public List<List<Video>> findVideosByCategory(String category);

}
