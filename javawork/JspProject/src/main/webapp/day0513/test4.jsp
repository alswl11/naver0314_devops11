<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/13
  Time: 2:28 PM
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
<h5 class="alert alert-danger">JSTL 공부 #4</h5>
<h6>1~10까지 출력</h6>
<c:forEach var="a" begin="1" end="10">
    <b>${a}&nbsp;</b>
</c:forEach>
<hr>
<h6>1~20까지 홀수만 출력</h6>
<c:forEach var="a" begin="1" end="20" step="2">
    <b>${a}&nbsp;</b>
</c:forEach>
<hr>
<h6>list1 출력(index 0~3)</h6>
<table class="table table-striped" style="width: 300px;">
    <tr>
        <th width="50">count</th>
        <th width="50">index</th>
        <th width="150">color-value</th>
        <th width="100">color</th>
    </tr>
    <c:forEach var="s" begin="0" end="3" items="${list1}" varStatus="n">
        <tr>
            <td>${n.count}</td>
            <td>${n.index}</td>
            <td>${s}</td>
            <td style="background-color: ${s}"></td>
        </tr>
    </c:forEach>
</table>
<hr>
<h6>list1 출력(index 2~6)</h6>
<table class="table table-striped" style="width: 300px">
    <tr>
        <th width="50">count</th>
        <th width="50">index</th>
        <th width="150">color-value</th>
        <th width="100">color</th>
    </tr>
    <c:forEach var="s" begin="2" end="6" items="${list1}" varStatus="n">
        <tr>
            <td>${n.count}</td>
            <td>${n.index}</td>
            <td>${s}</td>
            <td style="background-color: ${s}"></td>
        </tr>
    </c:forEach>
</table>
<hr>
<h6>forTokens : , 로 문자열 분리해서 출력하기</h6>
<h6>${flowers}</h6>
<c:forTokens var="a" items="${flowers}" delims="," varStatus="n">
    <h6>${n.count} : ${a}</h6>
</c:forTokens>
</body>
</html>
