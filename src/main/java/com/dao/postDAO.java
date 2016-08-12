package com.dao;

/**
 * Created by frank_xiang on 2016/6/28.
 */

import com.pojo.Post;
import javafx.util.Pair;

import java.util.List;

/**
 * postDAO接口 提供了对post进行增删改查功能的接口，将在daoImpl包中进行具体的实现。
 */
public interface postDAO {
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

    public int findMaxPostId();

    public List<Post> findPostsByGroupId(int groupId);

    public List<Post> findAllPosts();
}
