package com.pojo;

import java.sql.Time;
import java.util.Collection;

/**
 * Created by Admin on 2016/7/12.
 */
public class Video {
    private int videoId;
    private String uper;
    private String topic;
    private String title;
    private String content;
    private String link;
    private Time createTime;
    private Time lastUpdate;
    private byte isPass;
    private int clickCount;
    private int thumbCount;
    private Collection<SeriesVideo> seriesVideosByVideoId;
    private Collection<TagVideo> tagVideosByVideoId;
    private Collection<VideoComment> videoCommentsByVideoId;
    private Collection<VideoFavorite> videoFavoritesByVideoId;
    private Collection<VideoReport> videoReportsByVideoId;
    private Collection<VideoSubcategory> videoSubcategoriesByVideoId;
    private Collection<VideoUper> videoUpersByVideoId;

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public String getUper() {
        return uper;
    }

    public void setUper(String uper) {
        this.uper = uper;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public Time getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Time createTime) {
        this.createTime = createTime;
    }

    public Time getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(Time lastUpdate) {
        this.lastUpdate = lastUpdate;
    }

    public byte getIsPass() {
        return isPass;
    }

    public void setIsPass(byte isPass) {
        this.isPass = isPass;
    }

    public int getClickCount() {
        return clickCount;
    }

    public void setClickCount(int clickCount) {
        this.clickCount = clickCount;
    }

    public int getThumbCount() {
        return thumbCount;
    }

    public void setThumbCount(int thumbCount) {
        this.thumbCount = thumbCount;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Video video = (Video) o;

        if (videoId != video.videoId) return false;
        if (isPass != video.isPass) return false;
        if (clickCount != video.clickCount) return false;
        if (thumbCount != video.thumbCount) return false;
        if (uper != null ? !uper.equals(video.uper) : video.uper != null) return false;
        if (topic != null ? !topic.equals(video.topic) : video.topic != null) return false;
        if (title != null ? !title.equals(video.title) : video.title != null) return false;
        if (content != null ? !content.equals(video.content) : video.content != null) return false;
        if (link != null ? !link.equals(video.link) : video.link != null) return false;
        if (createTime != null ? !createTime.equals(video.createTime) : video.createTime != null) return false;
        if (lastUpdate != null ? !lastUpdate.equals(video.lastUpdate) : video.lastUpdate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = videoId;
        result = 31 * result + (uper != null ? uper.hashCode() : 0);
        result = 31 * result + (topic != null ? topic.hashCode() : 0);
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (link != null ? link.hashCode() : 0);
        result = 31 * result + (createTime != null ? createTime.hashCode() : 0);
        result = 31 * result + (lastUpdate != null ? lastUpdate.hashCode() : 0);
        result = 31 * result + (int) isPass;
        result = 31 * result + clickCount;
        result = 31 * result + thumbCount;
        return result;
    }

    public Collection<SeriesVideo> getSeriesVideosByVideoId() {
        return seriesVideosByVideoId;
    }

    public void setSeriesVideosByVideoId(Collection<SeriesVideo> seriesVideosByVideoId) {
        this.seriesVideosByVideoId = seriesVideosByVideoId;
    }

    public Collection<TagVideo> getTagVideosByVideoId() {
        return tagVideosByVideoId;
    }

    public void setTagVideosByVideoId(Collection<TagVideo> tagVideosByVideoId) {
        this.tagVideosByVideoId = tagVideosByVideoId;
    }

    public Collection<VideoComment> getVideoCommentsByVideoId() {
        return videoCommentsByVideoId;
    }

    public void setVideoCommentsByVideoId(Collection<VideoComment> videoCommentsByVideoId) {
        this.videoCommentsByVideoId = videoCommentsByVideoId;
    }

    public Collection<VideoFavorite> getVideoFavoritesByVideoId() {
        return videoFavoritesByVideoId;
    }

    public void setVideoFavoritesByVideoId(Collection<VideoFavorite> videoFavoritesByVideoId) {
        this.videoFavoritesByVideoId = videoFavoritesByVideoId;
    }

    public Collection<VideoReport> getVideoReportsByVideoId() {
        return videoReportsByVideoId;
    }

    public void setVideoReportsByVideoId(Collection<VideoReport> videoReportsByVideoId) {
        this.videoReportsByVideoId = videoReportsByVideoId;
    }

    public Collection<VideoSubcategory> getVideoSubcategoriesByVideoId() {
        return videoSubcategoriesByVideoId;
    }

    public void setVideoSubcategoriesByVideoId(Collection<VideoSubcategory> videoSubcategoriesByVideoId) {
        this.videoSubcategoriesByVideoId = videoSubcategoriesByVideoId;
    }

    public Collection<VideoUper> getVideoUpersByVideoId() {
        return videoUpersByVideoId;
    }

    public void setVideoUpersByVideoId(Collection<VideoUper> videoUpersByVideoId) {
        this.videoUpersByVideoId = videoUpersByVideoId;
    }
}
