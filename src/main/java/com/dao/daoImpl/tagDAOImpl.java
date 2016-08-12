package com.dao.daoImpl;

import com.dao.tagDAO;
import com.pojo.Tag;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/6/28.
 */

/**
 * tagDAOImpl类对tagDAO接口的方法进行了实现。<br>
 * 主要包含对tag类的增删改查四个功能。
 */
public class tagDAOImpl extends HibernateDaoSupport implements tagDAO {
    /**
     * createTag方法实现了向数据库中增加一个tag的功能
     * @param tag 传入要增加的tag
     */
    @Override
    public void createTag(Tag tag) {
        getHibernateTemplate().save(tag);
        getHibernateTemplate().flush();
    }

    /**
     * deleteTag方法实现了从数据库中删除一个tag的功能
     * @param tagId 传入tagId以根据tagId找到要删除的tag
     */
    @Override
    public void deleteTag(int tagId) {
        getHibernateTemplate().delete(getHibernateTemplate().load(Tag.class,tagId));
        getHibernateTemplate().flush();
    }

    /**
     * updateTag方法实现了向数据库中修改一个tag属性的功能
     * @param tag 传入要修改的tag（包含修改属性）
     */
    @Override
    public void updateTag(Tag tag) {
        getHibernateTemplate().merge(tag);
        getHibernateTemplate().flush();
    }

    /**
     * findTagById方法实现了根据tagId找到一个tag信息的功能
     * @param tagId 传入tagId作为查找因子
     * @return 返回需要查找的Tag类的对象
     */
    @Override
    public Tag findTagById(int tagId) {
        return getHibernateTemplate().load(Tag.class,tagId);
    }
}
