package com.action;

import com.mongodb.*;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.pojo.Barrage;
import org.bson.Document;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.data.mongodb.crossstore.MongoDocumentBacking;

/**
 * Created by Admin on 2016/6/27.
 */
public class barrageAction extends baseAction {
    private String barrageJson; // In json format
    private int videoId;

    public void setBarrageJson(String barrageJson) {
        this.barrageJson = barrageJson;
    }

    public String getBarrageJson() {
        return barrageJson;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public int getVideoId(){
        return videoId;
    }

    public String Show() throws  Exception {
        System.out.println(barrageJson);
        return SUCCESS;
    }

    public String Store() throws Exception {
//        ApplicationContext ctx = new GenericXmlApplicationContext("applicationContext-mongodb.xml");
//        MongoOperations mongoOperations = (MongoOperations)ctx.getBean("mongoTemplate");
//        Barrage barrage = new Barrage();
//        barrage.setVideoId(videoId);
//        barrage.setBarrageJson(barrageJson);
//        mongoOperations.insert(barrage);

        return SUCCESS;
    }

    public String FetchByVideoId() throws Exception {
//        ApplicationContext ctx = new GenericXmlApplicationContext("applicationContext-mongodb.xml");
//        MongoOperations mongoOperations = (MongoOperations)ctx.getBean("mongoTemplate");
//        Query query = new Query(Criteria.where("videoId").is(videoId));
//        barrageJson = mongoOperations.findOne(query, Barrage.class).getBarrageJson();
//        System.out.println(barrageJson);

//        MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
//        MongoDatabase mongoDatabase = mongoClient.getDatabase("JPlay");
//        System.out.println("Connect to database successfully");
//        MongoCollection mongoCollection = mongoDatabase.getCollection("barrage");
//        System.out.println("Get collection successfully.");
//        BasicDBObject query = new BasicDBObject("videoId", 1);
//        FindIterable findIterable = mongoCollection.find(query);
//        MongoCursor mongoCursor = findIterable.iterator();
//        while (mongoCursor.hasNext()) {
//            Document document = (Document) mongoCursor.next();
//            barrageJson = document.get("barrageJson").toString();
//        }

        MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
//        System.out.println("Set database successfully");
        DB mongoDatabase = mongoClient.getDB("JPlay");
//        System.out.println("Connect to database successfully");
        DBCollection collection = mongoDatabase.getCollection("barrage");
        BasicDBObject query = new BasicDBObject("videoId", videoId);
        DBCursor cursor = collection.find(query);
        barrageJson = "";
        while (cursor.hasNext()) {
            DBObject dbObject = cursor.next();
            barrageJson = (String) dbObject.get("barrageJson");
        }
        return SUCCESS;
    }

    public String UpdateByVideoId() throws Exception {
//        ApplicationContext ctx = new GenericXmlApplicationContext("applicationContext-mongodb.xml");
//        MongoOperations mongoOperations = (MongoOperations)ctx.getBean("mongoTemplate");
//        Query query = new Query(Criteria.where("videoId").is(videoId));
//        Update update = new Update().set("barrageJson", barrageJson);
//        mongoOperations.updateFirst(query, update, Barrage.class);

        MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
        System.out.println("Set database successfully");
        DB mongoDatabase = mongoClient.getDB("JPlay");
        System.out.println("Connect to database successfully");
        DBCollection collection = mongoDatabase.getCollection("barrage");

        DBObject updateCondition = new BasicDBObject();

        updateCondition.put("videoId", videoId);

        DBObject updatedValue = new BasicDBObject();
        updatedValue.put("barrageJson", barrageJson);

        DBObject updateSetValue = new BasicDBObject("$set", updatedValue);
        /**
         * update insert_test set headers=3 and legs=4 where name='fox'
         * updateCondition:更新条件
         * updateSetValue:设置的新值
         */
        collection.update(updateCondition, updateSetValue, true, true);

        System.out.println(barrageJson);

        return SUCCESS;
    }

    public static void main( String args[] ){
        try {
//            MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
//            MongoDatabase mongoDatabase = mongoClient.getDatabase("JPlay");
//            System.out.println("Connect to database successfully");
//            MongoCollection mongoCollection = mongoDatabase.getCollection("barrage");
//            System.out.println("Get collection successfully.");
//            BasicDBObject query = new BasicDBObject("videoId", 1);
//            FindIterable findIterable = mongoCollection.find(query);
//            MongoCursor mongoCursor = findIterable.iterator();
//            while (mongoCursor.hasNext()) {
//                Document document = (Document) mongoCursor.next();
//                System.out.println(document.get("barrageJson"));
//            }


            MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
            System.out.println("Set database successfully");
            DB mongoDatabase = mongoClient.getDB("JPlay");
            System.out.println("Connect to database successfully");
            DBCollection collection = mongoDatabase.getCollection("barrage");

            DBObject updateCondition = new BasicDBObject();

            updateCondition.put("videoId", 2);

            DBObject updatedValue = new BasicDBObject();
            updatedValue.put("barrageJson", "123");

            DBObject updateSetValue = new BasicDBObject("$set", updatedValue);
            /**
             * update insert_test set headers=3 and legs=4 where name='fox'
             * updateCondition:更新条件
             * updateSetValue:设置的新值
             */
            collection.update(updateCondition, updateSetValue, true, true);
//
//            ApplicationContext ctx = new GenericXmlApplicationContext("applicationContext-mongodb.xml");
//            MongoOperations mongoOperations = (MongoOperations)ctx.getBean("mongoTemplate");
//            Query query = new Query(Criteria.where("videoId").is(1));
//            String barrageJson = mongoOperations.findOne(query, Barrage.class).getBarrageJson();
//            System.out.println(barrageJson);
        } catch(Exception e) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
        }
    }
}
