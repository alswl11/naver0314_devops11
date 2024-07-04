<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/23
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
<%--    <meta http-equiv="refresh" content="60; url='./list'">--%>
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

        img.small {
            border: 3px solid pink;
            border-radius: 20px;
            margin-right: 10px;
            width: 70px;
            height: 70px;
            cursor: pointer;
        }

        span.day {
            float: right;
            font-size: 14px;
            color: gray;
        }

        div.guest_box {
            width: 500px;
            border: 2px solid black;
            padding: 10px;
            margin-bottom: 10px;
        }
    </style>

    <c:set var="stpath" value="https://kr.object.ncloudstorage.com/bitcamp-bucket-56/guestphoto"/>
    <script type="text/javascript">
        $(function () {
            // 처음 시작 시 방명록 글 출력
            guest_list();
            //방명록 등록 버튼
            $("#btnaddguest").click(function () {
                let gcontent = $("#gcontent").val();
                if (gcontent == "") {
                    alert("방명록 글을 작성후 등록해주세요");
                    return;
                }

                let formData = new FormData();
                //여러장의 사진들
                for (let i = 0; i < $("#photoupload")[0].files.length; i++) {
                    formData.append("upload", $("#photoupload")[0].files[i]);//선택한 모든 사진들
                }
                //내용등록
                formData.append("gcontent", gcontent);
                $.ajax({
                    type: "post",
                    dataType: "text",
                    url: "./addguest",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function () {
                        //성공후 목록 다시 가져오기
                        guest_list();
                        //초기화
                        $("#gcontent").val("");
                        $("#photoupload").val("");
                    }
                });
            });
        });//close function

        //목록 출력하는 일반 함수
        function guest_list()
        {
            $.ajax({
                type:"get",
                url:"./datas",
                dataType: "json",
                success:function (data){
                    let s=`<b>총 \${data.length}개의 글이 있습니다</b><br>`;
                    $.each(data,function(idx,ele){
                        s += `<div class="guest_box">
                                <div>
                                <span>\${ele.writer}(\${ele.myid.substring(0,3)}***)</span>
                                <span class="day">\${ele.writeday}</span>
                                </div>
                                <pre>\${ele.gcontent}</pre>
                                `;
                        //사진 넣기
                        if(ele.photos.length>0){
                            $.each(ele.photos,function(i,sphoto){
                                s+=`<img class="small" src="${stpath}/\${sphoto}"
                        data-bs-toggle="modal" data-bs-target="#myPhotoLargeModal" onclick="large_photo('\${ele.writer}', '\${sphoto}')">`;
                            });
                        }
                        s+=`
                            </div>
                        `;
                    });

                    $("div.guestlistarea").html(s);
                }
            })
        }

        // 모달창에 제목과 사진 출력
        function large_photo(writer, photoname) {
            $(".phototitle").text("[" +writer + "] 님이 올린 사진입니다");
            $(".largephoto").attr("src", `${stpath}/\${photoname}`);
        }
    </script>
</head>
<body>
<!-- 방명록 입력은 로그인을 해야만 한다 -->
<c:if test="${sessionScope.loginok!=null}">
    <div class="guestformarea" style="width: 400px;">
		<textarea style="width: 100%;height: 120px;"
                  id="gcontent" class="form-control"></textarea>
        <br>
        <input type="file" id="photoupload" multiple="multiple">
        <button type="button" id="btnaddguest"
                class="btn btn-sm btn-info">등록
        </button>
    </div>
    <hr>
</c:if>

<div class="guestlistarea">
    방명록 목록이 나올 영역
</div>
<!-- 사진 클릭시 모달 -->
<div class="modal" id="myPhotoLargeModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title phototitle">Modal Heading</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                <img src="" class="Largephoto" style="max-width: 100%">
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
            </div>

        </div>
    </div>
</div>
</body>
</html>