

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE jsp>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!--[if lt IE 7 ]><jsp class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><jsp class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><jsp class="ie ie8" lang="en"> <![endif]-->
<head>
    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>视频观看</title>
    <meta name="description" content="Free Responsive jsp5 Css3 Templates | zerotheme.com">
    <meta name="author" content="www.zerotheme.com">

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">


    <link rel="stylesheet" href="js/Barrage/barrage.css" />
    <link rel="stylesheet" href="js/Barrage/default.css" />
    <%--<script type="text/javascript" src="js/CommentCoreLibrary.js"></script>--%>

    <script type="text/javascript" src="https://cdn.jsdelivr.net/clappr/latest/clappr.min.js"></script>
    <script type="text/javascript" src="js/clappr-playback-rate-plugin.min.js"></script>
    <script type="text/javascript" src="js/clappr-markers-plugin.js"></script>
    <script type="text/javascript" src="js/clappr-thumbnails-plugin.js"></script>
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

    <!-- 评论功能的ajax-->
    <script>

        var now=new Date(); //创建Date对象
        var year=now.getFullYear(); //获取年份
        var month=now.getMonth(); //获取月份
        var date=now.getDate(); //获取日期
        var hour=now.getHours(); //获取小时
        var minute=now.getMinutes(); //获取分钟
        var second=now.getSeconds();
        month=month+1;
        var time;
        var complete_time;
        if(minute<10) {
            if(second<10)
            {
                complete_time = year + "-" + month + " " + date + " " + hour + ":0" + minute+":0"+second; //组合系统时间
            }
            else
                complete_time = year + "-" + month + " " + date + " " + hour + ":0" + minute+":"+second; //组合系统时间
            /*time=hour + ":0" + minute;*/
        }
        else
        {
            if(second<10)
                complete_time=year+"-"+month+"-"+date+" "+hour+":"+minute+":0"+second; //组合系统时间
            else
                complete_time=year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second; //组合系统时间
            /*time=hour + ":" + minute;*/
        }
        /* 添加评论 */
        function comment(username,count,id)
        {

            //评论功能
            /*var arrIcon = ['http://www.xttblog.com/icons/favicon.ico','http://www.xttblog.com/wp-content/uploads/2016/03/123.png'];*/
            /*var icon = document.getElementById('user_face_icon').getElementsByTagName('img');*/
            var btn=document.getElementById('comment-btn');
            var text = document.getElementById('comment-text');
            var content = document.getElementById('comment-field');
            if(text.value=='')
            {
                alert("评论不能为空！")
            }
            else {
                var param = {"videoId": id, "commentContent": text.value};

                $.ajax({
                    url: "commentAction.action",
                    // 数据发送方式
                    type: "post",
                    // 接受数据格式
                    /*dataType: "json",*/
                    // 要传递的数据
                    data: param,
                    // 回调函数，接受服务器端返回给客户端的值，即result值(在这里是点赞数tn)
                    beforeSend: function () {
                    },
                    success: function () {
                        content.innerHTML = '<li class="comment_add"><img src="images/10.jpg" alt="image"/><div class="user_info"><div class="user_name"><h4><b>' + username +
                                '</b><span class="date_time">'+complete_time+'</span></h4></div><div class="comment">' + text.value + '</div>' +
                                '<div class="bottom-function"><label>#' + count + '</label></div></div></li>' +
                                content.innerHTML;
                        text.value = '';
                        // 内容过多时,将滚动条放置到最底端
                        content.scrollTop = content.scrollHeight;
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("你只有登陆以后才能发表评论");
                    }
                });
            }
        }
        /*评论点赞*/
        function commentThumb(comment_id,thumbCount)
        {
            ++thumbCount;
            var name="thumb"+comment_id;
            var btn=document.getElementById(name);
            var param={"commentId":comment_id}
            $.ajax({
                url: "thumbComment.action",
                // 数据发送方式
                type: "post",
                /*// 接受数据格式
                 dataType: "json",*/
                // 要传递的数据
                data:param,
                // 回调函数，接受服务器端返回给客户端的值，即result值(在这里是点赞数tn)
                beforeSend:function() {},
                success : function() {
                    btn.innerHTML="赞("+thumbCount+')';
                    btn.removeAttribute("onclick");
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("你只有登陆以后才能发表评论");
                }
            });
        }
        /*评论回复框*/
        function commentModal(comment_id,username)
        {
            var div=document.getElementById("div"+comment_id)
            if(div)
            {
                div.parentNode.removeChild(div);
            }
            var id="reply"+comment_id;
            var btid="btn"+comment_id;
            var content=document.getElementById(id);
            var original_content=content.innerHTML;
            /*content.innerHTML+=document.getElementById("commentModal").innerHTML;*/
            var btn=document.getElementById(btid);
            btn.removeAttribute("onclick");

            content.innerHTML+= '<div class="comment_reply" id="div'+comment_id+'">'+
                    '<input required="true" type="text" id="reply-text'+comment_id+'" placeholder="请输入你的回复">'+
                    '<button onclick="commentReply('+comment_id+',\''+username+'\')">回复评论</button></div>';
        }
        /*评论回复*/
        function commentReply(comment_id,username)
        {

            var id="reply"+comment_id;
            var content=document.getElementById(id);
            var text=document.getElementById("reply-text"+comment_id);
            if(text.value=='')
            {
                alert("回复不能为空！");
            }
            else {
                var param = {"commentId": comment_id, "replyContent": text.value};
                var div=document.getElementById("div"+comment_id);
                $.ajax({
                    url: "replyComment.action",
                    // 数据发送方式
                    type: "post",
                    // 接受数据格式
                    /*dataType: "json",*/
                    // 要传递的数据
                    data: param,
                    // 回调函数，接受服务器端返回给客户端的值，即result值(在这里是点赞数tn)
                    beforeSend: function () {
                    },
                    success: function () {
//						document.getElementById("div" + comment_id).className = "comment_reply hidden";
                        div.parentNode.removeChild(div);
                        /*content.innerHTML-= '<div class="comment_reply">'+
                         '<input type="text" id="reply-text'+comment_id+'"placeholder="请输入你的回复">'+
                         '<button onclick="commentReply('+comment_id+',\''+username+'\')">回复评论</button></div>';*/
                        content.innerHTML += '<div class="comment_add"><img src="images/11.jpg" alt="image"/><div class="user_info2"><div class="user_name"><h4><b>'+ username+
                                '</b></h4></div><div class="comment">'+text.value+'</div>'+
                                '</div></div>';
                        text.value = '';
                        // 内容过多时,将滚动条放置到最底端
                        content.scrollTop=content.scrollHeight;},
                    error: function(XMLHttpRequest, textStatus, errorThrown) {
                        alert("你只有登陆以后才能发表评论");
                    }
                });
            }
        }

        /*回复点赞*/
        function replyThumb(reply_id,thumbCount){
            ++thumbCount;
            var name="thumbR"+reply_id;
            var btn=document.getElementById(name);
            var param={"replyId":reply_id}
            $.ajax({
                url: "thumbReply.action",
                // 数据发送方式
                type: "post",
                /*// 接受数据格式
                 dataType: "json",*/
                // 要传递的数据
                data:param,
                // 回调函数，接受服务器端返回给客户端的值，即result值(在这里是点赞数tn)
                beforeSend:function() {},
                success : function() {
                    btn.innerHTML="赞("+thumbCount+')';
                    btn.disabled();
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("你只有登陆以后才能发表评论");
                }
            });
        }

        /*回复回复框*/
        function replyModal(comment_id,reply_id,username,comment_user)
        {
            var id="reply"+comment_id;
            var btid="btnR"+reply_id;

            var div=document.getElementById("div"+comment_id)
            if(div)
            {
                div.parentNode.removeChild(div);
            }
            var content=document.getElementById(id);
            /*content.innerHTML+=document.getElementById("commentModal").innerHTML;*/
            var btn=document.getElementById(btid);
            btn.removeAttribute("onclick");
            content.innerHTML+= '<div class="comment_reply" id="div'+comment_id+'">'+
                    '<input required="true"  type="text" id="reply-text'+comment_id+'" placeholder="请输入你的回复" value="回复 @'+comment_user +':">'+
                    '<button onclick="commentReply('+comment_id+',\''+username+'\')">回复评论</button></div>';



        }
    </script>
    <!-- 点赞功能的ajax-->
    <script>
        function show(VideoId,thumbup)
        {
            var a=document.getElementById("thumb_function");
            var thumb_box=document.getElementById("thumb_box");
            var param={"videoId":VideoId};
            $.ajax({
                url: "thumbCount.action",
                // 数据发送方式
                type: "post",
                /*// 接受数据格式
                 dataType: "json",*/
                // 要传递的数据
                data:param,
                // 回调函数，接受服务器端返回给客户端的值，即result值(在这里是点赞数tn)
                beforeSend:function()
                {
                    var obj =++thumbup;
                    $("#number_of_thumbs").html(obj);
                    a.className="after_thumb";
                    a.removeAttribute("onclick");
                    a.removeAttribute("href");
                    thumb_box.className="disabled_box-share";

                },
                success : function() {},
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("抱歉，你的点赞未生效！")
                }
            });
        }
    </script>
    <!-- 收藏功能的ajax-->
    <script>

        function open_favorite()
        {
            var content=document.getElementById("fav_box");
            $.ajax({
                url: "listFavoriteGroup.action",
                // 数据发送方式
                type: "post",
                /*// 接受数据格式
                 dataType: "json",*/
                // 要传递的数据
                data:{},
                // 回调函数，接受服务器端返回给客户端的值，即result值(在这里是点赞数tn)
                beforeSend:function() {content.innerHTML=''},
                success : function(dataMap) {
                    var jq = jQuery.noConflict();
                    jq("#fav_modal").modal("show");

                    for(var i in dataMap["favoriteGroupList"])
                    {
                        content.innerHTML+='<div class="fav_box"><a  href="javascript:;" data-dismiss="modal"'+
                                'onclick="favorite('+dataMap["favoriteGroupList"][i].groupId+ ')">'+dataMap["favoriteGroupList"][i].groupName+'</a></div>';
                    }
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("请不要重复收藏 (⊙v⊙)")
                }
            });

        }
        function favorite(groupId)
        {
            var videoId=document.getElementById("videoId");
            var param={"videoId":videoId.value,"groupId":groupId};
            $.ajax({
                url: "favCollect.action",
                // 数据发送方式
                type: "post",
                /*// 接受数据格式
                 dataType: "json",*/
                // 要传递的数据
                data:param,
                // 回调函数，接受服务器端返回给客户端的值，即result值(在这里是点赞数tn)
                beforeSend:function() {},
                success : function() {
                    document.getElementById("modal_text").innerHTML='收藏成功';
                    $('#success_modal').modal("show");
                    setTimeout(function(){$("#success_modal").modal("hide")},1000);
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("请不要重复收藏 (⊙v⊙)")
                }
            });
        }
        function cancel_new_folder()
        {
            var content=document.getElementById("new_folder_content");
            content.innerHTML="";
        }

        function add_new_folder()
        {
            var videoId=document.getElementById("videoId");
            var folderName=document.getElementById("fav_group_name");
            alert(folderName.value);
            var param={"groupName":folderName.value,"videoId":videoId.value};
            $.ajax({
                url: "favCollectWithNewFile.action",
                // 数据发送方式
                type: "post",
                data:param,
                beforeSend:function() {},
                success : function() {
                    var content=document.getElementById("new_folder_content");
                    var addContent=document.getElementById("fav_box");
                    content.innerHTML="";
                    addContent.innerHTML+='<a  href="javascript:;" data-dismiss="modal">'+folderName.value+'</a>';
                    document.getElementById("modal_text").innerHTML='增加新收藏夹';
                    $('#success_modal').modal("show");
                    setTimeout(function(){$("#success_modal").modal("hide")},1000);
                },
                error: function(XMLHttpRequest, textStatus, errorThrown) {
                    document.getElementById("modal_text").innerHTML='您需要登录以后再收藏！'
                    $('#success_modal').modal("show");
                    setTimeout(function(){$("#success_modal").modal("hide")},2000);
                }
            });
        }
        function new_folder()
        {
            var content=document.getElementById("new_folder_content");
            if(content.innerHTML=='') {
                content.innerHTML = '<div><input type="text" style="width:100%;background-color:#d3d7da" placeholder="收藏夹名称"' +
                        'id="fav_group_name"></div>' +
                        '<div style="margin-top:2%;font-size: 130%;border-bottom: 1px solid #ddd;height:12%" >' +
                        '<button style="width:50%;background-color: #0A8CBE;color:white;border:none;border-radius: 10px"' +
                        'onclick="add_new_folder()" data-dismiss="modal">新建并添加</button>' +
                        '<button style="width:50%;background-color: white;border:1px solid #ddd; border-radius: 10px"' +
                        ' onclick="cancel_new_folder()">取消</button></div>'
            }
        }

    </script>

    <!-- 举报评论弹出框 -->
    <!-- jQuery -->
    <script src="jquery-3.0.0/jquery-3.0.0.min.js"></script>
    <!-- BS JavaScript -->
    <script type="text/javascript" src="bootstrap-3.3.5-dist/js/bootstrap.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
    <script type="text/javascript">
        function report_comment(commentId)
        {
            var cmtId=document.getElementById("commentId");
            $("#report_modal").modal(show);
            cmtId.value=commentId;
        }

        function report_reply(replyId)
        {
            var rplId=document.getElementById("replyId");
            $("#report_modal_2").modal(show);
            rplId.value=replyId;
        }

        function submit_report_comment()
        {
            var reason=document.getElementById("report_main_reason");
            var commentId=document.getElementById("commentId");
            var param={"commentId":commentId.value,"reason":reason.value};

            $.ajax({
                url: "reportComment.action",
                // 数据发送方式
                type: "post",
                // 接受数据格式
                /*dataType: "json",*/
                // 要传递的数据
                data: param,
                // 回调函数，接受服务器端返回给客户端的值，即result值(在这里是点赞数tn)
                beforeSend: function () {
                },
                success: function () {
                    reason.value = '';

                    $('#success_modal').modal("show");
                    setTimeout(function(){$("#success_modal").modal("hide")},1000);

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    document.getElementById("modal_text").innerHTML='您只能举报一次'
                    $('#success_modal').modal("show");
                    setTimeout(function(){$("#success_modal").modal("hide")},1500);
                }
            });

        }

        function submit_report_reply()
        {
            var reason=document.getElementById("report_main_reason_2");
            var replyId=document.getElementById("replyId");
            var param={"replyId":replyId.value,"reason":reason.value};

            $.ajax({
                url: "reportReply.action",
                // 数据发送方式
                type: "post",
                // 接受数据格式
                /*dataType: "json",*/
                // 要传递的数据
                data: param,
                // 回调函数，接受服务器端返回给客户端的值，即result值(在这里是点赞数tn)
                beforeSend: function () {
                },
                success: function () {
                    reason.value = '';

                    document.getElementById("modal_text").innerHTML='举报成功'
                    $('#success_modal').modal("show");
                    setTimeout(function(){$("#success_modal").modal("hide")},1000);

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    document.getElementById("modal_text").innerHTML='您只有在登陆以后才能评论'
                    $('#success_modal').modal("show");
                    setTimeout(function(){$("#success_modal").modal("hide")},2000);
                }
            });

        }
    </script>
    <!-- 删除功能的ajax-->
    <script>
        function deleteComment(commentId)
        {
            var param={"commentId":commentId};
            var content=document.getElementById("comment"+commentId);
            $.ajax({
                url: "deleteComment.action",
                // 数据发送方式
                type: "post",
                // 接受数据格式
                /*dataType: "json",*/
                // 要传递的数据
                data: param,
                // 回调函数，接受服务器端返回给客户端的值，即result值(在这里是点赞数tn)
                beforeSend: function () {
                },
                success: function () {
                    content.parentNode.removeChild(content);
                    document.getElementById("modal_text").innerHTML='删除成功';
                    $('#success_modal').modal("show");
                    setTimeout(function(){$("#success_modal").modal("hide")},1000);

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("删除失败！");
                }
            });
        }

        function deleteReply(replyId)
        {
            var param={"replyId":replyId};
            var content=document.getElementById("replyG"+replyId);
            $.ajax({
                url: "deleteReply.action",
                // 数据发送方式
                type: "post",
                // 接受数据格式
                /*dataType: "json",*/
                // 要传递的数据
                data: param,
                // 回调函数，接受服务器端返回给客户端的值，即result值(在这里是点赞数tn)
                beforeSend: function () {
                },
                success: function () {
                    content.parentNode.removeChild(content);
                    document.getElementById("modal_text").innerHTML='删除成功';
                    $('#success_modal').modal("show");
                    setTimeout(function(){$("#success_modal").modal("hide")},1000);

                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert("删除失败！");
                }
            });
        }
    </script>

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
                        <%--<li><a href="upload.jsp" title="Upload Video" ><i class="fa fa-upload"></i>上传</a></li>--%>
                        <%  String loginUsername = (String)session.getAttribute("username");
                            if(loginUsername == null)
                            {%>
                        <li><a href="login.jsp" title="Log in"><i class="fa fa-user"></i>登陆</a></li>
                        <li><a href="register.jsp" title="Register"><i class="fa fa-bell"></i>注册</a></li>
                        <%}else{ %>
                        <li><a href="userProfile.jsp" title="Profile"target="_blank"><i class="fa fa-renren"></i>个人信息</a></li>
                        <li><a href="#" title="Profile"><i class="fa fa-renren"></i>安全退出</a></li>
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
            <li class="colour-7"><a href="gallery.jsp">鬼畜</a></li>
            <li class="colour-8"><a href="gallery.jsp">更多</a></li>
        </ul>
    </nav>
    <!--////////////////////////////////////Container-->
    <div id="debugger">
        <div id="w-main" class="debugger-window" tabindex="0" style="margin-top: 0">

            <div id="player-unit">
                <div class="m20 abp" id="player">
                    <div id="c-region" style="display:none;">640x480</div>
                    <div id="commentCanvas" class="container" style="padding-left: 0	"></div>
                </div>
            </div>
        </div>
    </div>
    <input hidden value="<s:property value="videoBean.link"/>" id="path">

    <section id="container" class="index-page" style="margin-top: 30%">
        <div class="wrap-container zerogrid">
            <div class="row">
                <div id="main-content" class="col-2-3">
                    <div class="wrap-vid">
                        <div class="barrage">
                            <div class="barrage-content">
                                <ul>
                                    <label>发表弹幕：</label>
                                    <input type="text" id="input" placeholder="在这里发表你的吐槽">
                                    <button href="javascript:;" onclick="send()">发送</button>
                                </ul>
                                <ul>
                                    <label style="margin-left: -66%">弹幕颜色：</label>
                                    <input type="color" id="mycolor" value="#92cddc" style="width: 10%;">
                                </ul>
                                <ul>
                                    <label>弹幕类型：</label>
                                    <select id="barrageType">
                                        <option value="1">滚动弹幕</option>
                                        <option value="5">顶部弹幕</option>
                                        <option value="4">底部弹幕</option>
                                    </select>
                                </ul>`
                                <ul>
                                    <label>屏蔽设定：</label>
                                    <select id="restrictMode">
                                        <option value="1">滚动弹幕</option>
                                        <option value="5">顶部弹幕</option>
                                        <option value="4">底部弹幕</option>
                                    </select>
                                    <input type="text" id="restrictWord" placeholder="要屏蔽的关键词">
                                    <button href="javascript:;" onclick="addRules()">添加屏蔽</button>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="content-bkg">
                        <div class="row">
                            <div class="share">
                                <div class="col-1-4">
                                    <div class="wrap-col">
                                        <div class="box-share">
                                            <a href="javascript:;" data-toggle="modal"  data-target="#myModal">
                                                <i class="fa fa-comments"></i>
                                                <span>评论</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-1-4">
                                    <div class="wrap-col">
                                        <div class="box-share">
                                            <a href="#">
                                                <i class="fa fa-share"></i>
                                                <span>分享 </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <%--<%int thumb=110; %>--%>
                                <div class="col-1-4">
                                    <div class="wrap-col">
                                        <div class="box-share" id="thumb_box">
                                            <a href="javascript:;" id="thumb_function" onclick="show(<s:property value="videoBean.videoId"/>,
                                            <s:property value="videoBean.thumbCount"/>)">
                                                <i class="fa fa-thumbs-up"></i>
                                                <span id="number_of_thumbs"><s:property value="videoBean.thumbCount"/> </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-1-4">
                                    <div class="wrap-col">
                                        <div class="box-share">
                                            <a  href="javascript:;"onclick="open_favorite()">
                                                <i class="fa fa-plus"></i>
                                                <span>收藏</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="content-bkg">
                        <h1 class="vid-name">交大军训</h1>
                        <div class="info">
                            <h5>By <a href="#">孙励天</a></h5>
                            <span><i class="fa fa-calendar"></i>25/3/2015</span>
                            <span><i class="fa fa-heart"></i>200</span>
                        </div>

                        <p>这次的军训之旅虽然短暂，我们的排练也远不尽如人意。其间经历了不少让我们蒙蔽的挫折，但一年后的今天细细回想，我们。。。</p>
                    </div>
                    <div class="tags">
                        <label style="font-size: 140%">标签</label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#">交大军训</a>
                        <a href="#">六连</a>
                    </div>
                    <section class="vid-related">
                        <div class="header">
                            <h2>相关视频</h2>
                        </div>
                        <div class="row"><!--Start Box-->
                            <div id="owl-demo-1" class="owl-carousel">
                                <div class="item wrap-vid">
                                    <div class="zoom-container">
                                        <a href="single.jsp">
											<span class="zoom-caption">
												<i class="icon-play fa fa-play"></i>
											</span>
                                            <img src="images/temp.jpg" />
                                        </a>
                                    </div>
                                    <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                                    <div class="info">
                                        <h5>By <a href="#">Kelvin</a></h5>
                                        <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                        <span><i class="fa fa-heart"></i>1,200</span>
                                    </div>
                                </div>
                                <div class="item wrap-vid">
                                    <div class="zoom-container">
                                        <a href="single.jsp">
											<span class="zoom-caption">
												<i class="icon-play fa fa-play"></i>
											</span>
                                            <img src="images/temp.jpg" />
                                        </a>
                                    </div>
                                    <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                                    <div class="info">
                                        <h5>By <a href="#">Kelvin</a></h5>
                                        <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                        <span><i class="fa fa-heart"></i>1,200</span>
                                    </div>
                                </div>
                                <div class="item wrap-vid">
                                    <div class="zoom-container">
                                        <a href="single.jsp">
											<span class="zoom-caption">
												<i class="icon-play fa fa-play"></i>
											</span>
                                            <img src="images/temp.jpg" />
                                        </a>
                                    </div>
                                    <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                                    <div class="info">
                                        <h5>By <a href="#">Kelvin</a></h5>
                                        <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                        <span><i class="fa fa-heart"></i>1,200</span>
                                    </div>
                                </div>
                                <div class="item wrap-vid">
                                    <div class="zoom-container">
                                        <a href="single.jsp">
											<span class="zoom-caption">
												<i class="icon-play fa fa-play"></i>
											</span>
                                            <img src="images/temp.jpg" />
                                        </a>
                                    </div>
                                    <h3 class="vid-name"><a href="#">Video's Name</a></h3>
                                    <div class="info">
                                        <h5>By <a href="#">Kelvin</a></h5>
                                        <span><i class="fa fa-calendar"></i>25/3/2015</span>
                                        <span><i class="fa fa-heart"></i>1,200</span>
                                    </div>
                                </div>
                                <div class="item wrap-vid">
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
                                <div class="item wrap-vid">
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
                                <div class="item wrap-vid">
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
                                <div class="item wrap-vid">
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
                    </section>
                    <section class="vid-related">
                        <div class="header">
                            <h2>评论专区</h2>
                        </div>
                        <ul class="comment" id="comment-field" height="100px">
                            <% int count=0;int cc;%>
                            <s:iterator value="commentList" var="comment" status="st">
                                <s:set name="commentPusher" value="commentPusherList[#st.index].username"/>
                                <li class="comment_add"  id="comment${comment.commentId}">
                                    <img src="images/10.jpg" alt="image"/>
                                    <div class="user_info" id="reply${comment.commentId}">
                                        <div class="hd">
                                            <div class="user_name">
                                                <h4><b><%--${comment.commentPusher}--%>
                                                        <%--<s:iterator value="commentPusherList[#st.index]" var="commentPusher" status="test">--%>
                                                        <%--${commentPusher}--%>
                                                        <%--</s:iterator>--%>
                                                        <%--<s:property value="commentPusherList[#st.index].username"/>--%>
                                                        ${commentPusher}
                                                </b>
                                                    <span class="date_time">${comment.createTime.substring(0,19)}</span>
                                                </h4>
                                            </div>
                                            <div class="comment">${comment.content}</div>
                                            <div class="bottom-function">
                                                <label>#<s:property value="commentList.size-#st.index"/> </label>
                                                <button id="thumb${comment.commentId}" onclick="commentThumb(${comment.commentId},${comment.thumbCount})" >赞(${comment.thumbCount})</button>
                                                <button id="btn${comment.commentId}" onclick="commentModal(${comment.commentId},'<%=session.getAttribute("username")%>')">回复</button>
                                                <button onclick="report_comment(${comment.commentId})">举报</button>
                                                    <%--<s:property value="#commentPusher"/>--%>
                                                <s:if test="#commentPusher==#session.username">
                                                    <button onclick="deleteComment(${comment.commentId})" class="delete"style="float: right;">删除</button>
                                                </s:if>
                                            </div>
                                        </div>
                                        <s:iterator value="replyList[#st.index]" var="reply" status="rst">
                                            <s:set name="replyPusher" value="replyPusherList[#st.index][#rst.index].username"/>
                                            <div id="replyG${reply.replyId}"/>
                                            <img src="images/10.jpg" alt="image"/>
                                            <div class="user_info2" id="reply${comment.commentId}"	>
                                                <div class="user_name">
                                                    <h4><b><%--${replyList.replyPusher}--%>
                                                            <%--<s:iterator value="replyPusherList[#st.index]" var="replyPusher">--%>
                                                            <%--${replyPusher}--%>
                                                            <%--</s:iterator>--%>
                                                            <%--<s:property value="replyPusherList[#st.index][#rst.index].username"/>--%>
                                                            ${replyPusher}
                                                    </b>
                                                        <!-- rr[#st.index-->
                                                    </h4>
                                                </div>
                                                <div class="comment">${reply.content}</div>
                                                <div class="bottom-function">
                                                    <button id="thumbR${reply.replyId}" onclick="replyThumb(${reply.replyId},${reply.thumbCount})" >赞(${reply.thumbCount})</button>
                                                    <button id="btnR${reply.replyId}" onclick="replyModal(${comment.commentId},${reply.replyId},
                                                            '<%=session.getAttribute("username")%>','<s:property value="replyPusherList[#st.index][#rst.index].username"/>')">回复</button>
                                                    <button onclick="report_reply(${reply.replyId})">举报</button>
                                                    <s:if test="#replyPusher==#session.username">
                                                        <button class="delete"  onclick="deleteReply(${reply.replyId})"	style="float: right;">删除</button>
                                                    </s:if>
                                                        <%--<s:if test="${comment.commentPusher}==<%=session.getAttribute("username")%>">
                                                            <button style="float: right;">删除</button>
                                                        </s:if>--%>
                                                </div>
                                            </div>
                                        </s:iterator>
                                    </div>
                                </li>
                                <% count=count+1;%>
                            </s:iterator>

                        </ul>

                    </section>

                </div>
            </div>
        </div>
    </section>
    <!-- 这一块专门用来储存 -->


    <!-- 收藏专用模态框（Modal） -->
    <div class="modal fade" id="fav_modal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true" >
        <div class="fav_dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" >
                        <span><i style="color: orange;vertical-align: middle"class="fa fa-star"></i></span><span>收藏</span>
                    </h4>
                    <br/>
                </div>
                <div id="dlg-fav" >
                    <div class="modal-body"  style="margin-left:2%;max-height:70%;overflow-y: scroll">
                        <div id="new_folder_content"></div>
                        <div id="fav_box">
                            <%--&lt;%&ndash;<% int i=0;for(;i<3;i++){%>&ndash;%&gt;--%>
                            <%--<s:iterator value="favoriteGroupList" var="favoriteGroup" status="st">--%>

                            <%--<div class="fav_box">--%>
                            <%--<a  href="javascript:;" data-dismiss="modal" onclick="favorite(${favoriteGroup.groupId} )">${favoriteGroup.groupName}</a>--%>
                            <%--</div>--%>
                            <%--</s:iterator>--%>
                        </div>
                        <%--<%}%>--%>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-primary" style="float:left;width: 100%" onclick="new_folder()">
                            新建收藏夹
                        </button>
                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <!-- End of dialog -->

    <!-- 评论专用模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" style="width:100%"
         aria-labelledby="myModalLabel" aria-hidden="true" >
        <div class="modal-dialog" id="dlg-modal">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        添加评论
                    </h4>
                </div>
                <div id="dlg-comment">
                    <div class="modal-body" style="padding-left: 2%" >
                        <p>视频编号：<input type="text" readonly value="<s:property value="videoBean.videoId"/>" name="videoId" id="videoId" style="border:none"></p>
                        <p>我的评论：
                            <textarea required="true"  id="comment-text" name="commentContent" placeholder="在这里发表我的评论..." required ></textarea></p>
                    </div>
                    <div class="modal-footer">
                        <button type="reset" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                        <button class="btn btn-primary" onclick="comment('<%=session.getAttribute("username")%>',<%=++count%>,<s:property value="videoBean.videoId"/>)" id="comment-btn" data-dismiss="modal">
                            提交
                        </button>
                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <!-- 举报专用模态框（Modal） -->
    <div class="modal fade" id="report_modal" tabindex="-1" role="dialog" style="width:100%"
         aria-labelledby="myModalLabel" aria-hidden="true" >
        <div class="modal-dialog" id="report_dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title">
                        举报评论
                    </h4>
                </div>
                <div id="report_reason">
                    <div class="modal-body" style="padding-left: 2%" >
                        <p>评论编号：<input type="text" readonly value="" name="commentId" id="commentId" style="border:none"></p>
                        <p><textarea  id="report_main_reason" name="commentContent" placeholder="在这里写出你的理由..." required ></textarea></p>
                    </div>
                    <div class="modal-footer">
                        <button type="reset" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                        <button class="btn btn-primary" onclick="submit_report_comment()"  data-dismiss="modal">
                            举报
                        </button>
                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <!-- 举报专用模态框2（Modal） -->
    <div class="modal fade" id="report_modal_2" tabindex="-1" role="dialog" style="width:100%"
         aria-labelledby="myModalLabel" aria-hidden="true" >
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title">
                        举报回复
                    </h4>
                </div>
                <div>
                    <div class="modal-body" style="padding-left: 2%" >
                        <p>回复编号：<input type="text" readonly value="" name="replyId" id="replyId" style="border:none"></p>
                        <p><textarea  id="report_main_reason_2" name="commentContent" placeholder="在这里写出你的理由..." required ></textarea></p>
                    </div>
                    <div class="modal-footer">
                        <button type="reset" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                        <button class="btn btn-primary" onclick="submit_report_reply()"  data-dismiss="modal">
                            举报
                        </button>
                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <!-- after模态框-->
    <div class="modal fade" id="success_modal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true" >
        <div class="modal-dialog" id="delete_success_dialog">
            <div class="modal-content" style="width: 30%">
                <div class="modal-header" style="align-content: center" >
                    <p id="modal_text">删除成功</p>
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>
    <!-- End of dialog -->

    <div hidden id="comment-help">
    </div>


    <script src="js/demo.js"></script>
    <!-- Search -->
    <script src="js/modernizr.custom.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/uisearch.js"></script>
    <script>
        new UISearch( document.getElementById( 'sb-search' ) );
    </script>
    <!-- Carousel -->
    <%--<script src="js/owl.carousel.js"></script>--%>
    <%--<script>--%>
        <%--$(document).ready(function() {--%>

            <%--$("#owl-demo-1").owlCarousel({--%>
                <%--items : 4,--%>
                <%--lazyLoad : true,--%>
                <%--navigation : true--%>
            <%--});--%>
            <%--$("#owl-demo-2").owlCarousel({--%>
                <%--items : 4,--%>
                <%--lazyLoad : true,--%>
                <%--navigation : true--%>
            <%--});--%>

        <%--});--%>
    <%--</script>--%>
</div>

<%--<link id="jquiCSS" rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/themes/ui-lightness/jquery-ui.css" type="text/css" media="all">--%>
<%--<link href="css/evol-colorpicker.css" rel="stylesheet">--%>
<%--<script src="js/jquery-2.1.1.js" type="text/javascript"></script>--%>
<%--<script src="js/jquery-ui.min.js" type="text/javascript"></script>--%>
<%--<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>--%>
<%--<script src="js/jquery-ui-1.11.1.min.js" type="text/javascript"></script>--%>
<%--<script src="js/evol-colorpicker.js" type="text/javascript"></script>--%>

<%--<script>--%>
    <%--$(document).ready(function(){--%>
<%--//		$('.css').on('click', function(evt){--%>
<%--//			$('.css').removeClass('sel');--%>
<%--//			$(this).addClass('sel');--%>
<%--//		});--%>

        <%--$('#mycolor').colorpicker({showOn:'button'});--%>
    <%--});--%>
<%--</script>--%>
</body>
<script type="text/javascript" src="js/CommentCoreLibrary.js"></script>
<script type="text/javascript" charset="utf-8">

    var markerInfo = [
        [0, "JPlay"],
        [13, "Copyright"],
        [25, "2016"],
        [37, "All right"],
        [56, "Reserved"]
    ];
    var markers = [];
    for(var i=0; i<markerInfo.length; i++) {
        var info = markerInfo[i];
//			alert("SUCCESS");
        markers.push(new ClapprMarkersPlugin.StandardMarker(info[0], info[1]));

    }
    var thumbs = [];
    for (var i=0; i<104; i++) {
        thumbs.push({
            url: "http://tjenkinson.me/clappr-thumbnails-plugin/assets/thumbnails/thumb_"+(i+1)+".jpg",
            time: 1 + (i*2)
        });
    }
    var player = new Clappr.Player({
        source: 'videos/1469089653784.mp4',
        parentId: '#commentCanvas',
        plugins: {
            core: [PlaybackRatePlugin,
                ClapprThumbnailsPlugin,
                ClapprMarkersPlugin
            ]
        },
        playbackRateConfig: {
            defaultValue: '1.0',
            options: [
                {value: '0.5', label: '0.5x'},
                {value: '1.0', label: '1x'},
                {value: '2.0', label: '2x'},
                {value: '4.0', label: '4x'},
            ]
        },
        scrubThumbnails: {
            backdropHeight: 64, // set to 0 or null to disable backdrop
            spotlightHeight: 84, // set to 0 or null to disable spotlight
            backdropMinOpacity: 0.4, // optional
            backdropMaxOpacity: 1, // optional
            thumbs: thumbs
        },
        markersPlugin: {
            markers: markers
        }
    });


    var newTimeline = [];

    function addRules() {
        var rMode = document.getElementById("restrictMode").value;
        var rText = document.getElementById("restrictWord").value;
        var newRule = {"mode":parseInt(rMode), "text":rText};
        cm.addRules(newRule);
    }

    function update(){
        var videoId = document.getElementById("videoId");;
        var jq = jQuery.noConflict();
        jq.ajax({
            url : "barrageUpdateAction.action",
            type : "POST",
            data : "videoId=" + videoId + "&barrageJson=" + JSON.stringify(newTimeline),
            dataType: "json",
            success:function(){
                console.log("update success");
            }
        });
    }

    function fetch(){
        console.log("begin fetch");
        var tmr = -1;
        var playHead = 0;

        var jq = jQuery.noConflict();
        jq.ajax({
            url : "barrageFetchAction.action",
            type : "POST",
            data : "videoId=" + document.getElementById("videoId"),//document.getElementById("videoId"),
            dataType: "json",
            success:function(data){
                console.log(data);
                var timeline = [];
                if (data.barrageJson) {
                    timeline = JSON.parse(data.barrageJson);
                    newTimeline = JSON.parse(data.barrageJson);
                    console.log(timeline);
                }
                cm.load(timeline);

//                cm.startTimer();
                tmr = setInterval(function() {
                    if (player.isPlaying()) {
                        cm.startTimer();
                        playHead = player.getCurrentTime() * 1000;
                        cm.time(playHead);
                        console.log("playHead = " + playHead);
                    } else {
                        cm.stop();
                        cm.clear();
                    }
//                    displayTime(playHead);
                }, 50);
            }
        });
    }

    function send() {
        var text = document.getElementById("input").value;
        var stime = player.getCurrentTime() * 1000 + 50;
        var color = document.getElementById("mycolor").value;
        var mode = document.getElementById("barrageType").value;
        var data = {"stime":stime,"text":text,"mode":parseInt(mode),"color":parseInt(color.replace(/#/,"0x")),"border":false};
        var add = JSON.parse(JSON.stringify(data));
//			console.log(mode);

        BinArray.binsert(newTimeline, data, function(a, b){
            if(a.stime > b.stime) return 2;
            else if(a.stime < b.stime) return -2;
            else {
                if(a.date > b.date) return 1;
                else if(a.date < b.date) return -1;
                else if(a.dbid != null && b.dbid != null){
                    if(a.dbid > b.dbid) return 1;
                    else if(a.dbid < b.dbid) return -1;
                    return 0;
                } else
                    return 0;
            }
        });
        update();
//			console.log("newTimeline");
//			console.log(newTimeline);

        add["border"] = true;
//        console.log(data);
        cm.send(add);
        console.log("stime = " + stime);
    }

    function test(){
        var data1 = {"stime":5000,"text":"Hello World1","mode":1,"color":0xffffff};
        var data2 = {"stime":6000,"text":"Hello World2","mode":2,"color":0xffffff};
        var data3 = {"stime":7000,"text":"Hello World3","mode":3,"color":0xffffff};
        var data4 = {"stime":8000,"text":"Hello World4","mode":4,"color":0xffffff};
        var data5 = {"stime":9000,"text":"Hello World5","mode":5,"color":0xffffff};
        var data6 = {"stime":10000,"text":"Hello World6","mode":6,"color":0xffffff};

        cm.insert(data1);
        cm.insert(data2);
        cm.insert(data3);
        cm.insert(data4);
        cm.insert(data5);
        cm.insert(data6);
    }

    function init(){
        window.cm = new CommentManager(document.getElementById('commentCanvas'));
        cm.init();
        fetch();
    }

    window.onload = init();
    //
    //		window.addEventListener("load", function(){
    //
    //			init();
    //			fetch();
    //		});

</script>
</jsp>