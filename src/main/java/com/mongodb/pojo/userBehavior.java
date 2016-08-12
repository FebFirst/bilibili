package com.mongodb.pojo;


/**
 * Created by Admin on 2016/7/15.
 */
public class userBehavior {
    /**
     * # Rating 1:UserID 2:Gender 3:Age 4:VideoID 5:Tag
     * UserID: use circulation to generate each result "userIdOutput.txt"
     * Gender: index = { 0 represents male, 1 represents female. }, value = { 1 for yes, 0 for not. }
     * Age: index = { 2: [0, 18), 3: [18, 20), 4: [20, 22), 5: [22, inf) }, value = { 1 for in this range, 0 o.w. }
     * VideoID: index = { [6, max(videoId) + 5] }, value = { 1 for yes, 0 for not }
     * Tag: index = { [1 + max(videoId) + 5, max(tagId) + max(videoId) + 5] }, value = { 1 for yes, 0 o.w. }
     */
    public static final int ageStart = 2;
    private double rating;
    private int userId;
    private Byte gender;
    private int age;
    private int videoId;
    private int tagId;

    public static int getAgeRange(int age) {
        if (age < 18) {
            return ageStart;
        } else if (age < 20) {
            return ageStart + 1;
        } else if (age < 22) {
            return ageStart + 2;
        } else {
            return ageStart + 3;
        }
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Byte getGender() {
        return gender;
    }

    public void setGender(Byte gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }
}
