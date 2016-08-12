package com.service;

import com.pojo.Post;
import com.pojo.User;

import java.util.List;

/**
 * Created by frank_xiang on 2016/7/6.
 */
public interface postService {
    /**
     * createPost方法实现了向数据库中增加一个post的功能
     * @param post 传入要增加的post
     */
    public void createPost(Post post);

    /**
     * deletePost方法实现了从数据库中删除一个post的功能
     * @param postId 传入postId以根据postId找到要删除的post
     */
    public void deletePost(int postId);

    /**
     * updatePost方法实现了向数据库中修改一个post属性的功能
     * @param post 传入要修改的post（包含修改属性）
     */
    public void updatePost(Post post);

    /**
     * findPostById方法实现了根据postId找到一个post信息的功能
     * @param postId 传入postId作为查找因子
     * @return 返回需要查找的Post类的对象
     */
    public Post findPostById(int postId);

//    public int findMaxPostId();

    public void postPublish(String email, int groupId, Post post);

    public void reportPost(int postId, String email, String reason);

    public void postThumbCount(int postId);

    public List<Post> findPostsByGroupId(int groupId);

    public List<User> findPostPushersByPostList(List<Post>postList);

    public User findPostPusherByPostId(int postId);

    public List<Post> findAllPosts();
}
