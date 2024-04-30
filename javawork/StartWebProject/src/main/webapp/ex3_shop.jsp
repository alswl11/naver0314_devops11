<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/04/28
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="test.data.ShopDto"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
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

        div.shop {
            float: left;
            margin: 5px;
            border: 2px solid gray;
            border-radius: 20px;
            padding: 15px;
            width: 200px;
            height: 300px;
        }

        div.shop img {
            width: 160px;
            height: 180px;
            border-radius: 20px;
        }
    </style>
</head>
<%
//    List<ShopDto> list = new Vector<>();
    List<ShopDto> list = new Vector<>();
    //5개의 상품을 리스트에 등록해보자
    list.add(new ShopDto("보석머리띠", "30.jpg", 23000, 3, "orange"));
    list.add(new ShopDto("화이트자켓", "31.jpg", 35000, 1, "pink"));
    list.add(new ShopDto("꽃머리끈", "26.jpg", 8000, 3, "yellow"));
    list.add(new ShopDto("플렛슈즈", "14.jpg", 32000, 4, "green"));
    list.add(new ShopDto("쁘띠스카프", "10.jpg", 67000, 5, "hotpink"));
%>
<body>
<%
    //상품 출력
    for (ShopDto dto : list) {%>
<div class="shop" style="background-color: <%=dto.getColor()%>">
    <img src="./shop/<%=dto.getPhoto()%>">
    <br><br>
    <h6>가격 : <%=dto.getPrice()%>원</h6>
    <h6>수량 : <%=dto.getCount() %>개</h6>
</div>
<%
    }
%>

</body>
</html>
