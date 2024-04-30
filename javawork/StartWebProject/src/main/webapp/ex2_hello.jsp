<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/04/28
  Time: 2:35 PM
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
<h5>자바영역의 배열변수를 table 을 이용해서 출력해보자</h5>
<%
    String[] colors = {"red", "orange", "hotpink", "green", "gray"};
%>
<table class="table table-striped" style="width: 200px;">
    <caption align="top"><b>색상 배열 출력</b></caption>
    <tr class="table-danger">
        <th>번호</th>
        <th>색상</th>
    </tr>
    <%
        for (int i = 0; i < colors.length; i++) {%>
    <tr>
        <td><%=i + 1%>
        </td>
        <td style="background-color: <%=colors[i]%>">
            <%=colors[i] %>
        </td>
    </tr>
    <%
        }
    %>
</table>
<hr>
<%
    String name = "신민아";
    String addr = "서울시 강남구";
    int age = 32;
    String blood = "AB형";
    String photo = "./talent/17.jpg";
    String[] hobby = {"자바공부", "스프링공부", "제이쿼리공부", "게임", "웹툰"};
%>
<table class="table table-bordered" style="width: 400px;">
    <tr>
        <td width="200" rowspan="4">
            <img src="<%=photo %>" width="190">
        </td>
        <td width="60" class="table-danger">이름</td>
        <td><%=name %>
        </td>
    </tr>
    <tr>
        <td width="60" class="table-danger">나이</td>
        <td><%=age %>세</td>
    </tr>
    <tr>
        <td width="60" class="table-danger">주소</td>
        <td><%=addr %>
        </td>
    </tr>
    <tr>
        <td width="60" class="table-danger">혈액형</td>
        <td><%=blood %>
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <b>취미 : </b>
            <%
                for (String h : hobby) {
                    out.print("[" + h + "]");
                }
            %>
        </td>
    </tr>
</table>
</body>
</html>
