package com.pojo;

import java.io.Serializable;

/**
 * Created by Admin on 2016/7/12.
 */
public class SeriesVideoPK implements Serializable {
    private String seriesName;
    private int videoId;

    public String getSeriesName() {
        return seriesName;
    }

    public void setSeriesName(String seriesName) {
        this.seriesName = seriesName;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SeriesVideoPK that = (SeriesVideoPK) o;

        if (videoId != that.videoId) return false;
        if (seriesName != null ? !seriesName.equals(that.seriesName) : that.seriesName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = seriesName != null ? seriesName.hashCode() : 0;
        result = 31 * result + videoId;
        return result;
    }
}
