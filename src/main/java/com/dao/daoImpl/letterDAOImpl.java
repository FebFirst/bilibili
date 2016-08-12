package com.dao.daoImpl;

import com.dao.letterDAO;
import com.pojo.Letter;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by frank_xiang on 2016/7/4.
 */
public class letterDAOImpl extends HibernateDaoSupport implements letterDAO {
    /**
     * createLetter方法实现了向数据库中增加一个letter的功能
     * @param letter 传入要增加的letter
     */
    @Override
    public void createLetter(Letter letter) {
        System.out.println(letter.getLetterContent()+letter.getSenderId()+letter.getReceiverId());
        getHibernateTemplate().save(letter);
        getHibernateTemplate().flush();
    }

    /**
     * deleteLetter方法实现了从数据库中删除一个letter的功能
     * @param letterId 传入letterID以根据letterID找到要删除的letter
     */
    @Override
    public void deleteLetter(int letterId) {
        getHibernateTemplate().delete(getHibernateTemplate().load(Letter.class,letterId));
        getHibernateTemplate().flush();
    }

    /**
     * updateLetter方法实现了向数据库中修改一个letter属性的功能
     * @param letter 传入要修改的letter（包含修改属性）
     */
    @Override
    public void updateLetter(Letter letter) {
        getHibernateTemplate().merge(letter);
        getHibernateTemplate().flush();
    }

    /**
     * findLetterById方法实现了根据letterID找到一个letter信息的功能
     * @param letterId 传入letterID作为查找因子
     * @return 返回需要查找的Letter类的对象
     */
    @Override
    public Letter findLetterById(int letterId) {
        return getHibernateTemplate().load(Letter.class,letterId);
    }

    public List<Letter> listLetter(int userId)
    {
        String hql = "from Letter as l where l.receiverId=?";
        List<Letter>result = new ArrayList<Letter>();
        result= (List<Letter>) getHibernateTemplate().find(hql,userId);
        return result;
    }
}
