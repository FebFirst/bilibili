package com.dao;

import com.dao.daoImpl.videoDAOImpl;

/**
 * Created by frank_xiang on 2016/7/1.
 */
public class DAOFactory {
    private static DAOFactory daoFactory = new DAOFactory();

    //单例设计模式, 私有构造,对外提供获取创建的对象的唯一接口,
    private DAOFactory(){
    }

    public static DAOFactory getInstance(){
        return daoFactory;
    }

    public static videoDAO getVideoDao(){
        return new videoDAOImpl();
    }
}
