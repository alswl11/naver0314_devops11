<%@ page import="data.dto.ExhiDto" %>
<%@ page import="data.dao.ExhiDao" %>
<%@ page import="data.dao.UserDao" %>
<%@ page import="data.dto.UserDto" %>
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
    </style>
</head>
<body>
<br><br>
<table>
    <tr>
        <button type="text" class="topbtn" id="mypage"
                style="width: 100px; float: right; margin-right: 30px; background-color: #ff6320">MYPAGE
        </button>
        <button type="button" class="topbtn" id="location" style="width: 100px; float: right; margin-right: 30px"
                onclick="location.href='location.jsp'">LOCATION
        </button>
        <button type="button" class="topbtn" id="ticketing" style="width: 100px; float: right; margin-right: 30px"
                onclick="location.href= 'ticketing.jsp'">TICKETING
        </button>
        <button type="button" class="topbtn" id="home" style="width: 100px; float: right; margin-right: 30px"
                onclick="location.href= 'home.jsp'">HOME
        </button>
    </tr>
</table>
<hr style="font-weight: bold; margin-top: 80px">
<hr style="font-weight: bold; margin-top: 20px">
<h3></h3>
<h5>수량을 선택하세요</h5>

</body>
</html>
