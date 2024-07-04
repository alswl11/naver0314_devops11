
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<h2 class="alert alert-info" style="width: 500px">총 ${totalCount}명의 회원이 있습니다.
    <span style="float:right">
        <button type="button" class="btn btn-sm btn-success" onclick="location.href = './form'">멤버 등록 </button>
    </span>
</h2>

<table class="table table-bordered" style="width: 600px">
    <tr align="center">
        <td>번호</td>
        <td>회원명</td>
        <td>아이디</td>
        <td>핸드폰</td>
        <td>상세보기</td>
    </tr>
    <c:forEach var="s" items="${list}">
        <tr align="center">
            <td>${s.num}</td>
            <td>
                <img src="/image/${s.photo}" width="100" height="100">&nbsp;${s.name}
            </td>
            <td>${s.myid}</td>
            <td>${s.hp}</td>
            <td><button type="button" class="btn btn-sm btn-warning" onclick="location.href = './detail?num=${s.num}'">detail</button></td>

        </tr>
    </c:forEach>
</table>
</body>
</html>
