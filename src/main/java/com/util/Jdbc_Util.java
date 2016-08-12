package com.util;

/**
 * Created by frank_xiang on 2016/7/12.
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * JdbcUtil.java
 * @version 1.0
 * @createTime JDBC获取Connection工具类
 */
public class Jdbc_Util {
    private static Connection conn = null;
    private static final String URL = "jdbc:mysql://127.0.0.1/bilibili?autoReconnect=true&characterEncoding=utf8";
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private static final String USER_NAME = "root";
    private static final String PASSWORD = "slt0.142857";

    public static Connection getConnection() {
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(URL, USER_NAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}