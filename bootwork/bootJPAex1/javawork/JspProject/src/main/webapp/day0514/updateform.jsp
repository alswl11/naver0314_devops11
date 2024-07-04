
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
        .selectavata {
            border: 2px solid hotpink;
            box-shadow: 3px 3px 3px gray;
            border-radius: 5px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("img.avata").eq(${dto.avata}-1).addClass("selectavata");
            $("img.avata").click(function () {
                $(this).siblings().removeClass("selectavata"); // 다른 아바타의 class 제거
                $(this).addClass("selectavata"); // 클릭한곳에 class 추가
                $("#avata").val($(this).attr("n")); // 태그의 n 값을 얻어서 input 태그에 넣음
            });
        });
    </script>
</head>
<body>
<div style="margin: 30px">
    <form action="./update" method="post">
        <%-- hidden  --%>
        <input type="hidden" name="num" value="${dto.num}">
        <input type="hidden" name="currentPage" value="${currentPage}">
        <table class="table table-bordered" style="width: 400px">
            <caption align="top">
                <b>글 수정</b>
            </caption>
            <tr>
                <th class="table-success" width="100">작성자</th>
                <td><input type="text" class="form-control" name="writer" required = "required" value="${dto.writer}"></td>
            </tr>
            <tr>
                <th class="table-success" width="100">아바타</th>
                <td>
                    <%-- 확인 후 hidden 으로 수정할 예정--%>
                    <input type="hidden" name="avata" id="avata" value="${dto.avata}">
                    <%--아바타 클릭 시 1~10 사이 숫자가 hidden에 들어가도록 제이쿼리로 코딩--%>
                    <c:forEach var = "a" begin="1" end="10">
                        <c:if test="${a==6}"><br></c:if>
                        <img src="../snoopyAvata/s${a}.JPG" width="40" height="40" border="1" class="avata" style="cursor: pointer" n="${a}">
                    </c:forEach>
                </td>
            </tr>
            <tr>
                <th class="table-success" width="100">제목</th>
                <td><input type="text" class="form-control" name="subject" required = "required" value="${dto.subject}"></td>
            </tr>
            <tr>
                <th class="table-success" width="100">내용</th>
                <td><textarea style="width: 100%; height: 120px" name="content" required = "required">${dto.content}</textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-sm btn-success">게시글 수정</button>
                    <button type="button" class="btn btn-sm btn-success" onload="history.back()">이전으로</button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
