package com.dao;

import com.pojo.Letter;

import java.util.List;

/**
 * Created by frank_xiang on 2016/7/4.
 */

/**
 * letterDAO接口 提供了对letter进行增删改查功能的接口，将在daoImpl包中进行具体的实现。
 */
public interface letterDAO {
    /**
     * createLetter方法实现了向数据库中增加一个letter的功能
     * @param letter 传入要增加的letter
     */
    public void createLetter(Letter letter);

    /**
     * deleteLetter方法实现了从数据库中删除一个letter的功能
     * @param letterId 传入letterID以根据letterID找到要删除的letter
     */
    public void deleteLetter(int letterId);

    /**
     * updateLetter方法实现了向数据库中修改一个letter属性的功能
     * @param letter 传入要修改的letter（包含修改属性）
     */
    public void updateLetter(Letter letter);

    /**
     * findLetterById方法实现了根据letterID找到一个letter信息的功能
     * @param letterId 传入letterID作为查找因子
     * @return 返回需要查找的Letter类的对象
     */
    public Letter findLetterById(int letterId);

    public List<Letter> listLetter(int userId);
}
