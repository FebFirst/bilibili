package com.service.serviceImpl;

import com.dao.roleDAO;
import com.pojo.Role;
import com.service.roleService;

/**
 * Created by Admin on 2016/6/30.
 */
public class roleServiceImpl implements roleService {
    private roleDAO roleDAO;

    public roleDAO getRoleDAO() {
        return roleDAO;
    }

    public void setRoleDAO(roleDAO roleDAO) {
        this.roleDAO = roleDAO;
    }

    @Override
    public void createRole(Role role) {
        roleDAO.createRole(role);
    }

    @Override
    public void deleteRole(int roleId) {
        roleDAO.deleteRole(roleId);
    }

    @Override
    public void updateRole(Role role) {
        roleDAO.updateRole(role);
    }

    @Override
    public Role findRoleById(int roleId) {
        return roleDAO.findRoleById(roleId);
    }
}
