<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
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
<form action="./update" method="post">
    <input type="hidden" name="num" value="${dto.num}">
    <table class="table table-bordered" style="width: 400px">
        <caption align="top">
            <h3><b>회원정보 수정</b></h3>
        </caption>
        <tr>
            <th width="100" class="table-info">이름</th>
            <td  colspan="2">
                <input type="text" name="name" class="form-control" required = "required" value="${dto.name}">
            </td>
        </tr>
        <tr>
            <th width="100" class="table-info">핸드폰</th>
            <td width="200" colspan="2">
                <input type="tel" name="hp" class="form-control" required = "required" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="xxx-xxxx-xxxx" value="${dto.hp}">
            </td>
        </tr>
        <tr>
            <th width="100" class="table-info">이메일</th>
            <td width="200" colspan="2">
                <input type="email" name="email" class="form-control" required="required" value="${dto.email}">
            </td>
        </tr>
        <tr>
            <th width="100" class="table-info">주소</th>
            <td width="200" colspan="2">
                <input type="text" name="addr" class="form-control" required = "required" value="${dto.addr}">
            </td>
        </tr>
        <tr>
            <th width="100" class="table-info">생년월일</th>
            <td width="200" colspan="2">
                <input type="date" name="birthday" class="form-control" value="${dto.birthday}">
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <button type="submit" class="btn btn-outline-danger" style="width: 100px">정보수정</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
