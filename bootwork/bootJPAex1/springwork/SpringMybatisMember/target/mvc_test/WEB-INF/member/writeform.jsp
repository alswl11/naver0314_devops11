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

    <script type="text/javascript">

        let jungbok = false;

        $(function (){
            $("#myfile").change(function (){
                console.log($(this)) // 배열타입으로 넘어오는 것을 확인할 수 있다.
                let reg = /(.*?)\/(jpg|jpeg|png|gif)$/
                let f = $(this)[0].files[0]
                if(!f.type.match(reg)){
                    alert("이미지 파일만 가능합니다.")
                    return
                }
                if(f){
                    let reader = new FileReader()
                    reader.onload = function (e){
                        $("#showimg1").attr("src", e.target.result)
                    }
                    reader.readAsDataURL($(this)[0].files[0])
                }
            });

            // 중복버튼 이벤트
            $("#btncheckid").click(function () {
                // jungbok = true;
               if($("#myid").val() == '') {
                   alert ("가입할 아이디를 입력해주세요");
                   return;
               }

               $.ajax({
                   type : "get",
                   dataType : "json",
                   url : "./idcheck",
                   data : {"searchid" : $("#myid").val()},
                   success:function(data) {
                       if(data.count == 0) {
                           alert("사용 가능한 아이디입니다");
                           jungbok = true;
                       } else {
                           alert("이미 사용 중인 아이디입니다");
                           jungbok = false;
                           $("#myid").val("");
                       }
                   }
               });
            });

            // id를  입력시 다시 중복확인 누르도록 중복변수 초기화
            $("#myid").keyup(function () {
                jungbok = false;
            });

        }); // close function

        function check() {
            if(!jungbok){
                alert("아이디 중복 확인을 해주세요.");
                return false; // falae반환 시 액션 실행 안함
            }
        }
    </script>
</head>
<body>
<form action="./insert" method="post"  enctype="multipart/form-data" onsubmit="return check()">
    <table class="table table-bordered" style="width: 400px">
        <caption align="top">
            <h3><b>회원가입</b></h3>
        </caption>
        <tr>
            <th width="100" class="table-info">이름</th>
            <td  colspan="2">
                <input type="text" name="name" class="form-control" required = "required">
            </td>
        </tr>
        <tr>
            <th width="100" class="table-info">아이디</th>
            <td colspan="2">
                <div class="input-group">
                    <input type="text" name="myid" id="myid" class="form-control" required="required">
                    &nbsp;
                    <button type="button" class="btn btn-sm btn-danger" id="btncheckid">중복 확인</button>
                </div>
            </td>
        </tr>
        <tr>
            <th width="100" class="table-info">사진</th>
            <td width="200">
                <input type="file" name="myfile" id="myfile" class="form-control" required = "required">
            </td>
            </td>
            <td rowspan="2">
                <img src="" id="showimg1" style="width: 100%" onerror="this.src='../image/noimage2.png'">
            </td>
        </tr>
        <tr>
            <th width="100" class="table-info">비밀번호</th>
            <td width="200">
                <input type="password" name="passwd" class="form-control" required = "required" maxlength="8">
        </tr>
        <tr>
            <th width="100" class="table-info">핸드폰</th>
            <td width="200" colspan="2">
                <input type="tel" name="hp" class="form-control" required = "required" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" placeholder="xxx-xxxx-xxxx">
            </td>
        </tr>
        <tr>
            <th width="100" class="table-info">이메일</th>
            <td width="200" colspan="2">
                <input type="email" name="email" class="form-control" required="required">
            </td>
        </tr>
        <tr>
            <th width="100" class="table-info">주소</th>
            <td width="200" colspan="2">
                <input type="text" name="addr" class="form-control" required = "required">
            </td>
        </tr>
        <tr>
            <th width="100" class="table-info">생년월일</th>
            <td width="200" colspan="2">
                <input type="date" name="birthday" class="form-control" value="2024-01-01">
            </td>
        </tr>
        <tr>
            <td colspan="3" align="center">
                <button type="submit" class="btn btn-outline-danger" style="width: 100px">회원가입</button>
                <button type="reset" class="btn btn-outline-danger" style="width: 100px">초기화</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
