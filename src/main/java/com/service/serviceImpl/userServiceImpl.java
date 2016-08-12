package com.service.serviceImpl;

import com.dao.*;
import com.pojo.*;
import com.service.userService;

import java.util.List;

/**
 * Created by Admin on 2016/6/27.
 */
public class userServiceImpl implements userService {
    private userDAO userDAO;
    private letterDAO letterDAO;
    private interestGroupUserDAO interestGroupUserDAO;
    private interestGroupDAO interestGroupDAO;
    private subscribeDAO subscribeDAO;
    private favouriteGroupDAO favouritegroupDAO;
    private videoFavouriteDAO videofavouriteDAO;
    private userRoleDAO userRoleDAO;

    public void setInterestGroupDAO(interestGroupDAO interestGroupDAO) {
        this.interestGroupDAO = interestGroupDAO;
    }

    @Override
    public void createUser(User user) {
        userDAO.createUser(user);
    }

    @Override
    public void deleteUser(int userId) {
        userDAO.deleteUser(userId);
    }

    @Override
    public void updateUser(User user) {
        userDAO.updateUser(user);
    }

    @Override
    public List<User> findAllUser() {
        return userDAO.findAllUsers();
    }
    @Override
    public List<User> findLastDaySignUp(){
        return userDAO.findLastDaySignUp();
    }
    @Override
    public User findUserById(int userId) {
        return userDAO.findUserById(userId);
    }

    @Override
    public User findUserByUsername(String email) {
        return userDAO.findUserByEmail(email);
    }

    @Override
    public User findUserByEmail(String email) {
        return userDAO.findUserByEmail(email);
    }

    @Override
    public boolean validateUser(String email, String password) {
        System.out.println(email);
        boolean result = true;
        User user;
        if ((user = findUserByEmail(email)) == null) {
            result = false;
            return result;
        }
        String pwd = new String(user.getPwdhash());
        if (!(pwd.equals(password)))
            result = false;
        return result;
    }

    @Override
    public boolean validateRegister(String username, String password, String email) {
        boolean result = true;
        if ((findUserByUsername(username)) != null || findUserByEmail(email) != null)
            result = false;
        return result;
    }

    @Override
    public void sendLetter(String senderEmail, String receiverEmail, String letterContent) {
        Letter letter = new Letter();
        letter.setLetterContent(letterContent);
        letter.setSenderId(findUserByEmail(senderEmail).getUserId());
        letter.setReceiverId(findUserByEmail(receiverEmail).getUserId());
        letterDAO.createLetter(letter);
    }

    @Override
    public void viewLetter(int letterId) {
        Letter letter = letterDAO.findLetterById(letterId);
        //letter.setIsRead(1);
        letterDAO.updateLetter(letter);
    }

    @Override
    public void addInterestGroup(String email, int interestGroupId) {
        int userId = findUserByEmail(email).getUserId();
        InterestGroupUser interestGroupUser = new InterestGroupUser();
        interestGroupUser.setInterestGroupId(interestGroupId);
        interestGroupUser.setUserId(userId);
        interestGroupUserDAO.createInterestGroupUser(interestGroupUser);
    }

    @Override
    public void quitInterestGroup(String email, int interestGroupId) {
        int userId = findUserByEmail(email).getUserId();
        interestGroupUserDAO.deleteInterestGroupUser(userId,interestGroupId);
    }

    @Override
    public boolean isJoinedInterestGroup(String email, int interestGroupId) {
        int userId = findUserByEmail(email).getUserId();
        return !(interestGroupUserDAO.findInterestGroupUserByKeys(userId,interestGroupId)==null);
    }


    @Override
    public void subscribeSeries(String email, String seriesName) {
        int userId = userDAO.findUserByEmail(email).getUserId();
        Subscribe subscribe = new Subscribe();
        subscribe.setUserId(userId);
        subscribe.setSeriesName(seriesName);
        subscribeDAO.createSubscribe(subscribe);
    }

    @Override
    public void addFavouriteGroup(String email,String groupName) {
        int userId = userDAO.findUserByEmail(email).getUserId();
        FavoriteGroup favoriteGroup = new FavoriteGroup();
        favoriteGroup.setUserId(userId);
        favoriteGroup.setGroupName(groupName);
        favouritegroupDAO.createFavouriteGroup(favoriteGroup);
    }

    @Override
    public void addVideoToFavouriteGroup(int videoId, int groupId) {
        VideoFavorite videoFavorite = new VideoFavorite();
        videoFavorite.setVideoId(videoId);
        videoFavorite.setGroupId(groupId);
        videofavouriteDAO.createVideoFavourite(videoFavorite);
    }

    @Override
    public void giveUserRole(String email, int roleId) {
        int userId = userDAO.findUserByEmail(email).getUserId();
        UserRole userRole = new UserRole();
        userRole.setUserId(userId);
        userRole.setRoleId(roleId);
        userRoleDAO.createUserRole(userRole);
    }

    @Override
    public List<FavoriteGroup> findFavourtiteGroupsByEmail(String email) {
        int userId = userDAO.findUserByEmail(email).getUserId();
        return favouritegroupDAO.findFavouriteGroupsByUserId(userId);
    }

    public void setLetterDAO(com.dao.letterDAO letterDAO) {
        this.letterDAO = letterDAO;
    }

    public void setInterestGroupUserDAO(interestGroupUserDAO interestGroupUserDAO) {
        this.interestGroupUserDAO = interestGroupUserDAO;
    }

    public void setUserDAO(userDAO userDAO) {
        this.userDAO = userDAO;
    }

    public userDAO getUserDAO() {
        return userDAO;
    }

    public com.dao.subscribeDAO getSubscribeDAO() {
        return subscribeDAO;
    }

    public void setSubscribeDAO(com.dao.subscribeDAO subscribeDAO) {
        this.subscribeDAO = subscribeDAO;
    }

    public void setFavouriteGroupDAO(favouriteGroupDAO favouritegroupDAO) {
        this.favouritegroupDAO = favouritegroupDAO;
    }

    public void setVideoFavouriteDAO(videoFavouriteDAO videofavouriteDAO) {
        this.videofavouriteDAO = videofavouriteDAO;
    }

    public userRoleDAO getUserRoleDAO() {
        return userRoleDAO;
    }

    public void setUserRoleDAO(userRoleDAO userRoleDAO) {
        this.userRoleDAO = userRoleDAO;
    }

    public List<Letter> findLettersByUser(String email) {
        int userId = userDAO.findUserByEmail(email).getUserId();
        return letterDAO.listLetter(userId);
    }

    @Override
    public List<User> findSendersByLetterList(List<Letter> letterList) {
        return userDAO.findSendersByLetterList(letterList);
    }

    public List<InterestGroup> findGroupsByEmail(String email) {
        int userId = userDAO.findUserByEmail(email).getUserId();
        return interestGroupUserDAO.listMyGroups(userId);
    }

    public List<InterestGroup> findGroupsAll()
    {
        return interestGroupDAO.listGroups();
    }

    @Override
    public InterestGroup findGroupById(int interestGroupId) {
        return interestGroupDAO.findInterestGroupById(interestGroupId);
    }

    public int findGroupIdByGroupName(String name)
    {
        return favouritegroupDAO.findFavoriteGroupIdByFavoriteGroupName(name);
    }

}
