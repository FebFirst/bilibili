package com.dao.daoImpl;

import com.dao.roleAuthorityDAO;
import com.pojo.RoleAuthority;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/7/8.
 */
public class roleAuthorityDAOImpl extends HibernateDaoSupport implements roleAuthorityDAO {
    @Override
    public void createRoleAuthority(RoleAuthority roleAuthority) {
        getHibernateTemplate().save(roleAuthority);
        getHibernateTemplate().flush();
    }

    @Override
    public void deleteRoleAuthority(int roleId, int authId) {
        getHibernateTemplate().delete(getHibernateTemplate().find("from RoleAuthority as roleauthority where roleauthority.roleId = ? and roleauthority.authId = ?",roleId,authId).get(0));
        getHibernateTemplate().flush();
    }
}
