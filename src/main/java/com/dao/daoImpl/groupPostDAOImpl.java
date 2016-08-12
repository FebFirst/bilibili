package com.dao.daoImpl;

import com.dao.groupPostDAO;
import com.pojo.GroupPost;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/7/6.
 */
public class groupPostDAOImpl extends HibernateDaoSupport implements groupPostDAO {
    @Override
    public void createGroupPost(GroupPost groupPost) {
        getHibernateTemplate().save(groupPost);
        getHibernateTemplate().flush();
    }

    @Override
    public void deleteGroupPost(int groupId, int postId) {
        getHibernateTemplate().delete(getHibernateTemplate().find("from GroupPost as grouppost where grouppost.interestGroupId = ? and grouppost.postId = ?",groupId,postId).get(0));
        getHibernateTemplate().flush();
    }
}
