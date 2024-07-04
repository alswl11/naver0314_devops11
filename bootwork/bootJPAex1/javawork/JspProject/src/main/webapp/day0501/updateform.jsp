<%@ page import="data.dao.StudentDao" %>
<%@ page import="data.dto.StudentDto" %><%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/02
  Time: 9:33 AM
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
    int num = Integer.parseInt(request.getParameter("num"));
    StudentDao dao = new StudentDao();
    StudentDto dto = dao.getData(num);
%>
<body>
<div style="margin: 10px;width: 400px;">
    <form action="./update.jsp" method="post">
        <input type="hidden" name="num" value="<%=num%>">
        <table class="table table-bordered">
            <caption align="top"><b>학생정보수정</b></caption>
            <tr>
                <th class="table-warning" width="100">이름</th>
                <td>
                    <input type="text" name="name" class="form-control"
                           style="width: 130px;" required="required"
                           value="<%=dto.getName()%>">
                </td>
            </tr>
            <tr>
                <th class="table-warning" width="100">혈액형</th>
                <td>
                    <select class="form-select" style="width: 100px;"
                            name="blood">
                        <option <%=dto.getBlood().equals("A")?"selected":"" %>>A</option>
                        <option <%=dto.getBlood().equals("B")?"selected":"" %>>B</option>
                        <option <%=dto.getBlood().equals("AB")?"selected":"" %>>AB</option>
                        <option <%=dto.getBlood().equals("O")?"selected":"" %>>O</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th class="table-warning" width="100">운전면허</th>
                <td>
                    <label>
                        <input type="checkbox" name="license"
                            <%=dto.getLicense()=='y'?"checked":"" %>>있음
                    </label>
                </td>
            </tr>
            <tr>
                <th class="table-warning" width="100">자바점수</th>
                <td>
                    <input type="number" name="java" class="form-control"
                           style="width: 130px;" required="required"
                           min="0" max="100" value="<%=dto.getJava()%>">
                </td>
            </tr>
            <tr>
                <th class="table-warning" width="100">Spring점수</th>
                <td>
                    <input type="number" name="spring" class="form-control"
                           style="width: 130px;" required="required"
                           min="0" max="100" value="<%=dto.getSpring()%>">
                </td>
            </tr>
            <tr>
                <th class="table-warning" width="100">HTML점수</th>
                <td>
                    <input type="number" name="html" class="form-control"
                           style="width: 130px;" required="required"
                           min="0" max="100" value="<%=dto.getHtml()%>">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-info">
                        학생정보저장
                    </button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
