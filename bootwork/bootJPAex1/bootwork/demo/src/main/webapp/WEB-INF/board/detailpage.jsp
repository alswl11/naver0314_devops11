<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        pre.adata{
            margin-left: 20px;
            color: gray;
        }
        span.aday {
            margin-left: 110px;
            color: gray;
            font-size: 0.9em;
        }
    </style>
    <c:set var="stpath" value="https://kr.object.ncloudstorage.com/bitcamp-bucket-56/photocommon"/>

    <script type="text/javascript">
        $(function (){
            // 처음 로딩시 댓글 목록 출력
            answer_list();

            // 댓글 추가 버튼
            $("#btnansweradd").click(function () {
                let num = ${dto.num};
                let content = $("#acontent").val();
                if(content == '') {
                    alert("댓글을 입력 후 등록해주세요");
                    return;
                }
                $.ajax( {
                    type : "post",
                    dataType : "text",
                    url: "./ainsert",
                    data : {"num" : num, "content" : content},
                    success : function () {
                        // 댓글 목록 다시 출력
                        answer_list();
                        // 초기화
                        $("#acontent").val("");
                    }
                })
            });
            // 댓글삭제 이벤트
            $(document).on("click", ".adel", function () {
                let aidx = $(this).attr("aidx");
                let a = confirm("해당 댓글을 삭제할까요?");
                if (a) {
                    $.ajax({
                        type : "get",
                        dataType : "text",
                        data : {"aidx" : aidx},
                        url : "./adelete",
                        success : function () {
                            // 댓글 삭제 후 다시 목록 출력
                            answer_list();
                        }
                    })
                }
            })
        });
        function answer_list() {
            let num = ${dto.num};
            // 로그인중인지 로그인중일 경우 아이디 얻기
            let loginok = "${sessionScope.loginok}";
            let loginid = "${sessionScope.loginid}";
            console.log(loginok + "\n" + loginid);

            $.ajax({
                type: "get",
                dataType: "json",
                data: {"num" : num},
                url: "./alist",
                success : function (data) {
                    // 댓글 갯수 출력
                    $(".answercount").text(data.length);
                    // 목록 출력
                    let s = "";
                    $.each(data, function (idx, ele) {
                        s+=`\${ele.writer}(\${ele.myid})<span class="aday">\${ele.writeday}</span>`;
                        // 로그인중이면서 댓글 아이디와 로그인 아이디가 같을 경우 삭제 아이콘 추가
                        if(loginok=="yes" && loginid==ele.myid) {
                            s+=`  <i class="bi bi-trash adel" aidx="\${ele.aidx}" style="cursor: pointer"></i>`;
                        }
                        s+=`<br><pre class="adata">\${ele.content}</pre><br>`;
                    });
                    $(".answerlist").html(s);
                }
            })
        }
    </script>
</head>
<body>
<div style="border: 1px solid gray; width: 80%; height: auto; padding-bottom: 50px" >
    <br>
    <h2 style="margin-left: 50px">${dto.subject}</h2>
    <table>
        <tr>
            <td  colspan="2">
                <img src="${stpath}/${profile_photo}" style="margin-left: 50px; width: 50px; height: 50px; border-radius: 30px" onerror="this.src = '../image/noimage2.png'">
            </td>
            <td>
                <h8 style="color: gray; margin-left: 10px; font-size: 0.8em">${dto.writer}</h8><br>
                <h8 style="color: gray; margin-left:10px; font-size: 0.8em">${dto.writeday}</h8>
                <h8 style="color: gray; margin-left:10px; font-size: 0.8em"> 조회수 : ${dto.readcount}</h8>
                <h8 style="color: gray; margin-left: 10px; font-size: 0.83em"> 댓글 <span class="answercount">0</span></h8>
            </td>
        </tr>
    </table>
    <hr style="margin-left: 10px; margin-right: 10px">
    <br><br>
    <h6 style="margin-left: 50px;">${dto.content}</h6>
    <c:if test="${dto.uploadphoto != 'no'}">
        <img src="${stpath}/${dto.uploadphoto}" style="width: 400px; height: 400px; margin-left: 50px; margin-bottom: 40px"
             onerror="this.src= '../image/noimage1.png'">
    </c:if>
    <tr>
        <td>
            <hr>
            <div class="answerlist" style="margin-left: 50px; margin-top: 30px"></div>
        </td>
    </tr>
    <c:if test="${sessionScope.loginok!=null}">
        <tr>
            <td>
                <b style="margin-left: 20px">댓글</b><br>
                <textarea style="width: 80%; height: 60px; margin-left: 20px" id="acontent"></textarea>
                <button type="button" class="btn btn-outline-success" style="height: 65px; position: relative; top: -25px"
                        id="btnansweradd">등록</button>
            </td>
        </tr>
    </c:if>

    <div align="center" style="margin-top: 30px">
        <button type="button" class="btn btn-sm btn-light" onclick="location.href= './form'">글쓰기</button>
        <button type="button" class="btn btn-sm btn-light"
                onclick="location.href = './form?num=${dto.num}&regroup=${dto.regroup}&restep=${dto.restep}&relevel=${dto.relevel}&currentPage=${currentPage}'">답글</button>
        <button type="button" class="btn btn-sm btn-light" onclick="location.href='./updateform?num=${dto.num}&currentPage=${currentPage}'">수정</button>
        <button type="button" class="btn btn-sm btn-light">삭제</button>
        <button type="button" class="btn btn-sm btn-light" onclick="history.back()">목록</button>
    </div>
</div>
<script>
    function del() {
        let num = ${dto.num};
        let currentPage = ${currentPage};
        let a = confirm("정말 삭제하시겠습니까?");
        if(a) {
            location.href="./delete?num="+num+"&currentPage="+currentPage;
        }
    }
</script>
</body>
</html>
