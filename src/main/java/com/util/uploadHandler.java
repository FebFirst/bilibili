package com.util;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.*;
import java.util.HashMap;
import java.util.Map;

import static org.apache.struts2.ServletActionContext.getServletContext;

/**
 * Created by Admin on 2016/6/28.
 */
public class uploadHandler extends ActionSupport {
    //private static final String storagePath = "E:\\Workspace\\jvideo\\uploadTest\\";
    //private static final String storagePath = "D:\\WorkSpace\\jvideo\\fileUpload\\";
    private File upload;
    private String uploadFileName;
    private String uploadContentType;
    private Map<String, Object> userSession = new HashMap<String, Object>();

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public String execute() throws Exception {

        String storagePath=getServletContext().getRealPath("videos")+"\\temp\\";
        System.out.println("execute " + storagePath+uploadFileName);
        FileInputStream fileInputStream = new FileInputStream(upload);
        File file = new File(storagePath + uploadFileName);  // + "." + fileType It is possible to have same filename
        if (!file.exists()) {
            file.createNewFile();
        }
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        byte[] buf = new byte[4096];
        int i;
        while ((i = fileInputStream.read(buf)) != -1) {
            fileOutputStream.write(buf, 0, i);
        }
        //userSession.put("videoName",storagePath+uploadFileName);
        java.util.Map<String,Object> Session = ActionContext.getContext().getSession();
        Session.put("videoName",storagePath+uploadFileName);
        ActionContext.getContext().setSession(Session);
        System.out.println("End.");
        return SUCCESS;
    }
}
