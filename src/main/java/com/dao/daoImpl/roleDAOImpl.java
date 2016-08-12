package com.dao.daoImpl;

import com.dao.roleDAO;
import com.pojo.Role;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/6/28.
 */

/**
 * roleDAOImpl类对roleDAO接口的方法进行了实现。<br>
 * 主要包含对role类的增删改查四个功能。
 */
public class roleDAOImpl extends HibernateDaoSupport implements roleDAO {
    /**
     * createRole方法实现了向数据库中增加一个role的功能
     * @param role 传入要增加的role
     */
    @Override
    public void createRole(Role role) {
        getHibernateTemplate().save(role);
        getHibernateTemplate().flush();
    }

    /**
     * deleteRole方法实现了从数据库中删除一个role的功能
     * @param roleId 传入roleId以根据roleId找到要删除的role
     */
    @Override
    public void deleteRole(int roleId) {
        getHibernateTemplate().delete(getHibernateTemplate().load(Role.class,roleId));
        getHibernateTemplate().flush();
    }

    /**
     * updateRole方法实现了向数据库中修改一个role属性的功能
     * @param role 传入要修改的role（包含修改属性）
     */
    @Override
    public void updateRole(Role role) {
        getHibernateTemplate().merge(role);
        getHibernateTemplate().flush();
    }

    /**
     * findRoleById方法实现了根据roleId找到一个role信息的功能
     * @param roleId 传入roleId作为查找因子
     * @return 返回需要查找的Role类的对象
     */
    @Override
    public Role findRoleById(int roleId) {
        return getHibernateTemplate().load(Role.class,roleId);
    }
}
