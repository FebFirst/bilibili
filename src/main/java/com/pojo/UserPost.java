package com.pojo;

/**
 * Created by Admin on 2016/7/12.
 */
public class UserPost {
    private int userId;
    private int postId;
    private Byte isThumb;
    private User userByUserId;
    private Post postByPostId;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public Byte getIsThumb() {
        return isThumb;
    }

    public void setIsThumb(Byte isThumb) {
        this.isThumb = isThumb;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserPost userPost = (UserPost) o;

        if (userId != userPost.userId) return false;
        if (postId != userPost.postId) return false;
        if (isThumb != null ? !isThumb.equals(userPost.isThumb) : userPost.isThumb != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId;
        result = 31 * result + postId;
        result = 31 * result + (isThumb != null ? isThumb.hashCode() : 0);
        return result;
    }

    public User getUserByUserId() {
        return userByUserId;
    }

    public void setUserByUserId(User userByUserId) {
        this.userByUserId = userByUserId;
    }

    public Post getPostByPostId() {
        return postByPostId;
    }

    public void setPostByPostId(Post postByPostId) {
        this.postByPostId = postByPostId;
    }
}
