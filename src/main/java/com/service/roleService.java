package com.service;

import com.pojo.Role;

/**
 * Created by Admin on 2016/6/30.
 */
public interface roleService {
    public void createRole(Role role);
    public void deleteRole(int roleId);
    public void updateRole(Role role);
    public Role findRoleById(int roleId);
}
