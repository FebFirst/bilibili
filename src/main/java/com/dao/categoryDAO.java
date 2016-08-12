package com.dao;

/**
 * Created by frank_xiang on 2016/6/28.
 */

import com.pojo.Category;

/**
 * categoryDAO接口 提供了对category进行增删改查功能的接口，将在daoImpl包中进行具体的实现。
 */
public interface categoryDAO {
    /**
     * createCategory方法实现了向数据库中增加一个category的功能
     * @param category 传入要增加的category
     */
    public void createCategory(Category category);

    /**
     * deleteCategory方法实现了从数据库中删除一个category的功能
     * @param categoryName 传入categoryName以根据categoryName找到要删除的category
     */
    public void deleteCategory(String categoryName);

    /**
     * updateCategory方法实现了向数据库中修改一个category属性的功能
     * @param category 传入要修改的category（包含修改属性）
     */
    public void updateCategory(Category category);

    /**
     * findCategoryByName方法实现了根据categoryName找到一个category信息的功能
     * @param categoryName 传入categoryName作为查找因子
     * @return 返回需要查找的Category类的对象
     */
    public Category findCategoryByName(String categoryName);
}
