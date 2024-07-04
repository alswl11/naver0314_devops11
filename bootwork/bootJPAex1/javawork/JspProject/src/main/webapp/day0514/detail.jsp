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
        .table-tr {
            padding-bottom: 10px;
        }
    </style>
</head>
<body>
<table style="margin-top: 30px; margin-left: 30px" width="400px">
    <tr>
        <td class="table-tr" style="font-size: 2em" >${dto.subject}</td>
    </tr>
    <tr>
        <td class="table-tr">${dto.writer}</td>
        <td class="table-tr" style="color: gray" align="right">${dto.writeday}</td>
    </tr>
    <tr style="border-bottom: 1px solid darkslategray">
        <td class="table-tr" style="color: gray">조회 : ${dto.readcount}</td>
        <td class="table-tr" style="color: gray" align="right">추천 :
            <span class="chu">${dto.chu}&nbsp;</span>
            <i class="bi bi-hand-thumbs-up mychu"></i>
        </td>
    </tr>
    <tr>
        <td>
            <img src="../snoopyAvata/s${dto.avata}.JPG" style="width: 200px; height: 200px">
            <br><br>
        </td>
    </tr>
    <tr>
        <td class="table-tr">${dto.content}</td>
    </tr>
    <td colspan="2" align="center" class="table-tr">
        <button type="button" class="btn btn-sm btn-success" onclick="location.href='./form'">글쓰기</button>
        <button type="button" class="btn btn-sm btn-success" onclick="location.href = './updateform?num=${dto.num}&currentPage=${currentPage}'">수정</button>
        <button type="button" class="btn btn-sm btn-success" onclick="del()">삭제</button>
        <button type="button" class="btn btn-sm btn-success" onclick="history.back()">목록</button>
    </td>
</table>
<script type="text/javascript">
    function del() {
        let num = ${dto.num};
        let cp = ${currentPage};
        console.log(num, cp);

        let a = confirm("해당 게시글을 삭제하시겠습니까?");
        if(a) {
            location.href= `./delete?num=\${num}&currentPage=\${cp}`;
        }
    }
    // 추천 클릭 시 숫자 증가
    $(".mychu").click(function () {
        let num = ${dto.num};
        $.ajax({
            type : "get",
            dataType : "json",
            data : {"num" : num},
            url : "./updatechu",
            success : function (data) {
                $("span.chu").text(data.chu);
            }
        })
    })
</script>
</body>
</html>
