package com.dao;

/**
 * Created by frank_xiang on 2016/6/28.
 */

import com.pojo.Series;

/**
 * seriesDAO接口 提供了对series进行增删改查功能的接口，将在daoImpl包中进行具体的实现。
 */
public interface seriesDAO {
    /**
     * createSeries方法实现了向数据库中增加一个series的功能
     * @param series 传入要增加的series
     */
    public void createSeries(Series series);

    /**
     * deleteSeries方法实现了从数据库中删除一个series的功能
     * @param seriesName 传入seriesName以根据seriesName找到要删除的series
     */
    public void deleteSeries(String seriesName);

    /**
     * updateSeries方法实现了向数据库中修改一个series属性的功能
     * @param series 传入要修改的series（包含修改属性）
     */
    public void updateSeries(Series series);

    /**
     * findSeriesByName方法实现了根据seriesName找到一个series信息的功能
     * @param seriesName 传入seriesName作为查找因子
     * @return 返回需要查找的Series类的对象
     */
    public Series findSeriesByName(String seriesName);
}
