
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<h5 class="alert alert-danger">JSTL 공부 #1</h5>
<h6>일단 서블릿에 저장한 request 변수 읽어오기</h6>
<h6>메세지 : ${message}, ${requestScope.message}</h6>
<h6>날짜 : ${today}</h6>
<br>
<h5>숫자 1 : ${num1}</h5>
<h5>숫자 2 : ${num2}</h5>
<hr>
<h3>JSTL 연산자</h3>
<h5>더하기: ${num1+num2}</h5>
<h5>빼기: ${num1-num2}</h5>
<h5>곱하기: ${num1*num2}</h5>
<h5>나누기: ${num1/num2}</h5>
<h5>나누기: ${num1 div num2}</h5>
<h5>나머지: ${num1%num2}</h5>
<h5>나머지: ${num1 mod num2}</h5>
<hr>
<h5>간단한 if문 (JSTL에는 else문은 없다)</h5>
<c:if test="${num1>num2}">
    <h4>숫자 1이 숫자 2보다 큽니다</h4>
</c:if>
<c:if test="${num1<num2}">
    <h4>숫자 1이 숫자 2보다 작습니다</h4>
</c:if>
<hr>
<h5>jsp에서 직접 JSTL로 변수 선언을 하고자 할 경우</h5>
<c:set var = "name" value = "이영자"/>
<c:set var = "age" value = "19"/>
<h5>이름 : ${name}</h5>
<h5>나이 : ${age}</h5>
</body>

</html>
