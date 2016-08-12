<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2016/6/28
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>Video Test</title>
</head>
<body>
    <section class="first last clearfix">
        <div class="player player-video fullscreen-enabled fullscreen-hide-controls playing">
            <%--<video controls>--%>
                <%--<source src="railgun.mkv" type="video/mkv">--%>
            <%--</video>--%>
            <video src="railgun.mkv" controls="controls">
                your browser does not support the video tag
            </video>
        </div>
    </section>
</body>
</html>
