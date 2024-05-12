<%@ page import="java.util.Map" %>
<%@ page import="data.dto.StudentDto" %>
<%@ page import="data.dao.StudentDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/01
  Time: 2:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<%
    StudentDao dao = new StudentDao();
    List<StudentDto> list = dao.getAllStudents();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

%>
<body>
<div style="margin: 20px;width: 400px;">
    <table  class="table table-striped">
        <caption align="top">
            <b>학생 정보</b>
            <button type="button" class="btn btn-sm btn-info"
                    onclick="location.href='writeform.jsp'"
                    style="float: right;">학생정보추가</button>
        </caption>
        <tr class="table-danger">
            <th width="130">학생명</th>
            <th width="150">등록일자</th>
            <th>상세보기</th>
        </tr>
        <%
            for(StudentDto dto:list)
            {%>
        <tr>
            <td><%=dto.getName() %></td>
            <td><%=sdf.format(dto.getWriteday()) %></td>
            <td>
                <button type="button" class="btn btn-sm btn-outline-secondary"
                        onclick="location.href='detail.jsp?num=<%=dto.getNum()%>'">상세보기</button>
            </td>

        </tr>
        <%}
        %>
    </table>
</div>
</body>
</html>
