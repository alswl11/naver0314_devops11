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
        img.photo {
            width: 100px;
            height: 120px;
            border: 1px solid gray;
            margin: 10px;
            border-radius: 10px;
        }
    </style>
</head>
<%
    String loginok = (String)session.getAttribute("loginok"); // 해당 세션이 없을 경우 null
    String myid = (String)session.getAttribute("myid");
%>
<body>
    <%
    if (loginok == null) {%>
<script type="text/javascript">
    alert("먼저 로그인을 해주세요");
    location.href = "sessionmain.jsp";
</script>
    <%} else { %>
<h5>
    <b><%=myid%>
    </b>
    <button type="button" class="btn btn-sm btn-danger" onclick="location.href = 'logoutaction.jsp'" style="margin-left: 100px">LOGOUT</button>
</h5>
<h3><b>SHOP 상품들</b></h3>
<hr>
<script type="text/javascript">
    for(let i = 1; i<=34; i++) {
        let s = "../../shop/"+i+"."+(i==24?"gif":"jpg");
        document.write(`<img src="\${s}" class="photo">`);
    }
</script>
    <%
    }
%>
</html>
