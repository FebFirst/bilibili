package com.pojo;

/**
 * Created by Admin on 2016/7/12.
 */
public class RoleAuthority {
    private int roleId;
    private int authId;
    private Role roleByRoleId;
    private Authority authorityByAuthId;

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getAuthId() {
        return authId;
    }

    public void setAuthId(int authId) {
        this.authId = authId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RoleAuthority that = (RoleAuthority) o;

        if (roleId != that.roleId) return false;
        if (authId != that.authId) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = roleId;
        result = 31 * result + authId;
        return result;
    }

    public Role getRoleByRoleId() {
        return roleByRoleId;
    }

    public void setRoleByRoleId(Role roleByRoleId) {
        this.roleByRoleId = roleByRoleId;
    }

    public Authority getAuthorityByAuthId() {
        return authorityByAuthId;
    }

    public void setAuthorityByAuthId(Authority authorityByAuthId) {
        this.authorityByAuthId = authorityByAuthId;
    }
}
