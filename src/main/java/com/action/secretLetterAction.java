package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.pojo.Letter;
import com.pojo.User;
import com.service.userService;
import net.sf.json.JSONObject;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by frank_xiang on 2016/7/4.
 */
public class secretLetterAction extends baseAction {
    private userService userService;
    private String letterContent;
    private String receiverEmail;
    private List<Letter> letterList;
    private List<User> senderList;
    private JSONObject result;
    private Map<String, Object> dataMap = new HashMap<String, Object>();

    private int letterId;

    public String sendLetter() throws UnsupportedEncodingException {
        Map Session = ActionContext.getContext().getSession();
        String senderEmail = (String)Session.get("email");
        String temp = new String(letterContent.getBytes("ISO-8859-1"), "UTF-8");
        userService.sendLetter(senderEmail, receiverEmail, temp);
        return SUCCESS;
    }

    public String viewLetter() {
        userService.viewLetter(letterId);
        return SUCCESS;
    }

    public String listLetter() {
        dataMap.clear();
        Map Session = ActionContext.getContext().getSession();
        String email = (String)Session.get("email");
        letterList = userService.findLettersByUser(email);
        senderList = userService.findSendersByLetterList(letterList);
        dataMap.put("senderList",senderList);
        dataMap.put("letterList", letterList);
        return "json";
    }

    public String getLetterContent() {
        return letterContent;
    }

    public void setLetterContent(String letterContent) {
        this.letterContent = letterContent;
    }

    public void setUserService(userService userService) {
        this.userService = userService;
    }

    public userService getUserService(){
        return userService;
    }

    public List<Letter> getLetterList() {
        return letterList;
    }

    public void setLetterList(List<Letter> letterList) {
        this.letterList = letterList;
    }

    public JSONObject getResult() {
        return result;
    }

    public void setResult(JSONObject result) {
        this.result = result;
    }

    public int getLetterId() {
        return letterId;
    }

    public void setLetterId(int letterId) {
        this.letterId = letterId;
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public void setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
    }

    public String getReceiverEmail(){
        return receiverEmail;
    }

    public void setReceiverEmail(String receiverEmail) {
        this.receiverEmail = receiverEmail;
    }

    public List<User> getSenderList() {
        return senderList;
    }

    public void setSenderList(List<User> senderList) {
        this.senderList = senderList;
    }
}
