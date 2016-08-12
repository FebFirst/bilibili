package com.mongodb;///*
//
//package com.mongodb;
//
//import com.mongodb.Util.FileToByte;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.GenericXmlApplicationContext;
//import org.springframework.data.mongodb.core.MongoOperations;
//import org.springframework.data.mongodb.core.query.Criteria;
//import org.springframework.data.mongodb.core.query.Query;
//import org.springframework.data.mongodb.core.query.Update;
//
//import java.io.File;
//
//*/
//
//import com.mongodb.Util.FileToByte;
//import org.apache.struts2.components.File;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.GenericXmlApplicationContext;
//import org.springframework.data.mongodb.core.MongoOperations;
//import org.springframework.data.mongodb.core.query.Criteria;
//import org.springframework.data.mongodb.core.query.Query;
//import org.springframework.data.mongodb.core.query.Update;
//
///**
// * Created by Admin on 2016/6/8.
// */
//
//
//public class App {
//    public static void main(String[] args){
//        ApplicationContext ctx = new GenericXmlApplicationContext("mongoConfig.xml");
//        MongoOperations mongoOperations = (MongoOperations)ctx.getBean("mongoTemplate");
//        File file = new File("");    // Absolute path, i.e. "C:\\Users\\Admin\\Images\\foo.jpg"
//        Query query = new Query(Criteria.where("videoId").is(1));   // Find by videoID
//        Update update = new Update().set("picture", FileToByte.getBytesFromFile(file));
//        // TODO: Read MongoOperations (Spring Data MongoDB 1.9.1.RELEASE API)
//        // href: http://docs.spring.io/spring-data/mongodb/docs/current/api/org/springframework/data/mongodb/core/MongoOperations.html
//        mongoOperations.findAndModify(query, update, ScreenShot.class); // TODO: Create a ScreenShot Class
//        mongoOperations.save(bookProfile);  // save: create (C in CRUD)
//        mongoOperations.upsert(query, update, ScreenShot.class);  // upsert: if exists then update else create. (CU in CRUD)
//    }
//}
//
