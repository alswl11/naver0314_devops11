<%@ page import="data.dto.MemoDto" %>
<%@ page import="data.dao.MemoDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/02
  Time: 10:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
<%
    MemoDao dao = new MemoDao();
    List<MemoDto> list = dao.getAllMemo();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<body>
<div style="margin: 10px; width: 500px">
    <table class="table table-striped">
        <caption align="top">
            <b>총 <%=list.size() %>개의 메모가 있습니다</b>
            <button type="button" class="btn btn-success btn-sm"
                    style="float: right"
                    onclick="location.href='memoform.jsp'">메모추가
            </button>
        </caption>
        <tr class="table-info">
            <th width="60">번호</th>
            <th width="300">제목</th>
            <th>작성일</th>
        </tr>
        <%
            int n = 0;
            for (MemoDto dto : list) {
                int no = list.size() - n++;
        %>
        <tr>
            <td align="center"><%=no%>
            </td>
            <td>
                <a href="memodetail.jsp?num=<%=dto.getNum() %>"
                   style="text-decoration: none;color:black;">
                    <%=dto.getTitle() %>
                </a>
            </td>
            <td><%=sdf.format(dto.getWriteday()) %>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</div>
</body>
</html>
