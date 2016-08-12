package com.dao.daoImpl;

import com.dao.categoryDAO;
import com.pojo.Category;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/6/28.
 */

/**
 * categoryDAOImpl类对categoryDAO接口的方法进行了实现。<br>
 * 主要包含对category类的增删改查四个功能。
 */
public class categoryDAOImpl extends HibernateDaoSupport implements categoryDAO {
    /**
     * createCategory方法实现了向数据库中增加一个category的功能
     * @param category 传入要增加的category
     */
    @Override
    public void createCategory(Category category) {
        getHibernateTemplate().save(category);
        getHibernateTemplate().flush();
    }

    /**
     * deleteCategory方法实现了从数据库中删除一个category的功能
     * @param categoryName 传入categoryName以根据categoryName找到要删除的category
     */
    @Override
    public void deleteCategory(String categoryName) {
        getHibernateTemplate().delete(getHibernateTemplate().find("from Category as category where category.categoryName=?",categoryName).get(0));
        getHibernateTemplate().flush();
    }

    /**
     * updateCategory方法实现了向数据库中修改一个category属性的功能
     * @param category 传入要修改的category（包含修改属性）
     */
    @Override
    public void updateCategory(Category category) {
        getHibernateTemplate().merge(category);
        getHibernateTemplate().flush();
    }

    /**
     * findCategoryByName方法实现了根据categoryName找到一个category信息的功能
     * @param categoryName 传入categoryName作为查找因子
     * @return 返回需要查找的Category类的对象
     */
    @Override
    public Category findCategoryByName(String categoryName) {
        return (Category) getHibernateTemplate().find("from Category where Category.categoryName = ?", categoryName);
//        if(getHibernateTemplate().find("from Category where Category .categoryName=?",categoryName).size()==0)
//            return null;
//        else
//            return (Category)getHibernateTemplate().find("from Category as category where category.categoryName=?",categoryName).get(0);
    }
}
