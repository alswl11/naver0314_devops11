<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/02
  Time: 4:06 PM
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
        .loc {
            text-align: center;
            padding-top: 100px;
        }
        .title {
            background-color: #ff6320;
            font-weight: bold;
            margin-left: 30px;
            font-size: 3em;
            width: 350px;
        }
        .topbtn{
            width: 100px;
            float: right;
            margin-right: 30px
        }
    </style>
</head>
<body>
<br><br>
<table>
    <tr>
        <button type="button" class="topbtn" id="mypage" onclick="location.href = 'mypage.jsp'">MYPAGE</button>
        <button type="button" class="topbtn" id="location" style="background-color: #ff6320" onclick="location.href='location.jsp'">LOCATION</button>
        <button type="button" class="topbtn" id="ticketing" onclick="location.href= 'ticketing.jsp'">TICKETING</button>
        <button type="button" class="topbtn" id="home" style="width: 100px; float: right; margin-right: 30px" onclick="location.href= 'home.jsp'">HOME</button>
    </tr>
</table>
<hr style="font-weight: bold; margin-top: 80px">
<hr style="font-weight: bold; margin-top: 20px">
<text class="title">&nbsp;오시는 길&nbsp;</text><br>

<div class="loc">
<%--    서울 종로구 삼청로 30 --%>
    <img src="../image/exhi/1.jpeg" style="width: 80%; height: auto">
    <br><br><br>
    <h1>국립현대미술관 서울</h1><br>
    <h3>서울 종로구 삼청로 30</h3>
    <br><br>
    <h5 style="color: dimgray"> 3호선 안국역 1번 출구에서 759m</h5>
    <h5 style="color: dimgray"> 3호선 경복국역 4번 출구에서 911m</h5>
    <h5 style="color: dimgray"> 5호선 광화문역 2번 출구에서 892m </h5>
    <div style="height: 100px"></div>
</div>
</body>
</html>
