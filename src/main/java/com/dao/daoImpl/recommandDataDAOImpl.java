package com.dao.daoImpl;


import com.dao.recommendDataDAO;
import com.service.videoService;
import com.mongodb.*;
import com.pojo.User;
import com.pojo.Video;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.ArrayList;
import java.util.List;
/**
 * Created by marklee on 16/7/20.
 */
public class recommandDataDAOImpl extends HibernateDaoSupport implements recommendDataDAO{
    private int gender;
    private int age;
    private int videoId;
    private int rating;
    private Video vdo = new Video();
    private videoService videoService;
    public void getRecommandData(int userId){



        MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
       // System.out.println("Set database successfully");
        DB mongoDatabase = mongoClient.getDB("JPlay");
       // System.out.println("Connect to database successfully");
        DBCollection collection = mongoDatabase.getCollection("userBehavior");
        BasicDBObject query = new BasicDBObject("userId", userId);
        DBCursor cursor = collection.find(query);
        while (cursor.hasNext()) {
            DBObject dbObject = cursor.next();
            gender = (Integer) dbObject.get("gender");
            age = (Integer) dbObject.get("age");
            videoId = (Integer) dbObject.get("videoId");
            rating = (Integer) dbObject.get("rating");
            vdo = videoService.findVideoById(videoId);
        }
    }
}
