package com.pojo;

import java.util.Collection;

/**
 * Created by Admin on 2016/7/12.
 */
public class Series {
    private String seriesName;
    private Collection<SeriesVideo> seriesVideosBySeriesName;
    private Collection<Subscribe> subscribesBySeriesName;

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

        Series series = (Series) o;

        if (seriesName != null ? !seriesName.equals(series.seriesName) : series.seriesName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return seriesName != null ? seriesName.hashCode() : 0;
    }

    public Collection<SeriesVideo> getSeriesVideosBySeriesName() {
        return seriesVideosBySeriesName;
    }

    public void setSeriesVideosBySeriesName(Collection<SeriesVideo> seriesVideosBySeriesName) {
        this.seriesVideosBySeriesName = seriesVideosBySeriesName;
    }

    public Collection<Subscribe> getSubscribesBySeriesName() {
        return subscribesBySeriesName;
    }

    public void setSubscribesBySeriesName(Collection<Subscribe> subscribesBySeriesName) {
        this.subscribesBySeriesName = subscribesBySeriesName;
    }
}
