package com.dao;

import com.pojo.RoleAuthority;

/**
 * Created by frank_xiang on 2016/7/8.
 */
public interface roleAuthorityDAO {
    public void createRoleAuthority(RoleAuthority roleAuthority);
    public void deleteRoleAuthority(int roleId,int authId);
}
