<%@ page import="data.dao.SawonDao" %>
<%@ page import="data.dto.SawonDto" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/04/30
  Time: 11:34 AM
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

        div.list {
            float: left;
            margin: 10px;
            width: 150px;
            height: 200px;
            border: 1px solid gray;
            box-shadow: 5px 5px 5px gray;
            border-radius: 20px;
            padding: 10px;
            text-align: center;
        }

        div.list img {
            border-radius: 20px;
            width: 100px;
            height: 110px;
            margin-bottom: 10px;
        }
    </style>
</head>
<%
    // dao 선언
    SawonDao dao = new SawonDao();
    // list 가져오기
    List<SawonDto> list = dao.getAllSawon();
%>
<body>
<div style="margin: 20px; width: 500px;">
    <div lang="input-group">
        <h5 class="alert alert-danger" style="width: 400px">총 <%=list.size()%>명의 사원이 있습니다</h5>
        <button type="button" class="btn btn-sm btn-info" onclick="location.href = 'sawonform.jsp'"
                style="margin-left: 10px; height: 50px">사원 추가
        </button>
    </div>

</div>
<%
    for (SawonDto dto : list) { %>

<div class="list">
    <img src='<%=dto.getPhoto().equals("no")?"../image/noimage1.png":dto.getPhoto()%>'>
    <br>
    <%=dto.getName()%>사원
    <br>
    <button type="button" class="btn btn-sm btn-outline-danger" onclick="location.href='sawondetail.jsp?num=<%=dto.getNum()%>'">
        상세보기</button>
</div>
<%
    }
%>
</body>
</html>
