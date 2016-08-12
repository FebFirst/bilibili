<%@ page import="com.pojo.Letter" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pojo.InterestGroup" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: slt
  Date: 2016/7/4
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <![endif]-->
    <meta name="description" content="File Upload widget with multiple file selection, drag&amp;drop support, progress bars, validation and preview images, audio and video for jQuery. Supports cross-domain, chunked and resumable file uploads and client-side image resizing. Works with any server-side platform (PHP, Python, Ruby on Rails, Java, Node.js, Go etc.) that supports standard HTML form file uploads.">
    <!-- Web App Capable-->
    <meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>个人中心</title>
    <meta name="description" content="Free Responsive Html5 Css3 Templates | zerotheme.com">
    <meta name="author" content="www.zerotheme.com">

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0,user-scalable=no,maximum-scale=1.0">
    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="css/zerogrid.css">
    <link rel="stylesheet" href="css/profile-style.css">
    <link rel="stylesheet" href="css/menu.css">
    <link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
    <!-- Owl Carousel Assets -->
    <link href="css/owl.carousel.css" rel="stylesheet">
    <link href="css/owl.theme.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- blueimp Gallery styles -->
    <link rel="stylesheet" href="//blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
    <!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
    <link rel="stylesheet" href="css/jquery.fileupload.css">
    <link rel="stylesheet" href="css/jquery.fileupload-ui.css">
    <!-- CSS adjustments for browsers with JavaScript disabled -->
    <noscript><link rel="stylesheet" href="css/jquery.fileupload-noscript.css"></noscript>
    <noscript><link rel="stylesheet" href="css/jquery.fileupload-ui-noscript.css"></noscript>

    <!--[if lt IE 8]>
    <div style=' clear: both; text-align:center; position: relative;'>
        <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
            <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
    </div>
    <![endif]-->
    <!--[if lt IE 9]>
    <script src="js/jsp5.js"></script>
    <script src="js/css3-mediaqueries.js"></script>
    <![endif]-->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>


    <%--  <!-- 获取时间-->
      <script language="javascript">
          function realSysTime(clock){
              var now=new Date(); //创建Date对象
              var year=now.getFullYear(); //获取年份
              var month=now.getMonth(); //获取月份
              var date=now.getDate(); //获取日期
              var hour=now.getHours(); //获取小时
              var minute=now.getMinutes(); //获取分钟
              month=month+1;
              var time;
              var complete_time;
              if(minute<10) {
                  complete_time = year + "年" + month + "月" + date + "日 " + " " + hour + ":0" + minute; //组合系统时间
                  time=hour + ":0" + minute;
              }
              else
              {
                  complete_time=year+"年"+month+"月"+date+"日 "+" "+hour+":"+minute; //组合系统时间
                  time=hour + ":" + minute;
              }
              clock.innerHTML=complete_time; //显示系统时间

          }
          window.onload=function(){
              window.setInterval("realSysTime(clock)",1000); //实时获取并显示系统时间
          }
      </script>
  --%>
    <!-- 页面ajax -->
    <script language="javascript">




        function show_UI(message)
        {
            var content=document.getElementById("profile-content");
            var a1=document.getElementById("a1");
            var a2=document.getElementById("a2");
            var a3=document.getElementById("a3");
            var a4=document.getElementById("a4");
            var a5=document.getElementById("a5");
            var a6=document.getElementById("a6");
            var li1=document.getElementById("li1");
            var li2=document.getElementById("li2");
            var li3=document.getElementById("li3");
            var li4=document.getElementById("li4");
            var li5=document.getElementById("li5");
            var li6=document.getElementById("li6");

            //个人信息
            if(message=="info")
            {
                a1.className="profile-name";
                li1.className="profile-li";
                a2.removeAttribute("class");
                a3.removeAttribute("class");
                a4.removeAttribute("class");
                a5.removeAttribute("class");
                a6.removeAttribute("class");
                li2.removeAttribute("class");
                li3.removeAttribute("class");
                li4.removeAttribute("class");
                li5.removeAttribute("class");
                li6.removeAttribute("class");
                content.innerHTML='  <h2><i class="fa fa-info" style="color: palevioletred"></i>&nbsp;个人信息</h2>'+
                        '<form class="content">'+
                        '<i class="icon-bar"></i>'+
                        '<p>昵称：<input required type="text" value="" name="user.username"></p>'+
                        '<p>邮箱：<input type="email" value="" name="user.email"></p>'+
                        '<p>性别：<label><input type="radio" value="" name="user.gender">男</label>'+
                        '<label><input type="radio" value="" name="user.gender">女</label></p>'+
                        '<p>生日：<input type="date" value="" name="user.birthday"></p>'+
                        '<p>真实姓名：<input type="text" value="" name="user.realName"></p>'+
                        '<p>学校：<input type="text" value="" name="user.university"></p>'+
                        '<p>个性签名：<textarea value="" name="user.signature"></textarea></p>'+
                        '<button type="reset" id="reset_button">清 除</button>'+
                        '<button type="submit" id="submit_button" >提 交</button>'+
                        '<p>&nbsp;</p></form>';
            }
            //我的收藏
            else if(message=="collection")
            {
                a2.className="profile-name";
                li2.className="profile-li";
                a1.removeAttribute("class");
                a3.removeAttribute("class");
                a4.removeAttribute("class");
                a5.removeAttribute("class");
                a6.removeAttribute("class");
                li1.removeAttribute("class");
                li3.removeAttribute("class");
                li4.removeAttribute("class");
                li5.removeAttribute("class");
                li6.removeAttribute("class");
                content.innerHTML=document.getElementById("myCollection").innerHTML;


            }
            //我的订阅
            else if(message=="subscription")
            {

                a3.className="profile-name";
                li3.className="profile-li";
                a1.removeAttribute("class");
                a2.removeAttribute("class");
                a4.removeAttribute("class");
                a5.removeAttribute("class");
                a6.removeAttribute("class");
                li1.removeAttribute("class");
                li2.removeAttribute("class");
                li4.removeAttribute("class");
                li5.removeAttribute("class");
                li6.removeAttribute("class");
                content.innerHTML="";
            }
            //我的私信
            else if(message=="letter")
            {
                a4.className="profile-name";
                li4.className="profile-li";
                a1.removeAttribute("class");
                a3.removeAttribute("class");
                a2.removeAttribute("class");
                a5.removeAttribute("class");
                a6.removeAttribute("class");
                li1.removeAttribute("class");
                li3.removeAttribute("class");
                li2.removeAttribute("class");
                li5.removeAttribute("class");
                li6.removeAttribute("class");

                $.ajax({
                    url: "letterList.action",
                    // 数据发送方式
                    type: "post",
                    /*// 接受数据格式
                     dataType: "json",*/
                    // 要传递的数据
                    data:{},
                    // 回调函数，接受服务器端返回给客户端的值，即result值
                    beforeSend:function() {},
                    success : function(dataMap) {
                        /*   content.innerHTML =document.getElementById("mySecretLetter").innerHTML;*/
                        content.innerHTML='<h2><i class="fa fa-comment" style="color: palevioletred"></i>&nbsp;我的私信</h2><div class="content"> <table id="cmt-tb"class="table table-responsive">';
                        for(var i in dataMap["letterList"])
                        {
                            document.getElementById("cmt-tb").innerHTML+='<tr class="tr"><td width="10%" class="td_white">'+dataMap["senderList"][i].username+'</td><td width="70%" class="td_white_blue">'+ dataMap["letterList"][i].letterContent+
                                    '</td><td width="20%" class="td_blue"><button  onclick="reply_letter(\''+dataMap["senderList"][i].email +'\')" class="reply_letter">回复</button>'+
                                    '<button class="delete_letter">删除</button></td></tr>';
                        }
                        content.innerHTML+='</table></div><h2><i class="fa fa-user-md" style="color: palevioletred"></i>&nbsp;好友列表</h2><div class="content">'+
                                document.getElementById("friend-list").innerHTML+"</div>"



                    },
                    error: function(XMLHttpRequest, textStatus, errorThrown) {
                        alert("请再登录一次~");
                    }
                });
            }
            //兴趣部落
            else if(message=="interestGroup")
            {
                a5.className="profile-name";
                li5.className="profile-li";
                a1.removeAttribute("class");
                a3.removeAttribute("class");
                a4.removeAttribute("class");
                a2.removeAttribute("class");
                a6.removeAttribute("class");
                li1.removeAttribute("class");
                li3.removeAttribute("class");
                li4.removeAttribute("class");
                li2.removeAttribute("class");
                li6.removeAttribute("class");

                $.ajax({
                    url: "myInterestGroup.action",
                    // 数据发送方式
                    type: "post",
                    /*// 接受数据格式
                     dataType: "json",*/
                    // 要传递的数据
                    data:{},
                    // 回调函数，接受服务器端返回给客户端的值，即result值
                    beforeSend:function() {},
                    success : function(dataMap) {
                        var lgroup=dataMap["groupList"];
                        var mygroup=dataMap["myGroupList"];
                        content.innerHTML='<h2><i class="fa fa-home" style="color: palevioletred"></i>&nbsp;我加入的部落</h2><div class="content">'+
                                '<table id="IG-tb"class="table table-responsive"><thead><tr><td>部落ID</td><td>部落名称</td></tr></thead></table></div>';


                        content.innerHTML+='<h2><i class="fa fa-home" style="color: palevioletred"></i>&nbsp;所有部落</h2><div class="content">'+
                                '<table id="IG-tb-all"class="table table-responsive"><thead><tr><td>部落ID</td><td>部落名称</td></tr></thead></table></div>';
                        for(var i in lgroup)
                        {
                            document.getElementById("IG-tb-all").innerHTML+='<tr><td width="10%" class="td_white">'+
                                    lgroup[i].interestGroupId+'</td><td width="60%" class="td_white_blue"><a class="IGlink" target="_blank" href="postList.action?interestGroupId='+
                                    lgroup[i].interestGroupId+'">'+
                                    lgroup[i].interestGroupName+'</a></td>'+
                                    ' <td width="25%"  class="td_blue">'+
                                    '<button  class="add_group" id="btnIG'+lgroup[i].interestGroupId+'" onclick="addGroup('+lgroup[i].interestGroupId+',\''+ lgroup[i].interestGroupName+'\')">加入</button>'+
                                    '</td></tr>';
                        }

                        for(i in mygroup)
                        {
                            document.getElementById("IG-tb").innerHTML+='<tr><td width="10%" class="td_white">'+
                                    mygroup[i].interestGroupId+'</td><td width="70" class="td_white_blue">'+
                                    '<a class="IGlink" target="_blank" href="postList.action?interestGroupId='+
                                    mygroup[i].interestGroupId+'">'+
                                    mygroup[i].interestGroupName+'</a></td></tr>';
                            var btn=document.getElementById("btnIG"+mygroup[i].interestGroupId);//所有部落中寻找
                            btn.removeAttribute("onclick"); //已加入
                            btn.className="after_add_fav";
                            btn.innerHTML="√ 已加入";
                        }
                    },
                    error: function(XMLHttpRequest, textStatus, errorThrown) {
                        alert("请再登录一次~");
                    }
                });

            }
            //我的上传
            else if(message=="upload")
            {
                a6.className="profile-name";
                li6.className="profile-li";
                a1.removeAttribute("class");
                a3.removeAttribute("class");
                a4.removeAttribute("class");
                a2.removeAttribute("class");
                a5.removeAttribute("class");
                li1.removeAttribute("class");
                li3.removeAttribute("class");
                li4.removeAttribute("class");
                li2.removeAttribute("class");
                li5.removeAttribute("class");
                $.ajax({
                    url: "myUpload.action",
                    // 数据发送方式
                    type: "post",
                    /*// 接受数据格式
                     dataType: "json",*/
                    // 要传递的数据
                    data:{},
                    // 回调函数，接受服务器端返回给客户端的值，即result值
                    beforeSend:function() {},
                    success : function(dataMap) {
                        var myUpload=dataMap["videoBeanList"];
                        content.innerHTML='<h2><i class="fa fa-upload" style="color: palevioletred"></i>&nbsp;我的上传</h2><div class="content">'+
                                '<table id="UL-tb"class="table table-responsive"><thead><tr><td>ID</td><td>视频名称</td><td>视频描述</td></tr></thead></table></div>';
                        for(var i in myUpload)
                        {
                            document.getElementById("UL-tb").innerHTML+='<tr><td width="10%" class="td_white">'+
                                    myUpload[i].videoId+'</td><td width="30%" class="td_white_blue">'+
                                    myUpload[i].title+'</td>'+ ' <td width="50%"  class="td_blue">'+
                                    myUpload[i].content+'</td></tr>';
                        }
                    },
                    error: function(XMLHttpRequest, textStatus, errorThrown) {
                        alert("请再登录一次~");
                    }
                });

            }

        }
    </script>
    <!-- 加入兴趣部落ajax-->
    <script>
        function addGroup(groupId,groupName)
        {
            var btn=document.getElementById("btnIG"+groupId);

            $.ajax({
                url: "addInterestGroup.action",
                // 数据发送方式
                type: "post",
                /*// 接受数据格式
                 dataType: "json",*/
                // 要传递的数据
                data:{"interestGroupId":groupId},
                // 回调函数，接受服务器端返回给客户端的值，即result值
                beforeSend:function() {},
                success : function() {
                    btn.removeAttribute("onclick");
                    btn.className="after_add_fav";
                    btn.innerHTML="√ 已加入";
                    document.getElementById("IG-tb").innerHTML+='<tr><td width="10%" class="td_white">'+
                            groupId+'</td><td width="70" class="td_white_blue"><a class="IGlink" target="_blank" href="postList.action?interestGroupId='+
                            groupId+'">'+groupName+'</a>'+ '</td></tr>';
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("您已加入该部落，请不要重复添加");
                }
            });

        }
    </script>
    <!-- 发送私信 -->
    <script>
        function reply_letter(sendee)
        {
            var content=document.getElementById("profile-content");
            content.innerHTML='<h2><i class="fa fa-leaf" style="color: palevioletred"></i>&nbsp;发送私信</h2><div class="content">'+
                    '<form class="content" action="sendSecretLetter.action">'+
                    '<i class="icon-bar"></i>'+
                    '<p>发送给：<input type="text" style="border: none" value="'+sendee+'" name="receiverEmail" readonly></p>'+
                    '<p>内容：<textarea placeholder="请输入你要发送的内容..." name="letterContent"></textarea></p>'+
                    '<button type="reset" id="reset_button">清 除</button>'+
                    '<button type="submit" id="submit_button" >提 交</button>'+
                    '<p>&nbsp;</p>'+
                    '</form></div>';
        }
    </script>
    <!-- Opacity -->
    <style>
        body {background-color: #f0f0f0}

    </style>

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

                        <% String loginUsername = (String)session.getAttribute("username");
                            if(loginUsername == null)
                                System.out.println("<script> alert('Sorry,you shall LOGIN first!!'); window.location='login.jsp';</script>");
                            else{ %>
                        <li><a href="upload.jsp" title="Upload Video"  ><i class="fa fa-upload"></i>上传</a></li>
                        <li><a href="userProfile.jsp" title="Profile"><i class="fa fa-renren"></i>个人信息</a></li>
                        <%} %>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <div class="profile">
        <div class="profile-table">
            <!-- 左边栏，罗列出功能-->
            <h2 style="font-family: 微软雅黑;"><b>功能</b></h2>
            <hr  style="height:1px;border:none;width:70%;float:center;border-top:1px solid lightgrey;" />
            <ul style="color: grey">

                <li id="li1" class="profile-li"><a href="javascript:;"  id="a1"class="profile-name"onclick="show_UI('info')"><i class="fa fa-info" style="color:limegreen"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;个人信息</a></li>
                <li id="li2"><a href="javascript:;" id="a2" onclick="show_UI('collection')"><i class="fa fa-video-camera" style="color:orange"></i>&nbsp;我的收藏</a></li>
                <li id="li3"><a href="javascript:;" id="a3" onclick="show_UI('subscription')"><i class="fa fa-tags" style="color:red;"></i>&nbsp;我的订阅</a></li>
                <li id="li4"><a href="javascript:;" id="a4" onclick="show_UI('letter')"><i class="fa fa-comment" style="color:dodgerblue"></i>&nbsp;我的私信</a></li>
                <li id="li5"><a href="javascript:;" id="a5" onclick="show_UI('interestGroup')"><i class="fa fa-home" style="color:skyblue"></i>&nbsp;兴趣部落</a></li>
                <li id="li6"><a href="javascript:;" id="a6" onclick="show_UI('upload')"><i class="fa fa-upload" style="color: #ff72c4"></i>&nbsp;我的上传</a></li>

            </ul>
        </div>
        <div class="profile-content" id="profile-content">
            <!--右边栏，罗列该功能显示的信息 -->

            <!-- 显示个人信息页面-->
            <h2><i class="fa fa-info" style="color: palevioletred"></i>&nbsp;个人信息</h2>
            <form class="content">
                <i class="icon-bar"></i>
                <p>昵称：<input required type="text" value=<%=session.getAttribute("username")%> name="userBean.username"></p>
                <p>邮箱：<input type="email" value="" name="userBean.email"></p>
                <p>性别：<label><input type="radio" value="" name="userBean.gender">男</label>
                    <label><input type="radio" value="" name="userBean.gender">女</label>
                </p>
                <p>生日：<input type="date" value="" name="userBean.birthday"></p>
                <p>真实姓名：<input type="text" value="" name="userBean.realName"></p>
                <p>学校：<input type="text" value="" name="user.university"></p>
                <p>个性签名：<textarea value="" name="userBean.signature"></textarea></p>
                <button type="reset" id="reset_button">清 除</button>
                <button type="submit" id="submit_button" >提 交</button>
                <p>&nbsp;</p>
            </form>
        </div>
    </div>
</div>

<!-- 显示用户的收藏视频 -->
<div id="myCollection" hidden>
    <h2><i class="fa fa-video-camera" style="color: palevioletred"></i>&nbsp;我的收藏</h2>
    <div class="content zerogrid" style="width: 100%">
        <div class="row">
            <div class="col-1-4">
                <div class="wrap-col">
                    <div class="wrap-vid">
                        <div class="zoom-container">
                            <a href="single.jsp">
                                                       <span class="zoom-caption">
                                                           <i class="icon-play fa fa-play"></i>
                                                       </span>
                                <img src="images/3.jpg" />
                            </a>
                        </div>
                        <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                        <div class="info">
                            <h5>By <a href="#">Kelvin</a></h5>
                            <span><i class="fa fa-calendar"></i>25/3/2015</span>
                            <span><i class="fa fa-heart"></i>1,200</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-1-4">
                <div class="wrap-col">
                    <div class="wrap-vid">
                        <div class="zoom-container">
                            <a href="single.jsp">
                                                       <span class="zoom-caption">
                                                           <i class="icon-play fa fa-play"></i>
                                                       </span>
                                <img src="images/4.jpg" />
                            </a>
                        </div>
                        <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                        <div class="info">
                            <h5>By <a href="#">Kelvin</a></h5>
                            <span><i class="fa fa-calendar"></i>25/3/2015</span>
                            <span><i class="fa fa-heart"></i>1,200</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-1-4">
                <div class="wrap-col">
                    <div class="wrap-vid">
                        <div class="zoom-container">
                            <a href="single.jsp">
                                                       <span class="zoom-caption">
                                                           <i class="icon-play fa fa-play"></i>
                                                       </span>
                                <img src="images/5.jpg" />
                            </a>
                        </div>
                        <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                        <div class="info">
                            <h5>By <a href="#">Kelvin</a></h5>
                            <span><i class="fa fa-calendar"></i>25/3/2015</span>
                            <span><i class="fa fa-heart"></i>1,200</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-1-4">
                <div class="wrap-col">
                    <div class="wrap-vid">
                        <div class="zoom-container">
                            <a href="single.jsp">
                                                       <span class="zoom-caption">
                                                           <i class="icon-play fa fa-play"></i>
                                                       </span>
                                <img src="images/14.jpg" />
                            </a>
                        </div>
                        <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                        <div class="info">
                            <h5>By <a href="#">Kelvin</a></h5>
                            <span><i class="fa fa-calendar"></i>25/3/2015</span>
                            <span><i class="fa fa-heart"></i>1,200</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-1-4">
                <div class="wrap-col">
                    <div class="wrap-vid">
                        <div class="zoom-container">
                            <a href="single.jsp">
                                                       <span class="zoom-caption">
                                                           <i class="icon-play fa fa-play"></i>
                                                       </span>
                                <img src="images/1.jpg" />
                            </a>
                        </div>
                        <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                        <div class="info">
                            <h5>By <a href="#">Kelvin</a></h5>
                            <span><i class="fa fa-calendar"></i>25/3/2015</span>
                            <span><i class="fa fa-heart"></i>1,200</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-1-4">
                <div class="wrap-col">
                    <div class="wrap-vid">
                        <div class="zoom-container">
                            <a href="single.jsp">
                                                       <span class="zoom-caption">
                                                           <i class="icon-play fa fa-play"></i>
                                                       </span>
                                <img src="images/2.jpg" />
                            </a>
                        </div>
                        <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                        <div class="info">
                            <h5>By <a href="#">Kelvin</a></h5>
                            <span><i class="fa fa-calendar"></i>25/3/2015</span>
                            <span><i class="fa fa-heart"></i>1,200</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-1-4">
                <div class="wrap-col">
                    <div class="wrap-vid">
                        <div class="zoom-container">
                            <a href="single.jsp">
                                                       <span class="zoom-caption">
                                                           <i class="icon-play fa fa-play"></i>
                                                       </span>
                                <img src="images/3.jpg" />
                            </a>
                        </div>
                        <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                        <div class="info">
                            <h5>By <a href="#">Kelvin</a></h5>
                            <span><i class="fa fa-calendar"></i>25/3/2015</span>
                            <span><i class="fa fa-heart"></i>1,200</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-1-4">
                <div class="wrap-col">
                    <div class="wrap-vid">
                        <div class="zoom-container">
                            <a href="single.jsp">
                               <span class="zoom-caption">
                                   <i class="icon-play fa fa-play"></i>
                               </span>
                                <img src="images/4.jpg" />
                            </a>
                        </div>
                        <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                        <div class="info">
                            <h5>By <a href="#">Kelvin</a></h5>
                            <span><i class="fa fa-calendar"></i>25/3/2015</span>
                            <span><i class="fa fa-heart"></i>1,200</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 我的私信-->
<div id="mySecretLetter" hidden>
    <!-- 我的私信（邮箱）-->
    <h2><i class="fa fa-comment" style="color: palevioletred"></i>&nbsp;我的私信</h2>

    <div class="content">
        <table class="table table-responsive">
            <%--<s:iterator value="letterList" var="letter">--%>
                <%--&lt;%&ndash;<% int i=0;--%>
                    <%--List<Letter> letterList=(List<Letter>)session.getAttribute("letterList");--%>
                    <%--for(Letter letter:letterList){--%>
                <%--%>&ndash;%&gt;--%>
                <%--<tr>--%>
                    <%--<td width="10%" class="td_white">--%>
                        <%--<div>--%>
                                <%--&lt;%&ndash; <%=letter.getSenderId()%>&ndash;%&gt;--%>
                            <%--666--%>
                        <%--</div>--%>
                    <%--</td>--%>
                    <%--<td width="70%" class="td_white_blue">--%>
                        <%--777--%>
                            <%--&lt;%&ndash; <%=letter.getLetterContent()%>&ndash;%&gt;--%>
                    <%--</td>--%>
                    <%--<td width="20%"  id="clock" class="td_blue">--%>
                    <%--</td>--%>
                <%--</tr>--%>
                <%--&lt;%&ndash; <%}%>&ndash;%&gt;--%>
            <%--</s:iterator>--%>

        </table>
    </div>
    <!-- 我的私信（好友列表-->
    <h2><i class="fa fa-user-md" style="color: palevioletred"></i>&nbsp;好友列表</h2>
    <div class="content" id="friend-list">
        <table class="table table-responsive">
            <%
                int i;  for(i=0;i<3;i++){
            %>

            <tr>
                <td width="10%" class="td_white">
                    <div class="user_face_icon">
                        <a href="javascipt:;">
                            <img src="images/<%=i+10%>.jpg">
                        </a>
                    </div>
                </td>
                <td width="50%" class="td_white_blue">
                    <p><b>熊果</b></p>
                    <p>Signature:</p>
                </td>

            </tr>
            <%}%>
        </table>
    </div>
</div>


</body>
</html>
