<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/02
  Time: 9:05 PM
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
        .title {
            background-color: #ff6320;
            font-weight: bold;
            margin-left: 30px;
            font-size: 3em;
            width: 350px;
        }
    </style>
</head>

<body>
<br><br>
<button type="button" onclick="location.href='home.jsp'">홈으로</button>
<table>
    <tr>
        <button type="button" class="topbtn" id="mypage" style="width: 100px; float: right; margin-right: 30px" onclick="location.href = 'mypage.jsp'">MYPAGE</button>
        <button type="button" class="topbtn" id="faqs" style="width: 100px; float: right; margin-right: 30px" onclick="location.href='faqs.jsp'">FAQS</button>
        <button type="button" class="topbtn" id="location" style="width: 100px; float: right; margin-right: 30px" onclick="location.href='location.jsp'">LOCATION</button>
        <button type="button" class="topbtn" id="ticketing" style="width: 100px; float: right; margin-right: 30px" onclick="location.href= 'ticketing.jsp'">TICKETING</button>
        <button type="button" class="topbtn" id="login" style="width: 100px; float: right; margin-right: 30px; background-color: #ff6320">LOGIN</button>
    </tr>
</table>
<hr style="font-weight: bold; margin-top: 80px">
<hr style="font-weight: bold; margin-top: 20px">
<text class="title">&nbsp;회원가입&nbsp;</text><br>
<div align="center">
    <div align="center" style="border: 2px solid #ff6320; width: 30%">
        <br>
        <h5 align="left" style="padding-left: 20px">> 회원가입하기 <</h5><br>
        <form action="signupAction.jsp" method="post">
            <p>
                <label>ID : &nbsp;<input type="text" id="userID" name="userID"></label>
            </p>
            <p>
                <label>PW :  &nbsp;<input type="text" id="userPW" name="userPW"></label>
            </p>
            <p>
                <label>NAME :  &nbsp;<input type="text" id="name" name="name"></label>
            </p>
            <p>
                <label>PH :  &nbsp;<input type="text" id="ph" name="ph"></label>
            </p>
            <p>
                <label>EMAIL :  &nbsp;<input type="text" id="email" name="email"></label>
            </p>
            <br>
            <button type="submit" id="submitbtn" onclick="">sign in</button>
        </form>
    </div>
</div>
</body>

</html>
