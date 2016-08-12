<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE jsp>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!--[if lt IE 7 ]><jsp class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><jsp class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><jsp class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><jsp lang="en"> <!--<![endif]-->
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
	<script type="text/javascript" src="js/CommentCoreLibrary.min.js"></script>

	<script type="text/javascript" src="https://cdn.jsdelivr.net/clappr/latest/clappr.min.js"></script>
	<script type="text/javascript" src="js/level-selector.min.js"></script>
	<script type="text/javascript" src="js/clappr-playback-rate-plugin.min.js"></script>
	<!-- CSS
  ================================================== -->
	<link rel="stylesheet" href="css/zerogrid.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/menu.css">
	<link rel="stylesheet" href="bootstrap-3.3.5-dist/css/bootstrap.min.css">
	<!-- Owl Carousel Assets -->
	<link href="css/owl.carousel.css" rel="stylesheet">
	<link href="css/owl.theme.css" rel="stylesheet">
	<!-- Custom Fonts -->
	<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">


	<!-- 评论功能的ajax-->
	<script>
		function comment(username)
		{
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
			//评论功能
			/*var arrIcon = ['http://www.xttblog.com/icons/favicon.ico','http://www.xttblog.com/wp-content/uploads/2016/03/123.png'];*/
			var num = 0;     //控制头像改变
			var iNow = -1;    //用来累加改变左右浮动
			/*var icon = document.getElementById('user_face_icon').getElementsByTagName('img');*/
			var btn=document.getElementById('comment-btn');
			var id =  document.getElementById('videoId');
			var text = document.getElementById('comment-text');
			var content = document.getElementById('comment-field');
			var param={"videoId":id.value,"commentContent":text.value};

			$.ajax({
				url: "commentAction.action",
				// 数据发送方式
				type: "post",
				/*// 接受数据格式
				 dataType: "json",*/
				// 要传递的数据
				data:param,
				// 回调函数，接受服务器端返回给客户端的值，即result值(在这里是点赞数tn)
				beforeSend:function() {},
				success : function() {content.innerHTML += '<li class="comment_add"><img src="images/10.jpg" alt="image"/><div class="user_info"><div class="user_name"><h4><b>'+username+
						'</b><span class="date_time">'+ complete_time+'  </span></h4></div><div class="comment">'+text.value+'</div></div></li>';
					text.value = '';
					alert("发送成功");
					// 内容过多时,将滚动条放置到最底端
					content.scrollTop=content.scrollHeight;},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert("你只有登陆以后才能发表评论");
				}
			});
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
				success : function() {alert("suc")},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert("收藏失败 TUT")
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
			$.ajax({
				url: "favCollectWithNewFile.action",
				// 数据发送方式
				type: "post",
				data:{},
				beforeSend:function() {},
				success : function() {alert("suc")},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert("添加失败 TUT");
					alert(XMLHttpRequest.status);
				}
			});
		}
		function new_folder()
		{
			var content=document.getElementById("new_folder_content");
			content.innerHTML='<div><input type="text" style="width:100%;background-color:#d3d7da" placeholder="收藏夹名称"'+
							'id="fav_group_name"></div>'+
							'<div style="margin-top:2%;font-size: 130%;border-bottom: 1px solid #ddd;height:12%" >'+
							'<button style="width:50%;background-color: #0A8CBE;color:white;border:none;border-radius: 10px"'+
							'onclick="add_new_folder()" data-dismiss="modal">新建并添加</button>'+
							'<button style="width:50%;background-color: white;border:1px solid #ddd; border-radius: 10px"'+
							' onclick="cancel_new_folder()">取消</button></div>'
		}

	</script>


</head>
<body id="wrapper" >
<section>
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
						<li><a href="login.jsp" title="Log in" style="color:#ffffdd"><i class="fa fa-user"></i>登陆</a></li>
						<li><a href="register.jsp" title="Register" style="color:#ffffdd"><i class="fa fa-bell"></i>注册</a></li>
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
					<div id="commentCanvas" class="container"></div>
				</div>
				<script type="text/javascript" charset="utf-8">

					var player = new Clappr.Player({
						source: 'videos/LoveLive!The_School_Idol_Movie.mp4',
						parentId: '#commentCanvas',
						plugins: {
							core: [PlaybackRatePlugin]
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
					});

				</script>
				<div class="barrage-content">
					<label>Input:</label>
					<input type="text" id="input" placeholder="Enter input here">
					<button href="javascript:;" onclick="send()">Send</button>

					<button id="myinit" href="javascript:;" onclick="init()">Init</button>
					<button id="mytest" href="javascript:;" onclick="test()">Test</button>
				</div>
			</div>
		</div>
	</div>
	<section id="container" class="index-page" style="margin-top: 600px">
		<div class="wrap-container zerogrid">
			<div class="row">
				<div id="main-content" class="col-2-3">

					<div class="content-bkg">
						<div class="row">
							<div class="share">
								<div class="col-1-4">
									<div class="wrap-col">
										<div class="box-share">
											<a data-toggle="modal"  data-target="#myModal">
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
								<%int thumb=110; %>
								<div class="col-1-4">
									<div class="wrap-col">
										<div class="box-share" id="thumb_box">
											<a id="thumb_function" onclick="show('<%=1%>','<%=thumb%>')">
												<i class="fa fa-thumbs-up"></i>
												<span id="number_of_thumbs"><%=thumb %></span>
											</a>
										</div>
									</div>
								</div>
								<div class="col-1-4">
									<div class="wrap-col">
										<div class="box-share">
											<a  data-toggle="modal"  data-target="#fav_modal">
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
						<ul class="comment" id="comment-field" height="100px">
							<div class="header">
								<h2>评论专区</h2>
							</div>

						</ul>
					</section>
					<!-- 这一块专门用来储存 -->

				</div>

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
									<% int i=0;for(;i<3;i++){%>
									<div class="fav_box">
										<a  data-dismiss="modal" value="默认收藏夹" onclick="favorite(<%=i%>)">默认收藏夹</a>
									</div>
									<%}%>
								</div>
								<div class="modal-footer">
									<button class="btn btn-primary" style="float:left;width: 100%" onclick="new_folder(<%=i%>)">
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
									<p>视频编号：<input type="text" readonly value="1" name="videoId" id="videoId" style="border:none"></p>
									<p>我的评论：
										<textarea id="comment-text" name="commentContent" placeholder="在这里发表我的评论..." required ></textarea></p>
								</div>
								<div class="modal-footer">
									<button type="reset" class="btn btn-default"
											data-dismiss="modal">关闭
									</button>
									<button class="btn btn-primary" onclick="comment('<%=session.getAttribute("username")%>')" id="comment-btn" data-dismiss="modal">
										提交
									</button>
								</div>
							</div>
						</div><!-- /.modal-content -->
					</div><!-- /.modal -->
				</div>
				<!-- End of dialog -->
			</div>
		</div>
	</section>

</div>
</section>

<!-- Slider -->
<!-- Slider -->
<script src="js/jquery.min.js"></script>
<script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
<script src="js/jquery-2.1.1.js"></script>
<script src="js/demo.js"></script>
<!-- Search -->
<%--<script src="js/modernizr.custom.js"></script>--%>
<script src="js/classie.js"></script>
<%--<script src="js/uisearch.js"></script>--%>
<script>
	new UISearch( document.getElementById( 'sb-search' ) );
</script>
<!-- Carousel -->
<script src="js/owl.carousel.js"></script>
<script>
	function send(){
		var text = document.getElementById("input").value;
		var data = {"text":text}
		cm.send(new ScrollComment(cm, data));
	}


	function init(){
		var canvas = document.getElementById('commentCanvas');
		canvas.offsetHeight
		window.cm = new CommentManager(canvas);
		cm.init();

		var tmr = -1;
		var start = 0;
		var playhead = 0;

		cm.clear();
		start = 0;

		cm.startTimer();
		start = new Date().getTime();
		tmr = setInterval(function(){
			playhead = new Date().getTime() - start;
			cm.time(playhead);
			// displayTime(playhead);
		},42);
	}

	window.addEventListener("load", function(){
		init();
	});
</script>
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

	});
</script>
</div>
</body>
</jsp>