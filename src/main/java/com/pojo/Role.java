package com.pojo;

import java.util.Collection;

/**
 * Created by Admin on 2016/7/12.
 */
public class Role {
    private int roleId;
    private String roleName;
    private Collection<RoleAuthority> roleAuthoritiesByRoleId;
    private Collection<UserRole> userRolesByRoleId;

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Role role = (Role) o;

        if (roleId != role.roleId) return false;
        if (roleName != null ? !roleName.equals(role.roleName) : role.roleName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = roleId;
        result = 31 * result + (roleName != null ? roleName.hashCode() : 0);
        return result;
    }

    public Collection<RoleAuthority> getRoleAuthoritiesByRoleId() {
        return roleAuthoritiesByRoleId;
    }

    public void setRoleAuthoritiesByRoleId(Collection<RoleAuthority> roleAuthoritiesByRoleId) {
        this.roleAuthoritiesByRoleId = roleAuthoritiesByRoleId;
    }

    public Collection<UserRole> getUserRolesByRoleId() {
        return userRolesByRoleId;
    }

    public void setUserRolesByRoleId(Collection<UserRole> userRolesByRoleId) {
        this.userRolesByRoleId = userRolesByRoleId;
    }
}
