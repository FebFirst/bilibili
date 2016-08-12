package com.dao.daoImpl;

import com.dao.videoDAO;
import com.pojo.Video;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by frank_xiang on 2016/6/28.
 */

/**
 * videoDAOImpl类对videoDAO接口的方法进行了实现。<br>
 * 主要包含对video类的增删改查四个功能。
 */
public class videoDAOImpl extends HibernateDaoSupport implements videoDAO {
    /**
     * createVideo方法实现了向数据库中增加一个video的功能
     * @param video 传入要增加的video
     */
    @Override
    public void createVideo(Video video) {
        getHibernateTemplate().save(video);
        getHibernateTemplate().flush();
    }

    /**
     * deleteVideo方法实现了从数据库中删除一个video的功能
     * @param videoId 传入videoId以根据videoId找到要删除的video
     */
    @Override
    public void deleteVideo(int videoId) {
        Video vdo = getHibernateTemplate().load(Video.class, videoId);
        getHibernateTemplate().delete(vdo);
        getHibernateTemplate().flush();


        File f = new File(vdo.getLink());
        if(f.exists()) {
            f.delete();
        }
    }

    /**
     * updateVideo方法实现了向数据库中修改一个video属性的功能
     * @param video 传入要修改的video（包含修改属性）
     */
    @Override
    public void updateVideo(Video video) {
        getHibernateTemplate().merge(video);
        getHibernateTemplate().flush();
    }

    /**
     * findVideoById方法实现了根据videoId找到一个video信息的功能
     * @param videoId 传入videoId作为查找因子
     * @return 返回需要查找的Video类的对象
    */
    @Override
    public Video findVideoById(int videoId) {
        return  getHibernateTemplate().load(Video.class, videoId);
    }

    /**
     * getAllVideoCount方法实现了查询本地库中所有Video记录的数目的功能
     * @return 返回记录条目的总数
     * @throws Exception
     */
    @Override
    public int getAllVideoCount() {
        String hql = "select count(*) from Video as video";
        return Integer.parseInt(String.valueOf(getHibernateTemplate().find(hql).get(0)));
    }

//    @Override
//    public int findMaxVideoId() {
//        String hql = "select max(video.videoId) as maxinum from Video as video";
//        if(getHibernateTemplate().find(hql).get(0)==null)
//            return 0;
//        else
//        return Integer.parseInt(String.valueOf(getHibernateTemplate().find(hql).get(0)));
//    }

    @Override
    public List<Video> findVideoListByUserId(int userId) {
        String hql = "select videoId as vid from VideoUper where userId=?";
        if(getHibernateTemplate().find(hql,userId).size()==0)
        return null;
        else {
            List<Video>result = new ArrayList<Video>();
            List<Integer>videoIdList= (List<Integer>) getHibernateTemplate().find(hql,userId);
            for(int i=0;i<videoIdList.size();i++){
                result.add((Video)getHibernateTemplate().find("from Video as video where video.videoId=?",videoIdList.get(i)).get(0));
            }
            return result;
        }
    }

    @Override
    public List<Video> findAllVideos() {
        return (List<Video>) getHibernateTemplate().find("from Video ");
    }

    @Override
    public List<Video> findLastDayUpload(){
        return (List<Video>)getHibernateTemplate().find("from Video where TO_DAYS(NOW()) - TO_DAYS(lastUpdate) < 1");
    }
	
	
    @Override
    public List<Video> findVideosBySubcategoryName(String subcategoryName) {
        String hql = "select videoId as vid from VideoSubcategory where subcategoryName = ?";
        List<Video> result = new ArrayList<Video>();
        List<Integer> videoIdList = (List<Integer>) getHibernateTemplate().find(hql,subcategoryName);
        for (int i = 0; i < videoIdList.size(); i++)
            result.add(findVideoById(videoIdList.get(i)));

        System.out.println("RESULT in videoDAOIMPL:"+result.size());
        return result;
    }
}
