package com.dao.daoImpl;

import com.dao.subcategoryDAO;
import com.pojo.Subcategory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;
/**
 * Created by frank_xiang on 2016/6/28.
 */

/**
 * subcategoryDAOImpl类对subcategoryDAO接口的方法进行了实现。<br>
 * 主要包含对subcategory类的增删改查四个功能。
 */
public class subcategoryDAOImpl extends HibernateDaoSupport implements subcategoryDAO {
    /**
     * subcategoryRole方法实现了向数据库中增加一个subcategory的功能
     * @param subcategory 传入要增加的subcategory
     */
    @Override
    public void createSubcategory(Subcategory subcategory) {
        getHibernateTemplate().save(subcategory);
        getHibernateTemplate().flush();
    }

    /**
     * deleteSubcategory方法实现了从数据库中删除一个subcategory的功能
     * @param subcategoryName 传入subcategoryName以根据subcategoryName找到要删除的subcategory
     */
    @Override
    public void deleteSubcategory(String subcategoryName) {
        getHibernateTemplate().delete((Subcategory)getHibernateTemplate().find("from Subcategory as subcategory where subcategory.subcategoryName=?",subcategoryName).get(0));
        getHibernateTemplate().flush();
    }

    /**
     * updateSubcategory方法实现了向数据库中修改一个subcategory属性的功能
     * @param subcategory 传入要修改的subcategory（包含修改属性）
     */
    @Override
    public void updateSubcategory(Subcategory subcategory) {
        getHibernateTemplate().merge(subcategory);
        getHibernateTemplate().flush();
    }

    /**
     * findSubcategoryByName方法实现了根据subcategoryName找到一个subcategory信息的功能
     * @param subcategoryName 传入subcategoryName作为查找因子
     * @return 返回需要查找的Subcategory类的对象
     */
    @Override
    public Subcategory findSubcategoryByName(String subcategoryName) {
        if(getHibernateTemplate().find("from Subcategory as subcategory where subcategory.subcategoryName=?",subcategoryName).size()==0)
            return null;
        else
            return (Subcategory)getHibernateTemplate().find("from Subcategory as subcategory where subcategory.subcategoryName=?",subcategoryName).get(0);
    }
	
	@Override
    public List<Subcategory> findSubcategoriesByCategoryName(String categoryName) {
        return (List<Subcategory>) getHibernateTemplate().find("from Subcategory as subcategory where subcategory.categoryName=?",categoryName);
    }
}
