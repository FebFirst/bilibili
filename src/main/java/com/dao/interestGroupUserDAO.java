package com.dao;

import com.pojo.InterestGroup;
import com.pojo.InterestGroupUser;

import java.util.List;

/**
 * Created by frank_xiang on 2016/7/5.
 */
public interface interestGroupUserDAO {
    public void createInterestGroupUser(InterestGroupUser interestGroupUser);

    public void deleteInterestGroupUser(int userId,int interestGroupId);

    public void updateInterestGroupUser(InterestGroupUser interestgroupUser);

    public InterestGroupUser findInterestGroupUserByKeys(int userId, int interestGroupId);

    /**
     * listMyGroups方法实现了列出所有与用户相关的兴趣小组的功能
     * @param userId 传入用户id作为查找对象
     * @return 返回需要查找的List<InterestGroup>类的对象
     */
    public List<InterestGroup> listMyGroups(int userId);
}
