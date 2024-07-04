<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<button type="button" class="btn btn-sm btn-outline-success" onclick="location.href = './form'">
    <i class="bi bi-pencil-fill"></i> 글쓰기
</button>
<div style="margin: 20px; font-size: 25px">
    총 ${totalCount}개의 게시글이 있습니다.
</div>
<table class="table table-striped" style="width: 600px">
    <tr class="table-danger">
        <th width="80">번호</th>
        <th width="250">제목</th>
        <th width="100">작성자</th>
        <th width="100">작성일</th>
        <th>조회</th>
    </tr>
    <c:if test="${totalCount==0}">
        <tr height="100">
            <td colspan="5" align="center" valign="middle">
                <h4>등록된 게시글이 없습니다</h4>
            </td>
        </tr>
    </c:if>
    <c:if test="${totalCount>0}">
        <c:forEach var="dto" items="${list}">
            <tr>
                <td>${no}</td>
                <c:set var="no" value="${no-1}"/>
                <td> <!-- 제목은 클릭시 디테일 페이지로 이동하는데 num을 넘겨야한다 / 페이징처리 시 현재 페이지도 같이 넘겨야 함-->
                    <a href="./detail?num=${dto.num}&currentPage=${currentPage}"  style="text-decoration: none; color: black">${dto.subject }</a>
                </td>
                <td>${dto.writer }</td>
                <td>
                    <fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd"/>
                </td>
                <td>${dto.chu }</td>
            </tr>
        </c:forEach>
    </c:if>
</table>

<div style="width: 600px; text-align: center; font-size: 22px">
    <%-- 이전 : startPage가 1보다 클 경우 이전이 보이도록 설정하는데 --%>
    <%-- 이전을 클릭할 경우 전블럭의 마지막 페이지가 현재 페이지가 되어야 한다 --%>
    <c:if test="${startPage > 1}">
        <a href="./list?currentPage=${startPage-1}" style="font-size: 0.8em; text-decoration:none; color: ${currentPage==pp?'magenta':'gray'}">< &nbsp;</a>
    </c:if>
    <c:forEach var="pp" begin="${startPage}" end="${endPage}">
        <a href="./list?currentPage=${pp}" style="font-size: 0.8em; text-decoration:none; color: ${currentPage==pp?'magenta':'gray'}">${pp}</a>&nbsp;
    </c:forEach>
    <!-- 다음 : endPage가 totalPage보다 작다면 다음이 필요 -->
    <!-- 다음을 누를 경우 다음 블러긔 첫페이지가 현재 페이지가 되어야만 한다 -->
    <c:if test="${endPage < totalPage}">
        <a href="./list?currentPage=${endPage+1}" style="font-size: 0.8em; text-decoration:none; color: ${currentPage==pp?'magenta':'gray'}">&nbsp;></a>&nbsp;
    </c:if>
</div>
</body>
</html>