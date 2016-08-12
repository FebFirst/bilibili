package com.dao;

/**
 * Created by frank_xiang on 2016/6/28.
 */

import com.pojo.Role;

/**
 * roleDAO接口 提供了对role进行增删改查功能的接口，将在daoImpl包中进行具体的实现。
 */
public interface roleDAO {
    /**
     * createRole方法实现了向数据库中增加一个role的功能
     * @param role 传入要增加的role
     */
    public void createRole(Role role);

    /**
     * deleteRole方法实现了从数据库中删除一个role的功能
     * @param roleId 传入roleId以根据roleId找到要删除的role
     */
    public void deleteRole(int roleId);

    /**
     * updateRole方法实现了向数据库中修改一个role属性的功能
     * @param role 传入要修改的role（包含修改属性）
     */
    public void updateRole(Role role);

    /**
     * findRoleById方法实现了根据roleId找到一个role信息的功能
     * @param roleId 传入roleId作为查找因子
     * @return 返回需要查找的Role类的对象
     */
    public Role findRoleById(int roleId);
}
