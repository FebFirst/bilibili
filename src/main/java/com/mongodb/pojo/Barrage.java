package com.mongodb.pojo;

/**
 * Created by Admin on 2016/7/11.
 */
public class Barrage {
    private int videoId;
    private String barrageJson;
    private int color;
    private int mode;

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public String getBarrageJson() {
        return barrageJson;
    }

    public void setBarrageJson(String barrageJson) {
        this.barrageJson = barrageJson;
    }

    public int getColor() {
        return color;
    }

    public void setColor(int color) {
        this.color = color;
    }

    public int getMode() {
        return mode;
    }

    public void setMode(int mode) {
        this.mode = mode;
    }
}
