package com.service.serviceImpl;


import com.dao.*;
import com.pojo.*;
import com.service.videoService;
import com.sun.net.httpserver.Authenticator;
import org.omg.PortableInterceptor.SUCCESSFUL;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by frank_xiang on 2016/7/4.
 */
public class videoServiceImpl implements videoService {
    private userDAO userDAO;
    private videoDAO videoDAO;
    private categoryDAO categoryDAO;
    private videoReportDAO videoReportDAO;
    private videoUperDAO videoUperDAO;
    private subcategoryDAO subcategoryDAO;
    private List<Video> videoList;

    @Override
    public void createVideo(Video video) {
    videoDAO.createVideo(video);
    }

    @Override
    public void deleteVideo(int videoId) {
    videoDAO.deleteVideo(videoId);
    }

    @Override
    public void updateVideo(Video video) {
    videoDAO.updateVideo(video);
    }

    @Override
    public Video findVideoById(int videoId) {
        return  videoDAO.findVideoById(videoId);
    }

    /**
     * 视频转码
     * @param ffmpegPath    转码工具的存放路径
     * @param upFilePath    用于指定要转换格式的文件,要截图的视频源文件
     * @param codcFilePath    格式转换后的的文件保存路径
     * @param mediaPicPath    截图保存路径
     * @return
     * @throws Exception
     */
    public boolean executeCodecs(String ffmpegPath, String upFilePath, String codcFilePath,
                                 String mediaPicPath) throws Exception {
        // 创建一个List集合来保存转换视频文件为flv格式的命令
        List<String> convert = new ArrayList<String>();
        convert.add(ffmpegPath); // 添加转换工具路径
        convert.add("-i"); // 添加参数＂-i＂，该参数指定要转换的文件
        convert.add(upFilePath); // 添加要转换格式的视频文件的路径
        convert.add("-qscale");     //指定转换的质量
        convert.add("6");
        convert.add("-ab");        //设置音频码率
        convert.add("64");
        convert.add("-ac");        //设置声道数
        convert.add("2");
        convert.add("-ar");        //设置声音的采样频率
        convert.add("22050");
        convert.add("-r");        //设置帧频
        convert.add("24");
        convert.add("-y");        // 添加参数＂-y＂，该参数指定将覆盖已存在的文件
        convert.add(codcFilePath);

        // 创建一个List集合来保存从视频中截取图片的命令
        List<String> cutpic = new ArrayList<String>();
        cutpic.add(ffmpegPath);
        cutpic.add("-i");
        cutpic.add(upFilePath); // 同上（指定的文件即可以是转换为flv格式之前的文件，也可以是转换的flv文件）
        cutpic.add("-y");
        cutpic.add("-f");
        cutpic.add("image2");
        cutpic.add("-ss"); // 添加参数＂-ss＂，该参数指定截取的起始时间
        cutpic.add("17"); // 添加起始时间为第17秒
        cutpic.add("-t"); // 添加参数＂-t＂，该参数指定持续时间
        cutpic.add("0.001"); // 添加持续时间为1毫秒
        cutpic.add("-s"); // 添加参数＂-s＂，该参数指定截取的图片大小
        cutpic.add("800*670"); // 添加截取的图片大小为350*240
        cutpic.add(mediaPicPath); // 添加截取的图片的保存路径

        boolean mark = true;
        ProcessBuilder builder = new ProcessBuilder();
        try {
            builder.command(convert);
            builder.redirectErrorStream(true);
            builder.start();

            builder.command(cutpic);
            builder.redirectErrorStream(true);
            // 如果此属性为 true，则任何由通过此对象的 start() 方法启动的后续子进程生成的错误输出都将与标准输出合并，
            //因此两者均可使用 Process.getInputStream() 方法读取。这使得关联错误消息和相应的输出变得更容易
            builder.start();
        } catch (Exception e) {
            mark = false;
            System.out.println(e);
            e.printStackTrace();
        }
        return mark;
    }

    @Override
    public int getAllVideoCount() {
        return videoDAO.getAllVideoCount();
    }

//    @Override
//    public int findMaxVideoId() {
//        return videoDAO.findMaxVideoId();
//    }

    @Override
    public Category findCategoryByName(String categoryName) {
        return categoryDAO.findCategoryByName(categoryName);
    }

    @Override
    public void videoThumbCount(int videoId) {
        Video video = videoDAO.findVideoById(videoId);
        video.setThumbCount(video.getThumbCount()+1);
        videoDAO.updateVideo(video);
    }

    @Override
    public void videoReport(String email, int videoId) {
        int userId = userDAO.findUserByEmail(email).getUserId();
        VideoReport videoReport = new VideoReport();
        videoReport.setUserId(userId);
        videoReport.setVideoId(videoId);
        videoReportDAO.createVideoReport(videoReport);
    }

    @Override
    public void addVideoUper(String email, int videoId) {
        int userId = userDAO.findUserByEmail(email).getUserId();
        VideoUper videoUper = new VideoUper();
        videoUper.setUserId(userId);
        videoUper.setVideoId(videoId);
        videoUperDAO.createVideoUper(videoUper);
    }

    @Override
    public List<Video> findVideosByUper(String email) {
        int userId = userDAO.findUserByEmail(email).getUserId();
        return videoDAO.findVideoListByUserId(userId);
    }

    @Override
    public List<User> findUpersByVideoList(List<Video> videoList) {
        return userDAO.findUpersByVideoList(videoList);
    }

    @Override
    public User findUperByVideoId(int videoId) {
        return userDAO.findUperByVideoId(videoId);
    }

    @Override
    public List<List<Video>> findVideosByCategory(String categoryName) {
        List<List<Video>>result = new ArrayList<List<Video>>();
        List<Subcategory>temp1 = subcategoryDAO.findSubcategoriesByCategoryName(categoryName);
        for(int i=0;i<temp1.size();i++){
            result.add(videoDAO.findVideosBySubcategoryName(temp1.get(i).getSubcategoryName()));
        }
        return result;
    }
    @Override
    public List<Video> findAllVideos() {
        return videoDAO.findAllVideos();
    }

    @Override
    public List<Video> findLastDayUpload(){return videoDAO.findLastDayUpload();}

    public void setVideoDAO(videoDAO videoDAO) {
        this.videoDAO = videoDAO;
    }

    public videoDAO getVideoDAO(){
        return videoDAO;
    }

    public void setCategoryDAO(categoryDAO categoryDAO) {
        this.categoryDAO = categoryDAO;
    }

    public videoReportDAO getVideoReportDAO() {
        return videoReportDAO;
    }

    public void setVideoReportDAO(videoReportDAO videoReportDAO) {
        this.videoReportDAO = videoReportDAO;
    }

    public userDAO getUserDAO() {
        return userDAO;
    }

    public void setUserDAO(userDAO userDAO) {
        this.userDAO = userDAO;
    }

    public videoUperDAO getVideoUperDAO() {
        return videoUperDAO;
    }

    public void setVideoUperDAO(videoUperDAO videoUperDAO) {
        this.videoUperDAO = videoUperDAO;
    }

    public List<Video> getVideoList() {
        return videoList;
    }

    public void setVideoList(List<Video> videoList) {
        this.videoList = videoList;
    }

    public void setSubcategoryDAO(com.dao.subcategoryDAO subcategoryDAO) {
        this.subcategoryDAO = subcategoryDAO;
    }
}
