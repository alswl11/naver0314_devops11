<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/13
  Time: 3:40 PM
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
<h5 class="alert alert-success">비트캠프 사원 목록</h5>
<%--table 이용해서 사원목록 출력하기--%>
<%--번호|사진|사원명|부서명|나이|입사일--%>
<h6>사원목록 출력하기</h6>
<fmt:requestEncoding value="utf-8"/>

<form action="./sawon" method="post">
    <b>부서명 입력</b>
    <input type="text" name="search" style="width: 120px" value="${param.search}">
    <button type="submit">검색</button>
</form>
<hr>
<h2>[ ${param.search} ]  부서 직원 검색 결과</h2>
<table class="table table-striped" style="width: 500px">
    <tr>
        <td width="150">번호</td>
        <td width="150">사진</td>
        <td width="150">사원명</td>
        <td width="200">부서명</td>
        <td width="100">나이</td>
        <td width="200">입사일</td>
    </tr>

    <c:forEach var="dto" items="${list}" varStatus="n">
        <c:if test="${dto.buseo==param.search or param.search ==''}">
            <tr>
                <td>${n.count}</td>
                <td>
                    <c:if test="${dto.photo=='no'}">
                        <img src="../image/noimage1.png" style="width: 40px;height: 40px;border: 1px solid gray;">
                    </c:if>
                    <c:if test="${dto.photo!='no'}">
                        <img src="${dto.photo}" style="width: 40px; width: 40px; border: 1px solid black">
                    </c:if>
                </td>
                <td>${dto.name}</td>
                <td>${dto.buseo}</td>
                <td>${dto.age}</td>
                <td>${dto.birthday}</td>
            </tr>
        </c:if>
    </c:forEach>
</table>
</body>
</html>
