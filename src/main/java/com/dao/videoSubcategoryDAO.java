package com.dao;

import com.pojo.VideoSubcategory;

/**
 * Created by frank_xiang on 2016/7/8.
 */
public interface videoSubcategoryDAO {
    public void createVideoSubcategory(VideoSubcategory videoSubcategory);
    public void deleteVideoSubcategory(int videoId,String subcategoryName);
}
