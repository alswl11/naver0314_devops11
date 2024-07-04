<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/07
  Time: 11:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+Han+Sans&family=Bungee+Spice&family=Diphylleia&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Nanum+Pen+Script&family=Song+Myung&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>
        body * {
            font-family: "Song Myung";
        }
        .
    </style>
</head>
<%
    String myid = (String)session.getAttribute("myid");
    String save = (String)session.getAttribute("saveok");
    // 체크 상태에 따라 아이디 출력
    String writeid = save== null || save.equals("no")?"":myid;
%>
<body>
<form action="./loginaction.jsp" method="post">
    <table class="table table-bordered" style="width: 250px">
        <caption align="top">
            <b>회원 로그인</b>
            <label>
                <input type="checkbox" name="save" style="margin-left: 50px"<%=writeid.length()==0?"":"checked"%>> 아이디 저장
            </label>
        </caption>
        <tr>
            <th width="100" class="table-success">아이디</th>
            <td>
                <input type="text" name="myid" class="form-control" value="<%=writeid%>">
            </td>
        </tr>
        <tr>
            <th width="100" class="table-success">비밀번호</th>
            <td>
                <input type="password" name="mypass" class="form-control">
            </td>
        </tr>
        <tr>
           <td colspan="2" align="center">
               <button type="submit" class="btn btn-outline-danger">회원 로그인</button>
           </td>
        </tr>
    </table>
</form>
</body>
</html>
