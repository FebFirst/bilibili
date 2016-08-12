package com.pojo;

/**
 * Created by Admin on 2016/7/12.
 */
public class VideoSubcategory {
    private int videoId;
    private String subcategoryName;
    private Video videoByVideoId;
    private Subcategory subcategoryBySubcategoryName;

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public String getSubcategoryName() {
        return subcategoryName;
    }

    public void setSubcategoryName(String subcategoryName) {
        this.subcategoryName = subcategoryName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        VideoSubcategory that = (VideoSubcategory) o;

        if (videoId != that.videoId) return false;
        if (subcategoryName != null ? !subcategoryName.equals(that.subcategoryName) : that.subcategoryName != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = videoId;
        result = 31 * result + (subcategoryName != null ? subcategoryName.hashCode() : 0);
        return result;
    }

    public Video getVideoByVideoId() {
        return videoByVideoId;
    }

    public void setVideoByVideoId(Video videoByVideoId) {
        this.videoByVideoId = videoByVideoId;
    }

    public Subcategory getSubcategoryBySubcategoryName() {
        return subcategoryBySubcategoryName;
    }

    public void setSubcategoryBySubcategoryName(Subcategory subcategoryBySubcategoryName) {
        this.subcategoryBySubcategoryName = subcategoryBySubcategoryName;
    }
}
