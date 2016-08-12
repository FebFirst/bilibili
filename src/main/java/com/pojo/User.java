package com.pojo;

import java.sql.Date;
import java.util.Arrays;
import java.util.Collection;

/**
 * Created by Admin on 2016/7/12.
 */
public class User {
    private int userId;
    private String username;
    private byte[] pwdhash;
    private byte status;
    private Byte gender;
    private String signature;
    private String email;
    private Date birthday;
    private String created;
    private String lastUpdate;
    private String realName;
    private String university;
    private Integer experience;
    private Collection<CommentReport> commentReportsByUserId;
    private Collection<FavoriteGroup> favoriteGroupsByUserId;
    private Collection<Follow> followsByUserId;
    private Collection<Follow> followsByUserId_0;
    private Collection<InterestGroupUser> interestGroupUsersByUserId;
    private Collection<Letter> lettersByUserId;
    private Collection<Letter> lettersByUserId_0;
    private Collection<PostReport> postReportsByUserId;
    private Collection<ReplyReport> replyReportsByUserId;
    private Collection<Subscribe> subscribesByUserId;
    private Collection<UserComment> userCommentsByUserId;
    private Collection<UserPost> userPostsByUserId;
    private Collection<UserReply> userRepliesByUserId;
    private Collection<UserRole> userRolesByUserId;
    private Collection<VideoReport> videoReportsByUserId;
    private Collection<VideoUper> videoUpersByUserId;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public byte[] getPwdhash() {
        return pwdhash;
    }

    public void setPwdhash(byte[] pwdhash) {
        this.pwdhash = pwdhash;
    }

    public byte getStatus() {
        return status;
    }

    public void setStatus(byte status) {
        this.status = status;
    }

    public Byte getGender() {
        return gender;
    }

    public void setGender(Byte gender) {
        this.gender = gender;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }


    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getCreated() {
        return created;
    }

    public void setCreated(String created) {
        this.created = created;
    }

    public String getLastUpdate() {
        return lastUpdate;
    }

    public void setLastUpdate(String lastUpdate) {
        this.lastUpdate = lastUpdate;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realname) {
        this.realName = realname;
    }

    public String getUniversity() {
        return university;
    }

    public void setUniversity(String university) {
        this.university = university;
    }

    public Integer getExperience() {
        return experience;
    }

    public void setExperience(Integer experience) {
        this.experience = experience;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (userId != user.userId) return false;
        if (status != user.status) return false;
        if (username != null ? !username.equals(user.username) : user.username != null) return false;
        if (!Arrays.equals(pwdhash, user.pwdhash)) return false;
        if (gender != null ? !gender.equals(user.gender) : user.gender != null) return false;
        if (signature != null ? !signature.equals(user.signature) : user.signature != null) return false;
        if (email != null ? !email.equals(user.email) : user.email != null) return false;
        if (birthday != null ? !birthday.equals(user.birthday) : user.birthday != null) return false;
        if (created != null ? !created.equals(user.created) : user.created != null) return false;
        if (lastUpdate != null ? !lastUpdate.equals(user.lastUpdate) : user.lastUpdate != null) return false;
        if (realName != null ? !realName.equals(user.realName) : user.realName != null) return false;
        if (university != null ? !university.equals(user.university) : user.university != null) return false;
        if (experience != null ? !experience.equals(user.experience) : user.experience != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + Arrays.hashCode(pwdhash);
        result = 31 * result + (int) status;
        result = 31 * result + (gender != null ? gender.hashCode() : 0);
        result = 31 * result + (signature != null ? signature.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (birthday != null ? birthday.hashCode() : 0);
        result = 31 * result + (created != null ? created.hashCode() : 0);
        result = 31 * result + (lastUpdate != null ? lastUpdate.hashCode() : 0);
        result = 31 * result + (realName != null ? realName.hashCode() : 0);
        result = 31 * result + (university != null ? university.hashCode() : 0);
        result = 31 * result + (experience != null ? experience.hashCode() : 0);
        return result;
    }

    public Collection<CommentReport> getCommentReportsByUserId() {
        return commentReportsByUserId;
    }

    public void setCommentReportsByUserId(Collection<CommentReport> commentReportsByUserId) {
        this.commentReportsByUserId = commentReportsByUserId;
    }

    public Collection<FavoriteGroup> getFavoriteGroupsByUserId() {
        return favoriteGroupsByUserId;
    }

    public void setFavoriteGroupsByUserId(Collection<FavoriteGroup> favoriteGroupsByUserId) {
        this.favoriteGroupsByUserId = favoriteGroupsByUserId;
    }

    public Collection<Follow> getFollowsByUserId() {
        return followsByUserId;
    }

    public void setFollowsByUserId(Collection<Follow> followsByUserId) {
        this.followsByUserId = followsByUserId;
    }

    public Collection<Follow> getFollowsByUserId_0() {
        return followsByUserId_0;
    }

    public void setFollowsByUserId_0(Collection<Follow> followsByUserId_0) {
        this.followsByUserId_0 = followsByUserId_0;
    }

    public Collection<InterestGroupUser> getInterestGroupUsersByUserId() {
        return interestGroupUsersByUserId;
    }

    public void setInterestGroupUsersByUserId(Collection<InterestGroupUser> interestgroupUsersByUserId) {
        this.interestGroupUsersByUserId = interestgroupUsersByUserId;
    }

    public Collection<Letter> getLettersByUserId() {
        return lettersByUserId;
    }

    public void setLettersByUserId(Collection<Letter> lettersByUserId) {
        this.lettersByUserId = lettersByUserId;
    }

    public Collection<Letter> getLettersByUserId_0() {
        return lettersByUserId_0;
    }

    public void setLettersByUserId_0(Collection<Letter> lettersByUserId_0) {
        this.lettersByUserId_0 = lettersByUserId_0;
    }

    public Collection<PostReport> getPostReportsByUserId() {
        return postReportsByUserId;
    }

    public void setPostReportsByUserId(Collection<PostReport> postReportsByUserId) {
        this.postReportsByUserId = postReportsByUserId;
    }

    public Collection<ReplyReport> getReplyReportsByUserId() {
        return replyReportsByUserId;
    }

    public void setReplyReportsByUserId(Collection<ReplyReport> replyReportsByUserId) {
        this.replyReportsByUserId = replyReportsByUserId;
    }

    public Collection<Subscribe> getSubscribesByUserId() {
        return subscribesByUserId;
    }

    public void setSubscribesByUserId(Collection<Subscribe> subscribesByUserId) {
        this.subscribesByUserId = subscribesByUserId;
    }

    public Collection<UserComment> getUserCommentsByUserId() {
        return userCommentsByUserId;
    }

    public void setUserCommentsByUserId(Collection<UserComment> userCommentsByUserId) {
        this.userCommentsByUserId = userCommentsByUserId;
    }

    public Collection<UserPost> getUserPostsByUserId() {
        return userPostsByUserId;
    }

    public void setUserPostsByUserId(Collection<UserPost> userPostsByUserId) {
        this.userPostsByUserId = userPostsByUserId;
    }

    public Collection<UserReply> getUserRepliesByUserId() {
        return userRepliesByUserId;
    }

    public void setUserRepliesByUserId(Collection<UserReply> userRepliesByUserId) {
        this.userRepliesByUserId = userRepliesByUserId;
    }

    public Collection<UserRole> getUserRolesByUserId() {
        return userRolesByUserId;
    }

    public void setUserRolesByUserId(Collection<UserRole> userRolesByUserId) {
        this.userRolesByUserId = userRolesByUserId;
    }

    public Collection<VideoReport> getVideoReportsByUserId() {
        return videoReportsByUserId;
    }

    public void setVideoReportsByUserId(Collection<VideoReport> videoReportsByUserId) {
        this.videoReportsByUserId = videoReportsByUserId;
    }

    public Collection<VideoUper> getVideoUpersByUserId() {
        return videoUpersByUserId;
    }

    public void setVideoUpersByUserId(Collection<VideoUper> videoUpersByUserId) {
        this.videoUpersByUserId = videoUpersByUserId;
    }
}
