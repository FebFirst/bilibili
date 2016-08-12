package com.dao.daoImpl;

import com.dao.interestGroupDAO;
import com.pojo.InterestGroup;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by frank_xiang on 2016/6/28.
 */

/**
 * interestsgroupDAOImpl类对interestsgroupDAO接口的方法进行了实现。<br>
 * 主要包含对interestsgroup类的增删改查四个功能。
 */
public class interestGroupDAOImpl extends HibernateDaoSupport implements interestGroupDAO {
    /**
     * createInterestsgroup方法实现了向数据库中增加一个interestsgroup的功能
     * @param interestGroup 传入要增加的interestsgroup
     */
    @Override
    public void createInterestGroup(InterestGroup interestGroup) {
        getHibernateTemplate().save(interestGroup);
        getHibernateTemplate().flush();
    }

    /**
     * deleteInterestsgroup方法实现了从数据库中删除一个interestsgroup的功能
     * @param interestGroupId 传入commentId以根据interestsgroupId找到要删除的interestsgroup
     */
    @Override
    public void deleteInterestGroup(int interestGroupId) {
        getHibernateTemplate().delete(getHibernateTemplate().load(InterestGroup.class, interestGroupId));
        getHibernateTemplate().flush();
    }

    /**
     * updateInterestsgroup方法实现了向数据库中修改一个interestsgroup属性的功能
     * @param interestGroup 传入要修改的interestsgroup（包含修改属性）
     */
    @Override
    public void updateInterestGroup(InterestGroup interestGroup) {
        getHibernateTemplate().merge(interestGroup);
        getHibernateTemplate().flush();
    }

    /**
     * findInterestsgroupById方法实现了根据interestsgroupId找到一个interestsgroup信息的功能
     * @param interestGroupId 传入interestsgroupId作为查找因子
     * @return 返回需要查找的Interestsgroup类的对象
     */
    @Override
    public InterestGroup findInterestGroupById(int interestGroupId) {
        return getHibernateTemplate().load(InterestGroup.class,interestGroupId);
    }

    public List<InterestGroup> listGroups() {
        String hql = "from InterestGroup";
        List<InterestGroup> result = (List<InterestGroup>) getHibernateTemplate().find(hql);
        System.out.println(result.size());
        return result;
    }

}
