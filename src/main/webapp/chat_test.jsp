<%--
  Created by IntelliJ IDEA.
  User: slt
  Date: 2016/7/4
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>����</title>
    <!-- start -->


    <style>
        /**���ñ�ǩĬ����ʽ*/
        * {
            margin: 0;
            padding: 0;
            list-style: none;
            font-family: '΢���ź�'
        }
        #container {
            width: 450px;
            height: 780px;
            background: #eee;
            margin: 80px auto 0;
            position: relative;
            box-shadow: 20px 20px 55px #777;
        }
        .header {
            background: #000;
            height: 40px;
            color: #fff;
            line-height: 34px;
            font-size: 20px;
            padding: 0 10px;
        }
        .footer {
            width: 430px;
            height: 50px;
            background: #666;
            position: absolute;
            bottom: 0;
            padding: 10px;
        }
        .footer input {
            width: 275px;
            height: 45px;
            outline: none;
            font-size: 20px;
            text-indent: 10px;
            position: absolute;
            border-radius: 6px;
            right: 80px;
        }
        .footer span {
            display: inline-block;
            width: 62px;
            height: 48px;
            background: #ccc;
            font-weight: 900;
            line-height: 45px;
            cursor: pointer;
            text-align: center;
            position: absolute;
            right: 10px;
            border-radius: 6px;
        }
        .footer span:hover {
            color: #fff;
            background: #999;
        }
        #user_face_icon {
            display: inline-block;
            background: red;
            width: 60px;
            height: 60px;
            border-radius: 30px;
            position: absolute;
            bottom: 6px;
            left: 14px;
            cursor: pointer;
            overflow: hidden;
        }
        img {
            width: 60px;
            height: 60px;
        }
        .content {
            font-size: 20px;
            width: 435px;
            height: 662px;
            overflow: auto;
            padding: 5px;
        }
        .content li {
            margin-top: 10px;
            padding-left: 10px;
            width: 412px;
            display: block;
            clear: both;
            overflow: hidden;
        }
        .content li img {
            float: left;
        }
        .content li span{
            background: #7cfc00;
            padding: 10px;
            border-radius: 10px;
            float: left;
            margin: 6px 10px 0 10px;
            max-width: 310px;
            border: 1px solid #ccc;
            box-shadow: 0 0 3px #ccc;
        }
        .content li img.imgleft {
            float: left;
        }
        .content li img.imgright {
            float: right;
        }
        .content li span.spanleft {
            float: left;
            background: #fff;
        }
        .content li span.spanright {
            float: right;
            background: #7cfc00;
        }
    </style>
    <script>
        window.onload = function(){
            var arrIcon = ['http://www.xttblog.com/icons/favicon.ico','http://www.xttblog.com/wp-content/uploads/2016/03/123.png'];
            var num = 0;     //����ͷ��ı�
            var iNow = -1;    //�����ۼӸı����Ҹ���
            var icon = document.getElementById('user_face_icon').getElementsByTagName('img');
            var btn = document.getElementById('btn');
            var text = document.getElementById('text');
            var content = document.getElementsByTagName('ul')[0];
            var img = content.getElementsByTagName('img');
            var span = content.getElementsByTagName('span');

            icon[0].onclick = function(){
                if(num==0){
                    this.src = arrIcon[1];
                    num = 1;
                }else if(num==1){
                    this.src = arrIcon[0];
                    num = 0;
                }
            }
            btn.onclick = function(){
                if(text.value ==''){
                    alert('���ܷ��Ϳ���Ϣ');
                }else {
                    content.innerHTML += '<li><img src="'+arrIcon[num]+'"><span>'+text.value+'</span></li>';
                    iNow++;
                    if(num==0){
                        img[iNow].className += 'imgright';
                        span[iNow].className += 'spanright';
                    }else {
                        img[iNow].className += 'imgleft';
                        span[iNow].className += 'spanleft';
                    }
                    text.value = '';
                    // ���ݹ���ʱ,�����������õ���׶�
                    content.scrollTop=content.scrollHeight;
                }
            }
        }
    </script>
</head>
<body>
<div id="container">
    <div class="header">
        <span style="float: left;">ҵ���:ģ��΢���������</span>
        <span style="float: right;">14:21</span>
    </div>
    <ul class="content">
        <!-- ��ӭ����qqȺ��454796847��135430763 -->
    </ul>
    <div class="footer">
        <div id="user_face_icon">
            <img src="http://www.xttblog.com/icons/favicon.ico" alt="">
        </div>
        <input id="text" type="text" placeholder="˵��ʲô��...">
        <span id="btn">����</span>
    </div>
</div>
</body>
</html>
--%>

<%@ page contentType="text/html" pageEncoding="GB2312" language="java"%>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>hello</title>
</head>
<body>
<table border="1" spacing="2">
    <%!
        public static final String DRIVER = "com.mysql.jdbc.Driver";
        public static final String USER = "root";
        public static final String PASS = "12345";
        public static final String URL = "jdbc:mysql://localhost:3306/MLDN";
        public static final int PAGESIZE = 5;
        int pageCount;
        int curPage = 1;
    %>
    <%
        //һҳ��5��
        String user = null;
        String pass = null;
        try{
            Class.forName(DRIVER);
            Connection con = DriverManager.getConnection(URL,USER,PASS);
            String sql = "SELECT empno,ename,job,hiredate,sal,comm FROM emp";
            PreparedStatement stat = con.prepareStatement(sql,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = stat.executeQuery();
            rs.last();
            int size = rs.getRow();
            pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);
            String tmp = request.getParameter("curPage");
            if(tmp==null){
                tmp="1";
            }
            curPage = Integer.parseInt(tmp);
            if(curPage>=pageCount) curPage = pageCount;
            boolean flag = rs.absolute((curPage-1)*PAGESIZE+1);
            out.println(curPage);
            int count = 0;

            do{
                if(count>=PAGESIZE)break;
                int empno = rs.getInt(1);
                String ename = rs.getString(2);
                String job = rs.getString(3);
                Date hiredate = rs.getDate(4);
                float sal = rs.getFloat(5);
                int comm = rs.getInt(6);
                count++;
    %>
    <tr>
        <td><%=empno%></td>
        <td><%=ename%></td>
        <td><%=job%></td>
        <td><%=hiredate%></td>
        <td><%=sal%></td>
        <td><%=comm%></td>
    </tr>
    <%
            }while(rs.next());
            con.close();
        }
        catch(Exception e){

        }
    %>
</table>
<a href = "multipage.jsp?curPage=1" >��ҳ</a>
<a href = "multipage.jsp?curPage=<%=curPage-1%>" >��һҳ</a>
<a href = "multipage.jsp?curPage=<%=curPage+1%>" >��һҳ</a>
<a href = "multipage.jsp?curPage=<%=pageCount%>" >βҳ</a>
��<%=curPage%>ҳ/��<%=pageCount%>ҳ

</body>
</html>
