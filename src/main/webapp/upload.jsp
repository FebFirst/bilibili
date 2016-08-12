<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: slt
  Date: 2016/6/29
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> [endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> [endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> [endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <![endif]-->
    <meta name="description" content="File Upload widget with multiple file selection, drag&amp;drop support, progress bars, validation and preview images, audio and video for jQuery. Supports cross-domain, chunked and resumable file uploads and client-side image resizing. Works with any server-side platform (PHP, Python, Ruby on Rails, Java, Node.js, Go etc.) that supports standard HTML form file uploads.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Web App Capable-->
    <meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">

    <!-- Basic Page Needs
  ================================================== -->
    <meta charset="utf-8">
    <title>Jplay 投稿视频</title>
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
    <script type="text/javascript">
        var url;

        function uploadVideo(){
            $('#fmUser').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                    var suc=1;

                    if (result==suc){
                        $('#dlgUser').dialog('close');		// close the dialog
                        $('#userTable').datagrid('reload');	// reload the user data

                    } else {
                        $.messager.show({
                            title: 'Error',
                            msg:'Invalid input!'
                        });
                    }
                }
            });
        }

    </script>


    <!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <script src="js/css3-mediaqueries.js"></script>
    <script src="js/jquery-2.1.1.js"></script>
    <script src="bootstrap-3.3.5-dist/js/bootstrap.min.js">

    <![endif]-->

    <!-- Opacity -->
    <style>
        body {background: url("images/upload.jpg") no-repeat fixed center bottom;}
        .upload{
            color:#000;
            background:rgba(255,255,255,0.6);
            background: #ffffff;/*CSS Hack,只能对ie9以下浏览器ie6,ie7,ie8有效，否侧ie10,FF,Cherome会失去透明效果*/
            filter:Alpha(opacity=60);/*只对ie7,ie8有效*/
        }
        .upload p,
        .upload div,
        .upload img {
            position:relative;
            /*或者是absolute，都可以使文字不透明，这样做还是为了
            兼容ie9,ie8,ie7下背景透明而而背景上的文字不透明的效果*/
        }
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
                        <%--<li><a href="upload.jsp" title="Upload Video" ><i class="fa fa-upload"></i>上传</a></li>--%>
                        <%  String loginUsername = (String)session.getAttribute("username");
                            if(loginUsername == null)
                                out.print("<script> alert('Sorry,you shall LOGIN first!!'); window.location='login.jsp';</script>");
                            else{ %>
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
                <div class="upload">
                    <h2><strong>视频上传</strong></h2>
                    <p>&nbsp;请在这里上传您的视频</p>
                    <!-- The file upload form used as target for the file upload widget -->
                    <!-- The file upload form used as target for the file upload widget -->
                    <form id="fileupload" action="uploadTestAction.action" method="POST" enctype="multipart/form-data">
                        <!-- Redirect browsers with JavaScript disabled to the origin page -->
                        <noscript><input type="hidden" name="redirect" value="https://blueimp.github.io/jQuery-File-Upload/"></noscript>
                        <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
                        <div class="row fileupload-buttonbar">
                            <div class="col-lg-7">
                                <!-- The fileinput-button span is used to style the file input field as button -->
                                <span class="btn btn-success fileinput-button">
                                    <i class="glyphicon glyphicon-plus"></i>

                                    <span>Add files...</span>
                                    <input type="file" id="file" name="upload" multiple accept=".avi,.mov,.mpeg,.mpg,.flv,.mp4,.mkv,.wmv,.rmvb">
                                </span>
                                <button type="submit"  class="btn btn-primary start" >
                                    <i class="glyphicon glyphicon-upload"></i>
                                    <span>Start upload</span>
                                </button>
                                <button type="reset" class="btn btn-warning cancel">
                                    <i class="glyphicon glyphicon-ban-circle"></i>
                                    <span>Cancel upload</span>
                                </button>
                                <button type="button" class="btn btn-danger delete">
                                    <i class="glyphicon glyphicon-trash"></i>
                                    <span>Delete</span>
                                </button>
                                <input type="checkbox" class="toggle">
                                <!-- The global file processing state -->
                                <span class="fileupload-process"></span>
                            </div>
                            <!-- The global progress state -->
                            <div class="col-lg-5 fileupload-progress fade">
                                <!-- The global progress bar -->
                                <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                    <div class="progress-bar progress-bar-success" style="width:0%;"></div>
                                </div>
                                <!-- The extended global progress state -->
                                <div class="progress-extended">&nbsp;</div>
                            </div>
                        </div>
                        <s:if test = "uploadFileName != null">
                            <label value="${uploadFileName}"></label>
                        </s:if>

                        <!-- The table listing the files available for upload/download -->
                        <table role="presentation" class="table table-striped"><tbody class="files"></tbody></table>
                </form>
                    <form action="uploadVideoInfo.action" method="post">
                        <p>标题：<input required name="title"></p>
                        <p>内容：<textarea name="content"></textarea></p>
                        <input type="submit" value="提交">
                    </form>
                </div>
            </div>
        </div>
    </section>
<!--
                    <%--    <!-- 模态框（Modal） -->
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" style="width:100%"
                             aria-labelledby="myModalLabel" aria-hidden="true" >
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close"
                                                data-dismiss="modal" aria-hidden="true">
                                            &times;
                                        </button>
                                        <h4 class="modal-title" id="myModalLabel">
                                            视频上传
                                        </h4>
                                    </div>
                                    <div class="modal-body" style="padding-left: 2%" >
                                        <p>视频路径：  <!-- The file upload form used as target for the file upload widget -->
                                        <div class="container">
                                        <form id="fileupload" action="uploadTestAction.action" method="POST" enctype="multipart/form-data">
                                            <!-- Redirect browsers with JavaScript disabled to the origin page -->
                                            <noscript><input type="hidden" name="redirect" value="https://blueimp.github.io/jQuery-File-Upload/"></noscript>
                                            <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
                                            <div class="row fileupload-buttonbar">
                                                <div class="col-lg-7">
                                                    <!-- The fileinput-button span is used to style the file input field as button -->
                                                    <span class="btn btn-success fileinput-button">
                                                        <i class="glyphicon glyphicon-plus"></i>

                                                        <span>Add files...</span>
                                                        <input type="file" name="upload" multiple accept=".avi,.mov,.mpeg,.mpg,.flv,.mp4,.mkv,.wmv,.rmvb">
                                                    </span>
                                                    <button type="submit" class="btn btn-primary start">
                                                        <i class="glyphicon glyphicon-upload"></i>
                                                        <span>Start upload</span>
                                                    </button>
                                                    <button type="reset" class="btn btn-warning cancel">
                                                        <i class="glyphicon glyphicon-ban-circle"></i>
                                                        <span>Cancel upload</span>
                                                    </button>
                                                    <button type="button" class="btn btn-danger delete">
                                                        <i class="glyphicon glyphicon-trash"></i>
                                                        <span>Delete</span>
                                                    </button>
                                                    <input type="checkbox" class="toggle">
                                                    <!-- The global file processing state -->
                                                    <span class="fileupload-process"></span>
                                                </div>
                                                <!-- The global progress state -->
                                                <div class="col-lg-5 fileupload-progress fade">
                                                    <!-- The global progress bar -->
                                                    <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100">
                                                        <div class="progress-bar progress-bar-success" style="width:0%;"></div>
                                                    </div>
                                                    <!-- The extended global progress state -->
                                                    <div class="progress-extended">&nbsp;</div>
                                                </div>
                                            </div>
                                            <!-- The table listing the files available for upload/download -->
                                            <table role="presentation" class="table table-striped"><tbody class="files"></tbody></table>
                                        </form>
                                        <br>

                                        </div>

                                        </p>
                                        <form id="dlg-video"action="uploadVideoInfo">
                                            <p>视频标题：<input type="text"></p>
                                            <p>视频截图：<img src="images/111.jpg" width="80px"> </p>
                                            <p>视频类型：
                                                <select name="" style="width: 30%;height: 4%;font-size: 20px;text-align: center">
                                                    <option name="">番剧</option>
                                                    <option name="">动画</option>
                                                    <option name="">娱乐</option>
                                                    <option name="">音乐</option>
                                                </select>
                                            </p>
                                            <p>视频标签：<input type="text"></p>
                                            <p>视频简介：<textarea placeholder="添加视频的简介"></textarea></p>
                                        </form>
                                    </div>


                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default"
                                                data-dismiss="modal">关闭
                                        </button>
                                        <button type="submit" class="btn btn-primary" onclick="uploadVideo()">
                                            上传
                                        </button>
                                    </div>
                                </div><!-- /.modal-content -->
                            </div><!-- /.modal -->
                    </div>
                <!-- End of dialog -->
                </div>--%>
        </div>
    </section>


    <!-- The blueimp Gallery widget -->
    <div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even">
        <div class="slides"></div>
        <h3 class="title"></h3>
        <a class="prev">‹</a>
        <a class="next">›</a>
        <a class="close">×</a>
        <a class="play-pause"></a>
        <ol class="indicator"></ol>
    </div>

    <!-- Slider -->
    <script src="js/jquery.min.js"></script>
    <script src="bootstrap-3.3.5-dist/js/bootstrap.min.js"></script>

    <!-- The template to display files available for upload -->
    <script id="template-upload" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-upload fade">
        <td>
            <span class="preview"></span>
        </td>
        <td>
            <p class="name">{%=file.name%}</p>
            <strong class="error text-danger"></strong>
        </td>
        <td>
            <p class="size">Processing...</p>
            <div class="progress progress-striped active" role="progressbar" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0"><div class="progress-bar progress-bar-success" style="width:0%;"></div></div>
        </td>
        <td>
            {% if (!i && !o.options.autoUpload) { %}
                <button class="btn btn-primary start" disabled>
                    <i class="glyphicon glyphicon-upload"></i>
                    <span>Start</span>
                </button>
            {% } %}
            {% if (!i) { %}
                <button class="btn btn-warning cancel">
                    <i class="glyphicon glyphicon-ban-circle"></i>
                    <span>Cancel</span>
                </button>
            {% } %}
        </td>
    </tr>
{% } %}
</script>
    <!-- The template to display files available for download -->
    <script id="template-download" type="text/x-tmpl">
{% for (var i=0, file; file=o.files[i]; i++) { %}
    <tr class="template-download fade">
        <%--<td>--%>
            <%--<span class="preview">--%>
                <%--{% if (file.thumbnailUrl) { %}--%>
                    <%--<a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" data-gallery><img src="{%=file.thumbnailUrl%}"></a>--%>
                <%--{% } %}--%>
            <%--</span>--%>
        <%--</td>--%>
        <%--<td>--%>
            <%--<p class="name">--%>
                <%--{% if (file.url) { %}--%>
                    <%--<a href="{%=file.url%}" title="{%=file.name%}" download="{%=file.name%}" {%=file.thumbnailUrl?'data-gallery':''%}>{%=file.name%}</a>--%>
                <%--{% } else { %}--%>
                    <%--<span>{%=file.name%}</span>--%>
                <%--{% } %}--%>
            <%--</p>--%>
            <%--{% if (file.error) { %}--%>
                <%--<div><span class="label label-danger">Error</span> {%=file.error%}</div>--%>
            <%--{% } %}--%>
        <%--</td>--%>
        <%--<td>--%>
            <%--<span class="size">{%=o.formatFileSize(file.size)%}</span>--%>
        <%--</td>--%>
        <%--<td>--%>
            <%--{% if (file.deleteUrl) { %}--%>
                <%--<button class="btn btn-danger delete" data-type="{%=file.deleteType%}" data-url="{%=file.deleteUrl%}"{% if (file.deleteWithCredentials) { %} data-xhr-fields='{"withCredentials":true}'{% } %}>--%>
                    <%--<i class="glyphicon glyphicon-trash"></i>--%>
                    <%--<span>Delete</span>--%>
                <%--</button>--%>
                <%--<input type="checkbox" name="delete" value="1" class="toggle">--%>
            <%--{% } else { %}--%>
                <%--<button class="btn btn-warning cancel">--%>
                    <%--<i class="glyphicon glyphicon-ban-circle"></i>--%>
                    <%--<span>Cancel</span>--%>
                <%--</button>--%>
            <%--{% } %}--%>
        <%--</td>--%>
        <td>
            <span class="size">Upload {%=file.name%} succeed!</span>

        </td>
    </tr>
{% } %}
</script>

    <script src="js/jquery.min.js"></script>
    <!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
    <script src="js/vendor/jquery.ui.widget.js"></script>
    <!-- The Templates plugin is included to render the upload/download listings -->
    <script src="//blueimp.github.io/JavaScript-Templates/js/tmpl.min.js"></script>
    <!-- The Load Image plugin is included for the preview images and image resizing functionality -->
    <script src="//blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>
    <!-- The Canvas to Blob plugin is included for image resizing functionality -->
    <script src="//blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
    <!-- Bootstrap JS is not required, but included for the responsive demo navigation -->
    <script src="js/bootstrap.min.js"></script>
    <!-- blueimp Gallery script -->
    <script src="//blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
    <!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
    <script src="js/jquery.iframe-transport.js"></script>
    <!-- The basic File Upload plugin -->
    <script src="js/jquery.fileupload.js"></script>
    <!-- The File Upload processing plugin -->
    <script src="js/jquery.fileupload-process.js"></script>
    <!-- The File Upload image preview & resize plugin -->
    <script src="js/jquery.fileupload-image.js"></script>
    <!-- The File Upload audio preview plugin -->
    <script src="js/jquery.fileupload-audio.js"></script>
    <!-- The File Upload video preview plugin -->
    <script src="js/jquery.fileupload-video.js"></script>
    <!-- The File Upload validation plugin -->
    <script src="js/jquery.fileupload-validate.js"></script>
    <!-- The File Upload user interface plugin -->
    <script src="js/jquery.fileupload-ui.js"></script>
    <!-- The main application script -->
    <script src="js/main.js"></script>
    <!-- The XDomainRequest Transport is included for cross-domain file deletion for IE 8 and IE 9 -->
    <!--[if (gte IE 8)&(lt IE 10)]>
    <script src="js/cors/jquery.xdr-transport.js"></script>
    <![endif]-->
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
        ga('create', 'UA-41071247-1', 'blueimp.github.io');
        ga('send', 'pageview');
    </script>
    <script>window.cookieconsent_options={"message":"This website uses cookies to ensure you get the best experience on our website","dismiss":"Got it!","learnMore":"More info","link":null,"theme":"light-bottom"};</script>
    <script async src="//s3.amazonaws.com/cc.silktide.com/cookieconsent.latest.min.js"></script>

    <script src="js/demo.js"></script>
    <script src="js/classie.js"></script>

    <script>
        function vad()
        {
            alert("ss");
            var v=document.getElementById("upload");
            alert(v);
            ${videoName}.innerHTML(v);
        }


    </script>

    <!-- Carousel -->
    <script src="js/owl.carousel.js"></script>
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
            <%--$("#owl-demo-3").owlCarousel({--%>
                <%--items : 4,--%>
                <%--lazyLoad : true,--%>
                <%--navigation : true--%>
            <%--});--%>
        <%--});--%>

    <%--</script>--%>
</div>
</body>
</html>
