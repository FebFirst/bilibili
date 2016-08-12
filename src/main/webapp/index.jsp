<%@ page import="com.thoughtworks.xstream.mapper.Mapper" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>Jplay大学视频社区</title>
    <meta name="description" content="Free Responsive jsp5 Css3 Templates | zerotheme.com">
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
    <script src="js/jsp5.js"></script>
    <script src="js/css3-mediaqueries.js"></script>
    <![endif]-->
    <!-- window onload-->
    <script>
        function init_action()
        {
//            var content=document.getElementById("vid-series");
            $.ajax({
                url: "indexAllVideoInfo.action",
                // 数据发送方式
                type: "post",
                /*!// 接受数据格式
                 dataType: "json",*/
                // 要传递的数据
                data:{},
                // 回调函数，接受服务器端返回给客户端的值，即result值(在这里是点赞数tn)
                beforeSend:function()
                {
                },
                success : function(dataMap) {
                    var count=0;
                    var allVideos=dataMap["allVideos"];
                    var num=0;
                    for(var i in allVideos)
                    {
                        var category=allVideos[i];
                        count=0;
                        num++;
                        for(var j in category)
                        {
                            var subCategory=category[j];

                            for(var k in subCategory)
                            {
                                var video=subCategory[k];
                                var subcontent=document.getElementById(num+"S"+count);

//                        alert(subcontent.innerHTML);
                                if(count>=9)
                                {
                                    break;
                                }
                                subcontent.innerHTML+=
                                        '<div class="zoom-container">'+
                                        '<a href="singleData.action?videoId='+video.videoId+'">'+
                                        '<span class="zoom-caption">'+
                                        '<i class="icon-play fa fa-play"></i>'+
                                        '</span>'+
                                        '<img src="'+ dataMap["allVideoImages"][i][j][k]+'" />'+
                                        '</a>'+
                                        '</div>'+
                                        '<h3 class="vid-name" ><a title="'+video.title+'" href="singleData.action?videoId='+video.videoId+'">'+video.title+'</a></h3>'+
                                        '<div class="info">'+
                                        '<h5>By <a href="#">'+video.uper+'</a></h5>'+
                                        '<span><i class="fa fa-calendar"></i>2016/7/21</span>'+
                                        '<span><i class="fa fa-heart"></i>'+video.thumbCount+'</span>'+
                                        '</div>';
                                count++;
                            }

                        }
                        for(;count<=8;count++)
                        {
                            subcontent=document.getElementById(num+"S"+count);
                            subcontent.className="hidden";
                        }
                    }



                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert(XMLHttpRequest.status);
//                    alert(XMLHttpRequest.readyState);
//                    alert(textStatus);
//                    alert(errorThrown);
                }
            });
        }
    </script>

</head>
<body id="wrapper" onload="init_action()">
<div class="wrap-body">


    <!--////////////////////////////////////Header-->
    <header>
        <div class="wrap-header">
            <div class="zerogrid">
                <div class="row">
                    <a href="index.jsp" class="logo"><img src="images/111.jpg" /></a>
                    <ul class="social">
                        <%--<li><a href="upload.jsp" title="Upload Video" ><i class="fa fa-upload"></i>上传</a></li>--%>
                        <%  String loginUsername = (String)session.getAttribute("username");
                            if(loginUsername == null)
                            {%>
                        <li><a href="login.jsp" title="Log in" ><i class="fa fa-user"></i>登陆</a></li>
                        <li><a href="register.jsp" title="Register" ><i class="fa fa-bell"></i>注册</a></li>
                        <%}else{ %>
                        <li><a href="userProfile.jsp" title="Profile" target="_blank"><i class="fa fa-renren"></i>个人信息</a></li>
                        <li><a href="logOutAction.action" title="exit"><i class="fa fa-renren"></i>安全退出</a></li>
                        <%} %>
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
            <li class="colour-7"><a href="gallery.jsp">校园</a></li>
            <li class="colour-8"><a href="gallery.jsp">更多</a></li>
        </ul>
    </nav>
    <!--////////////////////////////////////Container-->
    <section id="container" class="index-page">
        <div class="wrap-container zerogrid">
            <!------------------------------------->
            <div class="row">
                <div class="header">
                    <h2>最多关注</h2>
                </div>

                <%--<div class="row">--%>
                <%--<div class="most-viewed">--%>
                <%--<div class="col-2-4">--%>
                <%--<div class="wrap-col">--%>
                <%--<div class="zoom-container">--%>
                <%--<a href="<s:url action='singleData'/>?videoId=1">--%>
                <%--<span class="zoom-caption">--%>
                <%--<i class="icon-play fa fa-play"></i>--%>
                <%--</span>--%>
                <%--<img src="images/temp.jpg" />--%>
                <%--</a>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="extra">--%>
                <%--<div class="col-1-4">--%>
                <%--<div class="wrap-col">--%>
                <%--<div class="zoom-container">--%>
                <%--<a href="<s:url action='singleData'/>?videoId=1">--%>
                <%--<span class="zoom-caption">--%>
                <%--<i class="icon-play fa fa-play"></i>--%>
                <%--</span>--%>
                <%--<img src="images/temp.jpg" />--%>
                <%--</a>--%>
                <%--</div>--%>
                <%--<div class="zoom-container">--%>
                <%--<a href="<s:url action='singleData'/>?videoId=1">--%>
                <%--<span class="zoom-caption">--%>
                <%--<i class="icon-play fa fa-play"></i>--%>
                <%--</span>--%>
                <%--<img src="images/temp.jpg" />--%>
                <%--</a>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-1-4">--%>
                <%--<div class="wrap-col">--%>
                <%--<div class="zoom-container">--%>
                <%--<a href="<s:url action='singleData'/>?videoId=1">--%>
                <%--<span class="zoom-caption">--%>
                <%--<i class="icon-play fa fa-play"></i>--%>
                <%--</span>--%>
                <%--<img src="images/temp.jpg" />--%>
                <%--</a>--%>
                <%--</div>--%>
                <%--<div class="zoom-container">--%>
                <%--<a href="<s:url action='singleData'/>?videoId=1">--%>
                <%--<span class="zoom-caption">--%>
                <%--<i class="icon-play fa fa-play"></i>--%>
                <%--</span>--%>
                <%--<img src="images/temp.jpg" />--%>
                <%--</a>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
            </div>
            <div class="row">
                <div id="main-content" class="col-2-3">
                    <div class="wrap-content">
                        <!-- 番剧列表 -->
                        <section class="vid-series" >
                            <div class="header">
                                <h2>番剧</h2>
                            </div>
                            <div id="owl-demo-1" class="owl-carousel">
                                <div class="item wrap-vid" id="1S0"></div>
                                <div class="item wrap-vid" id="1S1"></div>
                                <div class="item wrap-vid" id="1S2"></div>
                                <div class="item wrap-vid" id="1S3"></div>
                                <div class="item wrap-vid" id="1S4"></div>
                                <div class="item wrap-vid" id="1S5"></div>
                                <div class="item wrap-vid" id="1S6"></div>
                                <div class="item wrap-vid" id="1S7"></div>
                                <div class="item wrap-vid" id="1S8"></div>
                            </div>
                        </section>

                        <!-- 动画列表 -->
                        <section class="vid-animation">
                            <div class="header">
                                <h2>动画</h2>
                            </div>
                            <div id="owl-demo-2" class="owl-carousel">
                                <div class="item wrap-vid" id="2S0"></div>
                                <div class="item wrap-vid" id="2S1"></div>
                                <div class="item wrap-vid" id="2S2"></div>
                                <div class="item wrap-vid" id="2S3"></div>
                                <div class="item wrap-vid" id="2S4"></div>
                                <div class="item wrap-vid" id="2S5"></div>
                                <div class="item wrap-vid" id="2S6"></div>
                                <div class="item wrap-vid" id="2S7"></div>
                                <div class="item wrap-vid" id="2S8"></div>
                            </div>
                        </section>
                        <!-- 直播列表 -->
                        <section class="vid-live">
                            <div class="header">
                                <h2>直播</h2>
                            </div>
                            <div id="owl-demo-3" class="owl-carousel">
                                <div class="item wrap-vid" id="3S0"></div>
                                <div class="item wrap-vid" id="3S1"></div>
                                <div class="item wrap-vid" id="3S2"></div>
                                <div class="item wrap-vid" id="3S3"></div>
                                <div class="item wrap-vid" id="3S4"></div>
                                <div class="item wrap-vid" id="3S5"></div>
                                <div class="item wrap-vid" id="3S6"></div>
                                <div class="item wrap-vid" id="3S7"></div>
                                <div class="item wrap-vid" id="3S8"></div>
                            </div>
                        </section>

                        <!-- 音乐列表 -->
                        <section class="vid-series">
                            <div class="header">
                                <h2>音乐</h2>
                            </div>
                            <div id="owl-demo-4" class="owl-carousel">
                                <div class="item wrap-vid" id="4S0"></div>
                                <div class="item wrap-vid" id="4S1"></div>
                                <div class="item wrap-vid" id="4S2"></div>
                                <div class="item wrap-vid" id="4S3"></div>
                                <div class="item wrap-vid" id="4S4"></div>
                                <div class="item wrap-vid" id="4S5"></div>
                                <div class="item wrap-vid" id="4S6"></div>
                                <div class="item wrap-vid" id="4S7"></div>
                                <div class="item wrap-vid" id="4S8"></div>
                            </div>
                        </section>

                        <!-- 舞蹈列表 -->
                        <section class="vid-series" >
                            <div class="header">
                                <h2>舞蹈</h2>
                            </div>
                            <div id="owl-demo-5" class="owl-carousel">
                                <div class="item wrap-vid" id="5S0"></div>
                                <div class="item wrap-vid" id="5S1"></div>
                                <div class="item wrap-vid" id="5S2"></div>
                                <div class="item wrap-vid" id="5S3"></div>
                                <div class="item wrap-vid" id="5S4"></div>
                                <div class="item wrap-vid" id="5S5"></div>
                                <div class="item wrap-vid" id="5S6"></div>
                                <div class="item wrap-vid" id="5S7"></div>
                                <div class="item wrap-vid" id="5S8"></div>
                            </div>
                        </section>

                        <!-- 校园列表 -->
                        <section class="vid-series" >
                            <div class="header">
                                <h2>校园</h2>
                            </div>
                            <div id="owl-demo-7" class="owl-carousel">
                                <div class="item wrap-vid" id="7S0"></div>
                                <div class="item wrap-vid" id="7S1"></div>
                                <div class="item wrap-vid" id="7S2"></div>
                                <div class="item wrap-vid" id="7S3"></div>
                                <div class="item wrap-vid" id="7S4"></div>
                                <div class="item wrap-vid" id="7S5"></div>
                                <div class="item wrap-vid" id="7S6"></div>
                                <div class="item wrap-vid" id="7S7"></div>
                                <div class="item wrap-vid" id="7S8"></div>
                            </div>
                        </section>

                        <!-- 其他列表 -->
                        <section class="vid-series" >
                            <div class="header">
                                <h2>其他</h2>
                            </div>
                            <div id="owl-demo-6" class="owl-carousel">
                                <div class="item wrap-vid" id="6S0"></div>
                                <div class="item wrap-vid" id="6S1"></div>
                                <div class="item wrap-vid" id="6S2"></div>
                                <div class="item wrap-vid" id="6S3"></div>
                                <div class="item wrap-vid" id="6S4"></div>
                                <div class="item wrap-vid" id="6S5"></div>
                                <div class="item wrap-vid" id="6S6"></div>
                                <div class="item wrap-vid" id="6S7"></div>
                                <div class="item wrap-vid" id="6S8"></div>
                            </div>
                        </section>
                    </div>
                </div>
                <div id="sidebar" class="col-1-3">
                    <form id="form-container" action="searchAction.action" target="_blank" accept-charset="gbk">
                        <!--<input type="submit" id="searchsubmit" value="" />-->
                        <a class="search-submit-button" type="submit">
                            <i class="fa fa-search"></i>
                        </a>
                        <div id="searchtext">
                            <input type="text" id="search-text" name="keyword" placeholder="查找...">
                        </div>

                    </form>
                    <!---- Start Widget ---->
                    <div class="widget wid-post">
                        <div class="wid-header">
                            <h5>最近发布</h5>
                        </div>
                        <%--<div class="wid-content">--%>
                        <%--<div class="post wrap-vid">--%>
                        <%--<div class="zoom-container">--%>
                        <%--<a href="<s:url action='singleData'/>?videoId=1">--%>
                        <%--<span class="zoom-caption">--%>
                        <%--<i class="icon-play fa fa-play"></i>--%>
                        <%--</span>--%>
                        <%--<img src="images/temp.jpg" />--%>
                        <%--</a>--%>
                        <%--</div>--%>
                        <%--<div class="wrapper">--%>
                        <%--<h5 class="vid-name"><a href="#">Video's Name</a></h5>--%>
                        <%--<div class="info">--%>
                        <%--<h6>By <a href="#">Kelvin</a></h6>--%>
                        <%--<span><i class="fa fa-calendar"></i>25/3/2015</span>--%>
                        <%--<span><i class="fa fa-heart"></i>1,200</span>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="post wrap-vid">--%>
                        <%--<div class="zoom-container">--%>
                        <%--<a href="<s:url action='singleData'/>?videoId=1">--%>
                        <%--<span class="zoom-caption">--%>
                        <%--<i class="icon-play fa fa-play"></i>--%>
                        <%--</span>--%>
                        <%--<img src="images/temp.jpg" />--%>
                        <%--</a>--%>
                        <%--</div>--%>
                        <%--<div class="wrapper">--%>
                        <%--<h5 class="vid-name"><a href="#">Video's Name</a></h5>--%>
                        <%--<div class="info">--%>
                        <%--<h6>By <a href="#">Kelvin</a></h6>--%>
                        <%--<span><i class="fa fa-calendar"></i>25/3/2015</span>--%>
                        <%--<span><i class="fa fa-heart"></i>1,200</span>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--<div class="post wrap-vid">--%>
                        <%--<div class="zoom-container">--%>
                        <%--<a href="<s:url action='singleData'/>?videoId=1">--%>
                        <%--<span class="zoom-caption">--%>
                        <%--<i class="icon-play fa fa-play"></i>--%>
                        <%--</span>--%>
                        <%--<img src="images/temp.jpg" />--%>
                        <%--</a>--%>
                        <%--</div>--%>
                        <%--<div class="wrapper">--%>
                        <%--<h5 class="vid-name"><a href="#">Video's Name</a></h5>--%>
                        <%--<div class="info">--%>
                        <%--<h6>By <a href="#">Kelvin</a></h6>--%>
                        <%--<span><i class="fa fa-calendar"></i>25/3/2015</span>--%>
                        <%--<span><i class="fa fa-heart"></i>1,200</span>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                        <%--</div>--%>
                    </div>
                    <!---- Start Widget ---->
                    <div class="widget wid-news">
                        <div class="wid-header">
                            <h5>回到顶部</h5>
                        </div>
                        <%-- <div class="wid-content">
                             <div class="row">
                                 <div class="wrap-vid">
                                     <div class="zoom-container">
                                         <a href="<s:url action='singleData'/>?videoId=1">
                                                 <span class="zoom-caption">
                                                     <i class="icon-play fa fa-play"></i>
                                                 </span>
                                             <img src="images/temp.jpg" />
                                         </a>
                                     </div>
                                     <h3 class="vid-name">Video's Name</h3>
                                     <div class="info">
                                         <h5>By <a href="#">Kelvin</a></h5>
                                         <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                         <span><i class="fa fa-heart"></i>1,200</span>
                                     </div>
                                 </div>
                             </div>
                             <div class="row">
                                 <div class="wrap-vid">
                                     <div class="zoom-container">
                                         <a href="<s:url action='singleData'/>?videoId=1">
                                                 <span class="zoom-caption">
                                                     <i class="icon-play fa fa-play"></i>
                                                 </span>
                                             <img src="images/temp.jpg" />
                                         </a>
                                     </div>
                                     <h3 class="vid-name">Video's Name</h3>
                                     <div class="info">
                                         <h5>By <a href="#">Kelvin</a></h5>
                                         <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                         <span><i class="fa fa-heart"></i>1,200</span>
                                     </div>
                                 </div>
                             </div>
                             <div class="row">
                                 <div class="wrap-vid">
                                     <div class="zoom-container">
                                         <a href="<s:url action='singleData'/>?videoId=1">
                                                 <span class="zoom-caption">
                                                     <i class="icon-play fa fa-play"></i>
                                                 </span>
                                             <img src="images/temp.jpg" />
                                         </a>
                                     </div>
                                     <h3 class="vid-name">Video's Name</h3>
                                     <div class="info">
                                         <h5>By <a href="#">Kelvin</a></h5>
                                         <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                         <span><i class="fa fa-heart"></i>1,200</span>
                                     </div>
                                 </div>
                             </div>
                         </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Slider -->
    <script src="js/jquery-2.1.1.js"></script>
    <script src="js/demo.js"></script>
    <script src="js/classie.js"></script>
    <!-- Carousel -->
    <script src="js/owl.carousel.js"></script>
    <script>
        $(document).ready(function() {

            $("#owl-demo-1").owlCarousel({
                items : 4,
                lazyLoad : true,
                navigation : true
            });
            $("#owl-demo-2").owlCarousel({
                items : 4,
                lazyLoad : true,
                navigation : true
            });
            $("#owl-demo-3").owlCarousel({
                items : 4,
                lazyLoad : true,
                navigation : true
            });
        });
    </script>
    <style type="text/css">
        .white {
            color: #606060;
            border: solid 1px #b7b7b7;
            background: #fff;
            background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ededed));
            background: -moz-linear-gradient(top, #fff, #ededed);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#ededed');
        }

        .button {
            display: inline-block;
            zoom: 1;
            vertical-align: baseline;
            margin: 0 2px;
            outline: none;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            font: 14px/100% Arial, Helvetica, sans-serif;
            padding: .5em 2em .55em;
            text-shadow: 0 1px 1px rgba(0,0,0,.3);
            -webkit-border-radius: .5em;
            -moz-border-radius: .5em;
            border-radius: .5em;
            -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
            -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
            box-shadow: 0 1px 2px rgba(0,0,0,.2);
        }
        a {
            color: #ffbeb2;
            text-decoration: none;
        }
        a:-webkit-any-link {
            color: -webkit-link;
            text-decoration: none;
            cursor: auto;
        }
    </style>
</div>
<div style="position: fixed;top: 260px;right:0;width:10%;height:100%;">
    <nav>
        <ul>
            <li ><a href="#" class="button white">回到顶部</a></li>
        </ul>
    </nav>
</div>
</body>
</html>