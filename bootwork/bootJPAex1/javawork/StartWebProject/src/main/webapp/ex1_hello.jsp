<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/04/28
  Time: 2:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
<h3>html 주석과 jsp 주석 비교하기</h3>
<%--<!--  html 주석입니다, <%=new Date()%>-->--%>
<%-- jsp 주석입니다. <%=new Date()%> --%>

<h5>선언문의 변수는 위치상관없이 출력가능하다</h5>
<h5>이름 : <%=name %>
</h5>
<h5>나이 : <%=age %>세</h5>
<%!
    //선언문이라고 부른다
    //여기서 선언하는 변수는 서블릿으로 변환시 위치 상관없이 멤버변수로 선언된다
    String name = "송혜교";
    int age = 30;
%>

<h5>이름2 : <%=name %>
</h5>
<h5>나이2 : <%=age %>세</h5>

<%
    //스크립트릿이라고 부른다(scriptlet)
    //자바영역:서블릿변환시 특정 메소드 내의 지역변수로 선언된다
    String addr = "서울시 강남구";
    //내장객체중 out 을 이용해서 출력해도 된다
    out.print("<h5 class='alert alert-danger'>나의 주소는 " + addr + "입니다</h5>");
%>
<h5>주소 : <%=addr %>
</h5>
</body>
</html>
