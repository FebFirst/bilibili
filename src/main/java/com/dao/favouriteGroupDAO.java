package com.dao;

import com.pojo.FavoriteGroup;

import java.util.List;

/**
 * Created by frank_xiang on 2016/7/5.
 */
public interface favouriteGroupDAO {
    public void createFavouriteGroup(FavoriteGroup favoriteGroup);
    public void deleteFavouriteGroup(int groupId);
    public void updateFavouriteGroup(FavoriteGroup favoriteGroup);
    public FavoriteGroup findFavouriteGroupById(int groupId);
    public List<FavoriteGroup> findFavouriteGroupsByUserId(int userId);
    public int findFavoriteGroupIdByFavoriteGroupName(String name);

}
