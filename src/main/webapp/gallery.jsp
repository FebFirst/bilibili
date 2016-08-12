<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE jsp>
<!--[if lt IE 7 ]><jsp class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><jsp class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><jsp class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><jsp lang="en"> <!--<![endif]-->
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
						<li><a href="login.jsp" title="Log in" style="color:#ffffdd"><i class="fa fa-user"></i>登陆</a></li>
						<li><a href="register.jsp" title="Register" style="color:#ffffdd"><i class="fa fa-bell"></i>注册</a></li>
						<%}else{ %>
						<li><a href="userProfile.jsp" title="Profile"><i class="fa fa-renren"></i>个人信息</a></li>
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
	<section id="container" class="index-page">
		<div class="wrap-container zerogrid">
			<div class="row">
				<div id="main-content" class="col-2-3">
					<section class="all">
						<div class="header">
							<h2>All Post</h2>
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
								</div>
							</div>
						</div>
					</section>
					<div class="navigation">
						<ul>
							<li><a href="#"><</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">></a></li>
						</ul>
					</div>
				</div>
				<div id="sidebar" class="col-1-3">
					<form id="form-container" action="">
						<!--<input type="submit" id="searchsubmit" value="" />-->
						<a class="search-submit-button" href="javascript:void(0)">
							<i class="fa fa-search"></i>
						</a>
						<div id="searchtext">
							<input type="text" id="s" name="s" placeholder="Search Something...">
						</div>
					</form>
					<!---- Start Widget ---->
					<div class="widget wid-post">
						<div class="wid-header">
							<h5>Latest Posts</h5>
						</div>
						<div class="wid-content">
							<div class="post wrap-vid">
								<div class="zoom-container">
									<a href="single.jsp">
										<span class="zoom-caption">
											<i class="icon-play fa fa-play"></i>
										</span>
										<img src="images/temp.jpg" />
									</a>
								</div>
								<div class="wrapper">
									<h5 class="vid-name"><a href="#">Video's Name</a></h5>
									<div class="info">
										<h6>By <a href="#">Kelvin</a></h6>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> 
										<span><i class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
							<div class="post wrap-vid">
								<div class="zoom-container">
									<a href="single.jsp">
										<span class="zoom-caption">
											<i class="icon-play fa fa-play"></i>
										</span>
										<img src="images/temp.jpg" />
									</a>
								</div>
								<div class="wrapper">
									<h5 class="vid-name"><a href="#">Video's Name</a></h5>
									<div class="info">
										<h6>By <a href="#">Kelvin</a></h6>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> 
										<span><i class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
							<div class="post wrap-vid">
								<div class="zoom-container">
									<a href="single.jsp">
										<span class="zoom-caption">
											<i class="icon-play fa fa-play"></i>
										</span>
										<img src="images/temp.jpg" />
									</a>
								</div>
								<div class="wrapper">
									<h5 class="vid-name"><a href="#">Video's Name</a></h5>
									<div class="info">
										<h6>By <a href="#">Kelvin</a></h6>
										<span><i class="fa fa-calendar"></i>25/3/2015</span> 
										<span><i class="fa fa-heart"></i>1,200</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!---- Start Widget ---->
					<div class="widget wid-news">
						<div class="wid-header">
							<h5>Top News</h5>
						</div>
						<div class="wid-content">
							<div class="row">
								<div class="wrap-vid">
									<div class="zoom-container">
										<a href="single.jsp">
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
										<a href="single.jsp">
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
										<a href="single.jsp">
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!--////////////////////////////////////Footer-->
	<%--<footer>--%>
		<%--<div class="zerogrid top-footer">--%>
			<%--<div class="row">--%>
				<%--<div class="col-1-5">--%>
					<%--<a href="#"><img src="images/15.jpg" /></a>--%>
				<%--</div>--%>
				<%--<div class="col-1-5">--%>
					<%--<a href="#"><img src="images/16.jpg" /></a>--%>
				<%--</div>--%>
				<%--<div class="col-1-5">--%>
					<%--<a href="#"><img src="images/17.jpg" /></a>--%>
				<%--</div>--%>
				<%--<div class="col-1-5">--%>
					<%--<a href="#"><img src="images/18.jpg" /></a>--%>
				<%--</div>--%>
				<%--<div class="col-1-5">--%>
					<%--<a href="#"><img src="images/19.jpg" /></a>--%>
				<%--</div>--%>
			<%--</div>--%>
		<%--</div>--%>
		<%--<div class="zerogrid wrap-footer">--%>
			<%--<div class="row">--%>
				<%--<div class="col-1-4 col-footer-1">--%>
					<%--<div class="wrap-col">--%>
						<%--<a href="index.jsp" class="logo"><img src="images/logo.png" /></a>--%>
						<%--<p>Ut volutpat consectetur aliquam. Curabitur auctor in nis ulum ornare. Sed consequat, augue condimentum fermentum gravida, metus elit vehicula dui.</p>--%>
					<%--</div>--%>
				<%--</div>--%>
				<%--<div class="col-1-4 col-footer-2">--%>
					<%--<div class="wrap-col">--%>
						<%--<h3>Categories</h3>--%>
						<%--<ul>--%>
							<%--<li><a href="#">Action</a></li>--%>
							<%--<li><a href="#">Romantic</a></li>--%>
							<%--<li><a href="#">Cartoon</a></li>--%>
							<%--<li><a href="#">Zombies</a></li>--%>
						<%--</ul>--%>
					<%--</div>--%>
				<%--</div>--%>
				<%--<div class="col-1-4 col-footer-3">--%>
					<%--<div class="wrap-col">--%>
						<%--<h3>Recent Posts</h3>--%>
						<%--<ul>--%>
							<%--<li><a href="#">New Videos</a></li>--%>
							<%--<li><a href="#">Featured Videos</a></li>--%>
							<%--<li><a href="#">Most Viewed Videos</a></li>--%>
							<%--<li><a href="#">Sports Videos</a></li>--%>
						<%--</ul>--%>
					<%--</div>--%>
				<%--</div>--%>
				<%--<div class="col-1-4 col-footer-4">--%>
					<%--<div class="wrap-col">--%>
						<%--<h3>Flickr Photos</h3>--%>
						<%--<div class="row">--%>
							<%--<div class="col-1-4">--%>
								<%--<div class="wrap-col">--%>
									<%--<a href="#"><img src="images/6.jpg" /></a>--%>
									<%--<a href="#"><img src="images/10.jpg" /></a>--%>
									<%--<a href="#"><img src="images/13.jpg" /></a>--%>
								<%--</div>--%>
							<%--</div>--%>
							<%--<div class="col-1-4">--%>
								<%--<div class="wrap-col">--%>
									<%--<a href="#"><img src="images/7.jpg" /></a>--%>
									<%--<a href="#"><img src="images/11.jpg" /></a>--%>
									<%--<a href="#"><img src="images/6.jpg" /></a>--%>
								<%--</div>--%>
							<%--</div>--%>
							<%--<div class="col-1-4">--%>
								<%--<div class="wrap-col">--%>
									<%--<a href="#"><img src="images/8.jpg" /></a>--%>
									<%--<a href="#"><img src="images/12.jpg" /></a>--%>
									<%--<a href="#"><img src="images/10.jpg" /></a>--%>
								<%--</div>--%>
							<%--</div>--%>
							<%--<div class="col-1-4">--%>
								<%--<div class="wrap-col">--%>
									<%--<a href="#"><img src="images/9.jpg" /></a>--%>
									<%--<a href="#"><img src="images/13.jpg" /></a>--%>
									<%--<a href="#"><img src="images/8.jpg" /></a>--%>
								<%--</div>--%>
							<%--</div>--%>
						<%--</div>--%>
					<%--</div>--%>
				<%--</div>--%>
			<%--</div>--%>
		<%--</div>--%>
		<%--<div class="zerogrid copyright">--%>
			<%--<div class="wrapper">--%>
				<%--Copyright 2015 - More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>--%>
				<%--<ul class="quick-link f-right">--%>
					<%--<li><a href="#">Privacy Policy</a></li>--%>
					<%--<li><a href="#">Terms of Use</a></li>--%>
				<%--</ul>--%>
			<%--</div>--%>
		<%--</div>--%>
	<%--</footer>--%>

	<!-- Slider -->
	<script src="js/jquery-2.1.1.js"></script>
	<script src="js/demo.js"></script>
	<!-- Search -->
	<script src="js/modernizr.custom.js"></script>
	<script src="js/classie.js"></script>
	<script src="js/uisearch.js"></script>
	<script>
		new UISearch( document.getElementById( 'sb-search' ) );
	</script>
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

    });
    </script>
</div>
</body></jsp>