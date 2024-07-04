<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/13
  Time: 3:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<h5 class="alert alert-danger">JSTL 공부 #5 - if, choose문</h5>
<fmt:requestEncoding value = "utf-8"/>
<form action="./study5" method="post">
    <input type="text" name="nara">
    <br>
    <button type="submit">전송</button>
</form>
<h6>입력값은 ${param.nara}</h6>
<c:choose>
    <c:when test="${param.nara == '하와이'}">
        <img src="./snoopyAvata/s1.JPG">
        <b style="color: #ff6320; background-color: #ffddff">하와이는 바다가 아름다운 나라입니다</b>
    </c:when>
    <c:when test="${param.nara == '미국'}">
        <img src="./snoopyAvata/s5.JPG">
        <b style="color : midnightblue; background-color: slategray">미국은 자유의 여신상이 아름다운 나라입니다</b>
    </c:when>
    <c:when test="${param.nara == '프랑스'}">
        <img src="./snoopyAvata/s3.JPG">
        <b style="color : green; background-color: white">프랑스는 에펠탑이 아름다운 나라입니다</b>
    </c:when>
    <c:when test="${param.nara == '스위스'}">
        <img src="./snoopyAvata/s10.JPG">
        <b style="color : deeppink; background-color: cadetblue">미국은 자유의 여신상이 아름다운 나라입니다</b>
    </c:when>
    <c:otherwise>
        <img src="./snoopyAvata/s8.JPG">
        <b style="color : blueviolet; background-color: aquamarine">${param.nara}는 어디가 아름다운 나라인가요?</b>
    </c:otherwise>
</c:choose>
</body>
</html>
