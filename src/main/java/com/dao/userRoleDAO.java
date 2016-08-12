package com.dao;

import com.pojo.UserRole;

/**
 * Created by frank_xiang on 2016/7/7.
 */
public interface userRoleDAO {
    public void createUserRole(UserRole userRole);
    public void deleteUserRole(int userId, int roleId);
}
