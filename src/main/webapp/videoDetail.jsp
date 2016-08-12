<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 16/7/16
  Time: 下午3:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" style="background-color:white">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Jplay</title>
    <link href="admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="admin/css/bootstrap-table.min.css" rel="stylesheet">
    <script type="text/javascript" src="admin/js/jquery-2.2.4.min.js"></script>
    <script src="admin/js/bootstrap.min.js"></script>
    <script src="admin/js/bootstrap-table.min.js" ></script>
    <!-- Custom CSS -->
    <link href="admin/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.html">Jplay视频社区</a>
        </div>
        <!-- Top Menu Items -->
        <ul class="nav navbar-right top-nav">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> 管理员<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#"><i class="fa fa-fw fa-user"></i> 个人信息</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-envelope"></i> 邮件</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-gear"></i> 设置</a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-power-off"></i> 登出</a>
                    </li>
                </ul>
            </li>
        </ul>
        <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
        <div class="collapse navbar-collapse navbar-ex1-collapse" style="background-color: #ecf6ff;border-color:#ecf6ff">
            <ul class="nav navbar-nav side-nav">
                <li class="active">
                    <a href="admin.html" style="background-color: #ecf6ff"><i class="fa fa-fw fa-dashboard"></i> 社区概览</a>
                </li>
                <li>
                    <a href="detail.html"><i class="fa fa-fw fa-bar-chart-o"></i> 用户明细</a>
                </li>
                <li>
                    <a href="videoDetail.jsp"><i class="fa fa-fw fa-table"></i> 社区视频</a>
                </li>

                <!--<li>-->
                <!--<a href="bootstrap-grid.html"><i class="fa fa-fw fa-wrench"></i> Bootstrap Grid</a>-->
                <!--</li>-->
                <li>
                    <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> 社区管理 <i class="fa fa-fw fa-caret-down"></i></a>
                    <ul id="demo" class="collapse">
                        <li>
                            <a href="reportDetail.jsp">用户举报</a>
                        </li>
                        <li>
                            <a href="reportDetail.jsp">不良信息</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="about.html"><i class="fa fa-fw fa-edit"></i> 关于社区</a>
                </li>
                <li>
                    <a href="about.html"><i class="fa fa-fw fa-desktop"></i> 联系我们</a>
                </li>
                <!--<li>-->
                <!--<a href="blank-page.html"><i class="fa fa-fw fa-file"></i> Blank Page</a>-->
                <!--</li>-->
                <!--<li>-->
                <!--<a href="index-rtl.html"><i class="fa fa-fw fa-dashboard"></i> RTL Dashboard</a>-->
                <!--</li>-->
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </nav>

    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Jplay<small>用户视频</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>  <a href="index.html">Jplay</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-table"></i> 视频信息
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12">
                    <h2>所有视频</h2>
                    <div class="table-responsive">
                        <table 	id="dg_buslist"
                                  data-show-columns="true">
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
         aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close"
                            data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        修改信息
                    </h4>
                </div>

                <div class="modal-body">
                    <img align="center" src="images/3.jpg" style="width: 100%">
                    <form method="post" class="form" role="form" >
                        <div class="form-group  required"><label class="control-label" for="ID">ID</label>
                            <input class="form-control" id="ID" name="ID" disabled="disabled">
                        </div>
                        <div class="form-group  required"><label class="control-label" for="title">title</label>
                            <input class="form-control" id="title" name="title" required type="text" value="">
                        </div>
                        <div class="form-group  required"><label class="control-label" for="topic">topic</label>
                            <input class="form-control" id="topic" name="topic" required type="text" value="">
                        </div>
                        <div class="form-group  required"><label class="control-label" for="content">content</label>
                            <input class="form-control" id="content" name="content" required type="text" value="">
                        </div>
                        <div class="form-group  required"><label class="control-label">isPass</label>
                            <label class="checkbox-inline">
                                <input type="radio" name="optionsRadiosinline" id="optionsRadios3"
                                       value="1" checked="checked"> YES
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="optionsRadiosinline" id="optionsRadios4"
                                       value="0"> NO
                            </label>
                        </div>
                    </form>
                    <div id="message"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal" onclick="cancel()">关闭
                    </button>
                    <button type="button" class="btn btn-primary" onclick="edit()">
                        提交更改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div>
</body>
<script type="text/javascript">
    function removeAllSpace(str) {
        return str.replace(/\s+/g, "");
    }

    function initData(){
        var data = "";
        $.ajax({
            url: '/Bilibili/getAllVideo.action',
            dataType: 'json',
            type: 'POST',
            data: data,
            success:function (data) {
                console.log(data);
                $('#dg_buslist').bootstrapTable({
//                    url:'/Bilibili/getAllUser.action',
                    data: data,
                    dataType:'json',
                    search:true,
                    pagination:true,
                    pageList:[5,10,20,50],
                    pageSize:10,
                    pageNumber:1,
                    columns:[
                        {
                            title: 'ID',
                            field: 'videoId',
                            align: 'center',
                            valign: 'middle',
                        },
                        {
                            title: 'title',
                            field: 'title',
                            align: 'center',
                            valign: 'middle',
                        },
                        {
                            title: 'topic',
                            field: 'topic',
                            align: 'center',
                            valign: 'middle'
                        },
                        {
                            title: 'content',
                            field: 'content',
                            align: 'center',
                            valign: 'middle'
                        },
                        {
                            title: 'uper',
                            field: 'uper',
                            align: 'center',
                            valign: 'middle'
                        },
                        {
                            title: 'create time',
                            field: 'createTime',
                            align: 'center',
                            valign: 'middle'
                        },
                        {
                            title: 'last update',
                            field: 'lastUpdate',
                            align: 'center',
                            valign: 'middle'
                        },
                        {
                            title: 'is_pass',
                            field: 'isPass',
                            align: 'center',
                            valign: 'middle'
                        },
                        {
                            title: 'click count',
                            field: 'clickCount',
                            align: 'center',
                            valign: 'middle'
                        },
                        {
                            title: 'thumb count',
                            field: 'thumbCount',
                            align: 'center',
                            valign: 'middle'
                        },
                        {
                            title: 'link',
                            field: 'link',
                            align: 'center',
                            valign: 'middle'
                        },
                        {
                            title: '操作',
                            field: 'id',
                            align: 'center',
                            formatter:function(value,row,index){
                                //  alert(row.birthday);
                                var json = row.videoId + "/" + removeAllSpace(row.title) + "/" + removeAllSpace(row.topic) + "/" + removeAllSpace(row.content) +
                                        "/" + row.isPass + "/";
                                var e = '<a href="#" mce_href="#" onclick="modal(\''+ json + '\')">编辑</a> ';
                                var d = '<a href="javascript:;" mce_href="#" onclick="removeVideo(\''+ row.videoId + '\')">删除</a> ';
                                return e+d;
                            }
                        }]
                });
            },
        });


    }

    function rowStyle(row, index) {
        var classes = ['active', 'active', 'active', 'active', 'active'];

        if (index % 2 === 0 && index / 2 < classes.length) {
            return {
                classes: classes[index / 2]
            };
        }
        return {};
    }
    function runningFormatter(value, row, index) {
        return index;
    }
    initData();
</script>

<script type="text/javascript">



    var Id;
    function modal(ID){
        console.log(ID);
        var info = "";
        var flag = 0;
        $('#myModal').modal('show');
        //  alert(ID.length);
        for(var i = 0;i< ID.length; i++){
            if(ID[i] != "/"){
                info+=ID[i];
            }else{
                switch (flag){
                    case 0:
                        document.getElementById("ID").value=info;
                        //alert(info);
                        info = "";
                        flag ++;
                        break;
                    case 1:
                        document.getElementById("title").value=info;
                        info = "";
                        flag ++;
                        break;
                    case 2:
                        document.getElementById("topic").value=info;
                        info = "";
                        flag ++;
                        break;
                    case 3:
                        document.getElementById("content").value=info;
                        info = "";
                        flag ++;
                        break;
                    case 4:
                        if(info == "1") {
                            document.getElementById("optionsRadios3").checked = true;
                            document.getElementById("optionsRadios4").checked = false;
                        }else{
                            document.getElementById("optionsRadios4").checked = true;
                            document.getElementById("optionsRadios3").checked = false;
                        }
                        info = "";
                        flag ++;
                        break;
                    default:
                        break;
                }
            }
        }
    }


    function edit(){
        var videoId = document.getElementById("ID");
        var title = document.getElementById("title");
        var topic = document.getElementById("topic");
        var content = document.getElementById("content");
        var isPass = document.getElementById("optionsRadios3").checked ? 1 : 0;
        $.ajax({
            data:{"videoId":videoId.value,"title":title.value,"topic":topic.value,"content":content.value,
                "isPass":isPass},
            dataType:'JSON',
            type:'POST',
            url:"/Bilibili/updateVideo.action",
            timeout:3000,
            cache:false,
            success:function(){
                document.getElementById("message").innerHTML="<center><b>修改成功</b></center>";
                initData();
            },
            error:function(){
                document.getElementById("message").innerHTML="<center><b>修改失败</b></center>";
            }
        })
    }

    function removeVideo(ID) {
        alert(ID);
        $.ajax({
            data:"videoId="+ID,
            dataType:'JSON',
            type:'POST',
            url:'/Bilibili/deleteVideo.action',
            timeout:3000,
            cache:false,
            success:function(){
                alert("删除成功");
                initData();
            },
            error:function(){
                window.location.href = "error.jsp";
            }
        })
    }
    function cancel(){
        document.getElementById("message").innerHTML="";
    }
</script>
</html>

