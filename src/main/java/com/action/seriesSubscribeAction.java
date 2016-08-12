package com.action;

import com.opensymphony.xwork2.ActionContext;
import com.service.userService;

import java.util.Map;

/**
 * Created by frank_xiang on 2016/7/6.
 */
public class seriesSubscribeAction extends baseAction{
    private userService userService;
    private String seriesName;

    @Override
    public String execute() throws Exception{
        Map Session = ActionContext.getContext().getSession();
        String email = (String)Session.get("email");
        userService.subscribeSeries(email, seriesName);
        return SUCCESS;
    }

    public com.service.userService getUserService() {
        return userService;
    }

    public void setUserService(com.service.userService userService) {
        this.userService = userService;
    }

    public String getSeriesName() {
        return seriesName;
    }

    public void setSeriesName(String seriesName) {
        this.seriesName = seriesName;
    }
}
