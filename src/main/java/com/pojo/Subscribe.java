package com.pojo;

/**
 * Created by Admin on 2016/7/12.
 */
public class Subscribe {
    private int userId;
    private String seriesName;
    private User userByUserId;
    private Series seriesBySeriesName;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getSeriesName() {
        return seriesName;
    }

    public void setSeriesName(String seriesName) {
        this.seriesName = seriesName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Subscribe subscribe = (Subscribe) o;

        if (userId != subscribe.userId) return false;
        if (seriesName != null ? !seriesName.equals(subscribe.seriesName) : subscribe.seriesName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + (seriesName != null ? seriesName.hashCode() : 0);
        return result;
    }

    public User getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(User userByUserId) {
        this.userByUserId = userByUserId;
    }

    public Series getSeriesBySeriesName() {
        return seriesBySeriesName;
    }

    public void setSeriesBySeriesName(Series seriesBySeriesName) {
        this.seriesBySeriesName = seriesBySeriesName;
    }
}
