<%--
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
<body>
<div style="margin: 10px;width: 400px">
    <form action="./writeaction.jsp" method="post">
        <table class="table table-bordered">
            <caption align="top"><b>학생정보입력</b></caption>
            <tr>
                <th class="table-warning" width="110">이름</th>
                <td>
                    <input type="text" name="name" class="form-control"
                           style="width: 130px;" required="required">
                </td>
            </tr>
            <tr>
                <th class="table-warning" width="110">혈액형</th>
                <td>
                    <select class="form-select" style="width: 100px" name="blood">
                        <option>A</option>
                        <option>B</option>
                        <option>AB</option>
                        <option>O</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th class="table-warning" width="110">운전면허</th>
                <td>
                    <input type="checkbox" name="license"> 있음
                </td>
            </tr>
            <tr>
                <th class="table-warning" width="110">JAVA 점수</th>
                <td>
                    <input type="number" name="java" class="form-control"
                           style="width: 130px;" required="required" min="0" max="100" value="0">
                </td>
            </tr>
            <tr>
                <th class="table-warning" width="110">SPRING 점수</th>
                <td>
                    <input type="number" name="spring" class="form-control"
                           style="width: 130px;" required="required" min="0" max="100" value="0">
                </td>
            </tr>
            <tr>
                <th class="table-warning" width="110">HTML 점수</th>
                <td>
                    <input type="number" name="html" class="form-control"
                           style="width: 130px;" required="required" min="0" max="100" value="0">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-info">학생 정보 저장</button>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>
