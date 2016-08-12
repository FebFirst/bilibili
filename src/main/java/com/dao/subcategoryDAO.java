package com.dao;

/**
 * Created by frank_xiang on 2016/6/28.
 */

import com.pojo.Subcategory;

import java.util.List;

/**
 * subcategoryDAO接口 提供了对subcategory进行增删改查功能的接口，将在daoImpl包中进行具体的实现。
 */
public interface subcategoryDAO {
    /**
     * subcategoryRole方法实现了向数据库中增加一个subcategory的功能
     * @param subcategory 传入要增加的subcategory
     */
    public void createSubcategory(Subcategory subcategory);

    /**
     * deleteSubcategory方法实现了从数据库中删除一个subcategory的功能
     * @param subcategoryName 传入subcategoryName以根据subcategoryName找到要删除的subcategory
     */
    public void deleteSubcategory(String subcategoryName);

    /**
     * updateSubcategory方法实现了向数据库中修改一个subcategory属性的功能
     * @param subcategory 传入要修改的subcategory（包含修改属性）
     */
    public void updateSubcategory(Subcategory subcategory);

    /**
     * findSubcategoryByName方法实现了根据subcategoryName找到一个subcategory信息的功能
     * @param subcategoryName 传入subcategoryName作为查找因子
     * @return 返回需要查找的Subcategory类的对象
     */
    public Subcategory findSubcategoryByName(String subcategoryName);

    public List<Subcategory> findSubcategoriesByCategoryName(String categoryName);
}
