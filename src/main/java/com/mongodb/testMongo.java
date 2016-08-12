package com.mongodb;/*
package com.mongodb;

import com.mongodb.client.MongoDatabase;

public class testMongo{
    public static void main( String args[] ){
        try {
            MongoClient mongoClient = new MongoClient( "localhost" , 27017 );
            mongoClient.getCredentialsList();

            MongoDatabase mongoDatabase = mongoClient.getDatabase("JPlay");
            System.out.println("Connect to database successfully");
            mongoDatabase.createCollection("userImage");
            mongoDatabase.createCollection("videoShot");
            System.out.println("Create collection successfully.");
        } catch(Exception e) {
            System.err.println( e.getClass().getName() + ": " + e.getMessage() );
        }
    }
}
*/
