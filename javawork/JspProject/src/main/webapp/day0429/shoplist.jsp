<%@ page import="data.dao.ShopDao" %>
<%@ page import="data.dto.ShopDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/04/29
  Time: 11:07 AM
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
        .smallphoto {
            width: 50px;
            height: 50px;
            border: 1px solid gray;
            margin-right: 5px;
        }
    </style>
</head>
<%
    // dao 선언
    ShopDao dao = new ShopDao();
    // db에 등록된 상품들 가져오기
    List<ShopDto> list = dao.getShopDatas();
    // 날짜 형식
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
%>
<body>
<div style="margin: 10px; width: 400px;">
    <h5 class="alert alert-danger">
        <b>총 <%=list.size()%> 개의 상품이 등록되어 있습니다</b>
    </h5>
    <button type="button" class="btn btn-outline-primary" style="margin-top: 10px; margin-left: 300px" onclick="location.href = './shopform.jsp'">상품 추가</button>
    <br><br>
    <table class="table table-bordered">
        <tr class="table-danger">
            <th width="200" style="text-align: center">상품명</th>
            <th width="100" style="text-align: center">가격</th>
            <th style="text-align: center">등록일</th>
        </tr>
        <%
            for (ShopDto dto:list) { %>
              <tr>
                  <td>
                      <a href="./shopdetail.jsp?shopidx=<%=dto.getShopidx()%>" style="text-decoration: none; color: black">
                          <img src="<%=dto.getSphoto()%>" class="smallphoto">
                          <%=dto.getSname()%>
                      </a>
                  </td>
                  <td align="center"><%=dto.getSprice()%>원</td>
                  <td>
                      <%=sdf.format(dto.getWriteday())%>
                  </td>
              </tr>
            <%}
        %>
    </table>

</div>
</body>
</html>
