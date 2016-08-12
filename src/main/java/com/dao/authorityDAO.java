package com.dao;

/**
 * Created by frank_xiang on 2016/6/28.
 */


import com.pojo.Authority;

/**
 * authorityDAO接口 提供了对authority进行增删改查功能的接口，将在daoImpl包中进行具体的实现。
 */
public interface authorityDAO {
    /**
     * createAuthority方法实现了向数据库中增加一个authority的功能
     * @param authority 传入要增加的authority
     */
    public void createAuthority(Authority authority);

    /**
     * deleteAuthority方法实现了从数据库中删除一个authority的功能
     * @param authId 传入authID以根据authID找到要删除的authority
     */
    public void deleteAuthority(int authId);

    /**
     * updateAuthority方法实现了向数据库中修改一个authority属性的功能
     * @param authority 传入要修改的authority（包含修改属性）
     */
    public void updateAuthority(Authority authority);

    /**
     * findAuthorityById方法实现了根据authID找到一个authority信息的功能
     * @param authId 传入authID作为查找因子
     * @return 返回需要查找的Authority类的对象
     */
    public Authority findAuthorityById(int authId);
}
