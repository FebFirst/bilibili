package com.dao.daoImpl;

import com.dao.favouriteGroupDAO;
import com.pojo.FavoriteGroup;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by frank_xiang on 2016/7/5.
 */
public class favouriteGroupDAOImpl extends HibernateDaoSupport implements favouriteGroupDAO {
    @Override
    public void createFavouriteGroup(FavoriteGroup favoriteGroup) {
        getHibernateTemplate().save(favoriteGroup);
        getHibernateTemplate().flush();
    }

    @Override
    public void deleteFavouriteGroup(int groupId) {
        getHibernateTemplate().delete(getHibernateTemplate().load(FavoriteGroup.class,groupId));
        getHibernateTemplate().flush();
    }

    @Override
    public void updateFavouriteGroup(FavoriteGroup favoriteGroup) {
        getHibernateTemplate().merge(favoriteGroup);
        getHibernateTemplate().flush();
    }

    @Override
    public FavoriteGroup findFavouriteGroupById(int groupId) {
        return getHibernateTemplate().load(FavoriteGroup.class,groupId);
    }

    @Override
    public List<FavoriteGroup> findFavouriteGroupsByUserId(int userId) {
        String hql = "from FavoriteGroup as favoriteGroup where favoriteGroup.userId =?";
        List<FavoriteGroup>result = new ArrayList<FavoriteGroup>();
        result= (List<FavoriteGroup>) getHibernateTemplate().find(hql,userId);
        return result;
    }

    public int findFavoriteGroupIdByFavoriteGroupName(String name)
    {
        String hql = "select favoriteGroup.groupId from FavoriteGroup as favoriteGroup where favoriteGroup.groupName =?";
        int result= (int)Integer.parseInt( getHibernateTemplate().find(hql,name).get(0).toString());
        return result;
    }

}
