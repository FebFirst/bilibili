package com.dao.daoImpl;

import com.dao.authorityDAO;
import com.pojo.Authority;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/6/28.
 */

/**
 * authorityDAOImpl类对authorityDAO接口的方法进行了实现。<br>
 * 主要包含对authority类的增删改查四个功能。
 */
public class authorityDAOImpl extends HibernateDaoSupport implements authorityDAO {
    /**
     * createAuthority方法实现了向数据库中增加一个authority的功能
     * @param authority 传入要增加的authority
     */
    @Override
    public void createAuthority(Authority authority) {
        getHibernateTemplate().save(authority);
        getHibernateTemplate().flush();
    }

    /**
     * deleteAuthority方法实现了从数据库中删除一个authority的功能
     * @param authId 传入authID以根据authID找到要删除的authority
     */
    @Override
    public void deleteAuthority(int authId) {
        getHibernateTemplate().delete(getHibernateTemplate().load(Authority.class,authId));
        getHibernateTemplate().flush();
    }

    /**
     * updateAuthority方法实现了向数据库中修改一个authority属性的功能
     * @param authority 传入要修改的authority（包含修改属性）
     */
    @Override
    public void updateAuthority(Authority authority) {
        getHibernateTemplate().merge(authority);
        getHibernateTemplate().flush();
    }

    /**
     * findAuthorityById方法实现了根据authID找到一个authority信息的功能
     * @param authId 传入authID作为查找因子
     * @return 返回需要查找的Authority类的对象
     */
    @Override
    public Authority findAuthorityById(int authId) {
        return getHibernateTemplate().load(Authority.class,authId);
    }
}
