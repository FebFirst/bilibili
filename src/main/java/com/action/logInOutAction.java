package com.action;


import com.opensymphony.xwork2.ActionContext;
import java.util.Map;
import com.service.userService;


/**
 * Created by Admin on 2016/6/27.
 */
public class logInOutAction extends baseAction {
    private static final long serialVersionUID = 1L;
    private userService userService;
    private String email;
    private String password;

    public String logIn(){
        if (email.equals("") || password.equals("")) {
            return ERROR;
        }
        Boolean ret = userService.validateUser(email, password);
        System.out.println("logIn " + ret);
        if (!ret) {
            return ERROR;
        }
        Map Session = ActionContext.getContext().getSession();
//        String md5 = (String)Session.get("md5RandomKey");
//        System.out.println(password);
//        System.out.println(md5);
        Session.put("email", email);
        Session.put("username", userService.findUserByEmail(email).getUsername());
        if (ret.equals("N")){
            return "user";
        } else {
            return "admin";
        }
    }

    public String logOut(){
        Map Session = ActionContext.getContext().getSession();
        Session.clear();
        return SUCCESS;
    }

    public userService getUserService() {
        return userService;
    }

    public void setUserService(userService userService) {
        this.userService = userService;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail(){
        return email;
    }
}
