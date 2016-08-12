package com.dao;

/**
 * Created by frank_xiang on 2016/6/28.
 */

import com.pojo.Tag;

/**
 * tagDAO接口 提供了对tag进行增删改查功能的接口，将在daoImpl包中进行具体的实现。
 */
public interface tagDAO {
    /**
     * createTag方法实现了向数据库中增加一个tag的功能
     * @param tag 传入要增加的tag
     */
    public void createTag(Tag tag);

    /**
     * deleteTag方法实现了从数据库中删除一个tag的功能
     * @param tagId 传入tagId以根据tagId找到要删除的tag
     */
    public void deleteTag(int tagId);

    /**
     * updateTag方法实现了向数据库中修改一个tag属性的功能
     * @param tag 传入要修改的tag（包含修改属性）
     */
    public void updateTag(Tag tag);

    /**
     * findTagById方法实现了根据tagId找到一个tag信息的功能
     * @param tagId 传入tagId作为查找因子
     * @return 返回需要查找的Tag类的对象
     */
    public Tag findTagById(int tagId);
}
