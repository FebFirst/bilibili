package com.dao.daoImpl;

import com.dao.interestGroupUserDAO;
import com.pojo.InterestGroup;
import com.pojo.InterestGroupUser;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by frank_xiang on 2016/7/5.
 */
public class interestGroupUserDAOImpl extends HibernateDaoSupport implements interestGroupUserDAO {
    @Override
    public void createInterestGroupUser(InterestGroupUser interestGroupUser) {
        getHibernateTemplate().save(interestGroupUser);
        getHibernateTemplate().flush();
    }

    @Override
    public void deleteInterestGroupUser(int userId, int interestGroupId) {
        getHibernateTemplate().delete(getHibernateTemplate().find("from InterestGroupUser as interestGroupUser where interestGroupUser.userId = ? and interestGroupUser.interestGroupId = ?", userId, interestGroupId).get(0));
        getHibernateTemplate().flush();
    }

    @Override
    public void updateInterestGroupUser(InterestGroupUser interestGroupUser) {
        getHibernateTemplate().merge(interestGroupUser);
    }

    @Override
    public InterestGroupUser findInterestGroupUserByKeys(int userId, int interestGroupId) {
//        return (InterestGroupUser) getHibernateTemplate().find("from InterestGroupUser where InterestGroupUser.userId = ? and InterestGroupUser.interestGroupId = ?", userId, interestGroupId);
        List<InterestGroupUser>result = (List<InterestGroupUser>) getHibernateTemplate().find("from InterestGroupUser as interestGroupUser where interestGroupUser.userId = ? and interestGroupUser.interestGroupId = ?", userId, interestGroupId);
        if(result.size() == 0)
            return null;
        else
            return result.get(0);
    }

    public List<InterestGroup> listMyGroups(int userId) {
        String hql = "select interestGroupId from InterestGroupUser where userId = ?";
        List<InterestGroup> result = new ArrayList<InterestGroup>();
        List<Integer> groupIdList= (List<Integer>) getHibernateTemplate().find(hql, userId);

        if(groupIdList.size() != 0) {
            for (int i = 0;i < groupIdList.size(); i++){
                result.add((InterestGroup) getHibernateTemplate().find("from InterestGroup as group where group.interestGroupId = ?",groupIdList.get(i)).get(0));
            }
            System.out.println(result.size()+ " " + result.get(0).getInterestGroupName());
        }

        return result;
    }
}
