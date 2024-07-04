<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+Han+Sans&family=Bungee+Spice&family=Diphylleia&family=Do+Hyeon&family=Nanum+Pen+Script&family=Song+Myung&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>
        body * {
            font-family: "Do Hyeon";
        }
    </style>
    <script type="text/javascript">
        $(function() {
            $("#upload").change(function () {
                let reg = /(.*?)\/(jpg|jpeg|png|gif)$/;
                let f = $(this)[0].files[0];
                if (!f.type.match(reg)) {
                    alert("이미지 파일만 가능합니다");
                    return;
                }
                if (f) {
                    let reader = new FileReader();
                    reader.onload = function (e) {
                        $("#showimg1").attr("src", e.target.result);
                    }
                    reader.readAsDataURL($(this)[0].files[0]);
                }
            });
        });
    </script>
</head>
<c:if test="${sessionScope.loginok==null}">
    <script type="text/javascript">
        alert("먼저 로그인 후 글을 작성해주세요");
        history.back();
    </script>
</c:if>
<body>
<form action="./update" method="post" enctype="multipart/form-data">
<%--    2개의 hidden--%>
    <input type="hidden" name="num" value="${dto.num}">
    <input type="hidden" name="currentPage" value="${currentPage}">

    <table class="table table-bordered" style="width: 400px">
        <caption align="top">
            <h4><b>글수정</b></h4>
        </caption>
        <tr>
            <th width="100" class="table-warning">제목</th>
            <td>
                <input type="text" name="subject" required= "required" value="${dto.subject}">
            </td>
        </tr>
        <tr>
            <th width="100" class="table-warning">사진</th>
            <td>
                <img src="../save/${dto.uploadphoto}" id="showimg1" style="border: 1px solid black; width: 200px; height: 200px;" onerror="this.src='../image/noimage2.png'"><br>
                <b style="color: gray">사진을 선택하지 않으면 기존 사진이 유지됩니다</b>
                <input type="file" name="upload" id="upload" class="form-control">

            </td>
        </tr>
        <tr>
            <td colspan="2">
                <textarea name="content" required="required" style="width: 100%; height: 150px" placeholder="내용을 입력하세요">${dto.content}</textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit" class="btn btn-secondary" style="width: 100px">글 수정</button>
                <button type="button" class="btn btn-secondary" style="width: 100px" onclick="history.back()">이전으로</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
