<%--
  Created by IntelliJ IDEA.
  User: slt
  Date: 2016/6/28
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Web App Capable-->
    <meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>Jplay 注册</title>
    <meta name="description" content="Free Responsive Html5 Css3 Templates | zerotheme.com">
    <meta name="author" content="www.zerotheme.com">

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="css/zerogrid.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/menu.css">
    <!-- Owl Carousel Assets -->
    <link href="css/owl.carousel.css" rel="stylesheet">
    <link href="css/owl.theme.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">





    <!--[if lt IE 8]>
    <div style=' clear: both; text-align:center; position: relative;'>
        <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
            <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
    </div>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <script src="js/css3-mediaqueries.js"></script>

    <![endif]-->

</head>

<body id="wrapper" >
<div class="wrap-body">

    <!--////////////////////////////////////Header-->
    <header>
        <div class="wrap-header">
            <div class="zerogrid">
                <div class="row">
                    <a href="index.jsp" class="logo"><img src="images/111.jpg" /></a>
                    <ul class="social">
                        <%--<li><a href="upload.jsp" title="Upload Video"><i class="fa fa-upload"></i>上传</a></li>--%>
                        <li><a href="login.jsp" title="Log in"><i class="fa fa-user"></i>登陆</a></li>
                        <li><a href="register.jsp" title="Register"><i class="fa fa-bell"></i>注册</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>

    <!--////////////////////////////////////Menu-->
    <a href="#" class="nav-toggle">Toggle Navigation</a>
    <nav class="cmn-tile-nav">
        <ul class="clearfix">
            <li class="colour-1"><a href="index.jsp">首页</a></li>
            <li class="colour-2"><a href="gallery.jsp">番剧</a></li>
            <li class="colour-3"><a href="gallery.jsp">动画</a></li>
            <li class="colour-4"><a href="gallery.jsp">直播</a></li>
            <li class="colour-5"><a href="gallery.jsp">音乐</a></li>
            <li class="colour-6"><a href="gallery.jsp">舞蹈</a></li>
            <li class="colour-7"><a href="gallery.jsp">鬼畜</a></li>
            <li class="colour-8"><a href="gallery.jsp">更多</a></li>
        </ul>
    </nav>


        <section id="container" class="index-page" >
        <div class="wrap-container zerogrid" >
            <div class="row">
                <div class="logIn-content" class="col-2-3" style="height: 700px">
                    <h2>注册</h2>
                    <hr/>
                    <br/>
                    <br/>
                    <div class="logIn">
                        <h3>账号:</h3>
                        <br/>
                        <div id="Register-user-name">

                            <input required autofocus type="text" style="width:85%"
                                   ng-model="user.username" placeholder="不少于8个字符" id="username"/>
                            <i class="fa fa-envelope-o"></i>
                        </div>
                        <br/>
                        <h3>密码:</h3>
                        <br/>
                        <div id="Register-user-password" style="font-size:20px">
                            <input required type="password" ng-model="user.password" style="width:85%"
                                   ng-keypress="$event.which===13&&commit()" placeholder="不少于6个字符" id="password"/>
                            <i class="fa fa-lock"></i>
                        </div>
                        <br/>
                        <h3>常用邮箱:</h3>
                        <br/>
                        <div id="Register-user-email" style="font-size:20px">
                            <input required type="text"  style="width:55%"
                                   ng-keypress="$event.which===13&&commit()" placeholder="推荐使用大学安全邮箱" id="email"/>
                            <i class="fa fa-bell"></i>
                            <button type="submit" style="font-size: 18px;height:40px;background-color:#d52512;border: none;
                            color:#ffffcc;border-radius:10px;width: 30%;font-family: 'Adobe Arabic';align-content:center
                            ">发送验证码到邮箱</button>
                        </div>
                        <br/>
                        <div id="Register-idCode" style="font-size:20px">
                            <input required type="text"  style="width:35%"
                                   ng-keypress="$event.which===13&&commit()" placeholder="验证码" id="idCode"/>
                        </div>
                        <br/>
                        <br/>
                        <button type="submit" style="font-size: 20px;height:35px;background-color:#d58512;border: none;
                            color:#ffffcc;border-radius:10px;width: 60%;font-family: 'Adobe Arabic';align-content:center">注 册</button>
                    </div>
                    <div class="link" style="height:400px">
                        <h3>注册方式选择</h3>
                        <br/>
                        <ul>
                            <li>
                                <span><img src="images/jaccount.png" width="20px" height="20px"/></span>
                                <span><a href="#" style="color: black"><b>jAccount</b></a></span>
                            </li>
                        </ul>
                    </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>
