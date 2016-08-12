package com.util;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.gridfs.GridFsOperations;

import java.io.*;
import java.util.List;

import static org.apache.struts2.ServletActionContext.getServletContext;

/**
 * Created by frank_xiang on 2016/7/11.
 */
public class mongoUtil {
    private static GridFS gridFS = null;
    public  void StoreImage(String mediaPicPath, int videoId) throws IOException {
        ApplicationContext ctx = new GenericXmlApplicationContext("applicationContext-mongodb.xml");
        GridFsOperations gridFsOperations = (GridFsOperations) ctx.getBean("gridFsTemplate");

        DBObject metaData = new BasicDBObject();
        metaData.put("path", mediaPicPath);
        metaData.put("_id", "videoImage_" + String.valueOf(videoId));
        System.out.println(videoId);

        InputStream inputStream = new FileInputStream(mediaPicPath);
        gridFsOperations.store(inputStream, mediaPicPath, "image/jpg", metaData);
//        Mongo mongo = new Mongo("localhost" , 27017);
        //连接数据库
//        DB db = mongo.getDB("test");
        //文件操作是在DB的基础上实现的，与表和文档没有关系
//
//        gridFS = new GridFS(db);
//
//        File readFile = new File(mediaPicPath);
//        GridFSInputFile mongofile = gridFS.createFile(readFile);
//        //可以再添加属性
//        mongofile.put("path",mediaPicPath);
//        mongofile.put("_id","videoImage_"+String.valueOf(videoId));
//        //保存
//        mongofile.save();
    }

    public static String GetVideoImage(int videoId) throws IOException {
        ApplicationContext ctx = new GenericXmlApplicationContext("applicationContext-mongodb.xml");
        GridFsOperations gridFsOperations = (GridFsOperations) ctx.getBean("gridFsTemplate");

        System.out.println("pass query");
        List<GridFSDBFile> gridFsdbFiles = gridFsOperations.find(
                new Query(Criteria.where("metadata._id").is("videoImage_" + String.valueOf(videoId))));


        String imageRealPath = getServletContext().getRealPath("videos")+"\\images\\video_"+ String.valueOf(videoId) + "_out.jpg";

        String imagePath = "videos/images/video_" + String.valueOf(videoId) + "_out.jpg";
        gridFsdbFiles.get(0).writeTo(new FileOutputStream(imageRealPath));
        return imagePath;

//
//        Mongo mongo=new Mongo("localhost" , 27017);
//        //连接数据库
//        DB db = mongo.getDB("test");
//        //文件操作是在DB的基础上实现的，与表和文档没有关系
//
//        gridFS = new GridFS(db);
//        DBObject query  = new BasicDBObject("_id", "video_"+String.valueOf(videoId));
//        GridFSDBFile gridFSDBFile = gridFS.findOne(query);
//        String imagePath = "videos/images/video_"+String.valueOf(videoId)+"_out.jpg";
//        gridFSDBFile.writeTo(new FileOutputStream(imagePath));
//        return imagePath;
    }
}
