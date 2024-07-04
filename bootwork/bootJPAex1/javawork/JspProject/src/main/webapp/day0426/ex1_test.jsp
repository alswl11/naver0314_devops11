<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/04/29
  Time: 10:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.Arrays" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+Han+Sans&family=Bungee+Spice&family=Diphylleia&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Nanum+Pen+Script&family=Song+Myung&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">


    <style>
        body * {
            font-family: "Song Myung";
        }
    </style>


</head>
<%
    String[] flowers = {"장미꽃", "안개꽃", "다알리아", "국화꽃", "프리지아"};
    String[] colors = {"orange", "pink", "yellow", "tomato", "gold"};
    List<String> list = Arrays.asList("2000원", "3500원", "5000원", "2300원", "9000원");
%>
<body>
<table class="table table-bordered" style="width: 400px;">
    <caption align="top"><b>배열및리스트 출력</b></caption>
    <tr class="table-success">
        <th width="60">번호</th>
        <th width="120">꽃이름</th>
        <th width="120">단가</th>
        <th>색상</th>
    </tr>
    <%
        for (int i = 0; i < flowers.length; i++) {%>
    <tr>
        <td align="center"><%=i + 1 %>
        </td>
        <td><%=flowers[i] %>
        </td>
        <td><%=list.get(i) %>
        </td>
        <td style="background-color: <%=colors[i]%>">
            <%=colors[i] %>
        </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
