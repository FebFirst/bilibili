<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 16/6/28
  Time: 下午1:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Jplay</title>

    <link href="bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="dist/css/flat-ui.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/magnific-popup.css" rel="stylesheet">
    <script type="text/javascript" src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="jQuery/jquery-2.2.4.min.js"></script>
</head>
<body>
<div class="col-xs-12">
    <nav class="navbar" role="navigation">
        <%--<div class="navbar-header">--%>
        <%--<a href="index.jsp"><img src="img/logo.jpg" width="100px" height="100px"></a>--%>
        <%--</div>--%>
        <div class="navbar-collapse collapse" id="navbar-collapse-01">
            <ul class="nav navbar-nav navbar-left">
                <li><a href="index.jsp"><img src="img/logo.jpg" width="60px" height="60px"></a></li>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="index.jsp">Subscription</a></li>
                <li><a href="index.jsp">Column</a></li>
                <li><a href="index.jsp">Profile</a></li>
                <li><a href="#">User</a></li>
            </ul>
            <form class="navbar-form navbar-right" action="#" role="search">
                <div class="input-group">
                    <input class="form-control" id="search" name="search" required type="text" placeholder="Search" value="">
                       <span class="input-group-btn">
                           <button class="btn" type="submit">
                               <span class="fui-search"></span>
                           </button>
                       </span>
                </div>
            </form>
        </div>

    </nav>
</div>
<div class="container">
    <div class="row">
        <div class="col-md-9">
            <div class="video">

            </div>
        </div>
    </div>
</div>
</body>
</html>
