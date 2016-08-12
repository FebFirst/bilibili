package com.dao.daoImpl;

import com.dao.seriesDAO;
import com.pojo.Series;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * Created by frank_xiang on 2016/6/28.
 */

/**
 * seriesDAOImpl类对seriesDAO接口的方法进行了实现。<br>
 * 主要包含对series类的增删改查四个功能。
 */
public class seriesDAOImpl extends HibernateDaoSupport implements seriesDAO {
    /**
     * createSeries方法实现了向数据库中增加一个series的功能
     * @param series 传入要增加的series
     */
    @Override
    public void createSeries(Series series) {
        getHibernateTemplate().save(series);
        getHibernateTemplate().flush();
    }

    /**
     * deleteSeries方法实现了从数据库中删除一个series的功能
     * @param seriesName 传入seriesName以根据seriesName找到要删除的series
     */
    @Override
    public void deleteSeries(String seriesName) {
        getHibernateTemplate().delete((Series)getHibernateTemplate().find("from Series as series where series.seriesName=?",seriesName).get(0));
        getHibernateTemplate().flush();
    }

    /**
     * updateSeries方法实现了向数据库中修改一个series属性的功能
     * @param series 传入要修改的series（包含修改属性）
     */
    @Override
    public void updateSeries(Series series) {
        getHibernateTemplate().merge(series);
        getHibernateTemplate().flush();
    }

    /**
     * findSeriesByName方法实现了根据seriesName找到一个series信息的功能
     * @param seriesName 传入seriesName作为查找因子
     * @return 返回需要查找的Series类的对象
     */
    @Override
    public Series findSeriesByName(String seriesName) {
        if(getHibernateTemplate().find("from Series where Series .seriesName=?",seriesName).size()==0)
            return null;
        else
            return (Series)getHibernateTemplate().find("from Series as series where series.seriesName=?",seriesName).get(0);
    }
}
