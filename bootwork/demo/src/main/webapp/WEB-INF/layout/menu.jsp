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
        ul.menu{
            list-style: none;
            margin-left: 100px;
        }
        ul.menu li{
            float: left;
            width: 120px;
            font-size: 25px;
            border: 2px solid black;
            border-radius:20px;
            text-align: center;
            margin-right: 10px;
            background-color: lightyellow;
        }
        ul.menu li a{
            font-family: "Do Hyeon";
        }

        ul.menu li:hover{
            box-shadow: 5px 5px 5px gray;
            background-color: aliceblue;
            color: white;
        }

        ul.menu li a:hover{
            color: black;
        }
        div.loginarea {
            position: fixed;
            right: 100px;
            top: 100px;
        }
        div.loginarea button {
            width: 100px;
        }

    </style>
    <c:set var="root" value ="<%=request.getContextPath()%>"/>
    <script type="text/javascript">
        $(function () {
            $("#loginfrm").submit(function (e) {
                // 기본 이벤트 무효화
                e.preventDefault();
                // form 안의 입력값 읽기
                let fdata = $(this).serialize();
                // alert(fdata);
                $.ajax({
                    type:"get",
                    dataType : "json",
                    url : `${root}/member/login`,
                    data : fdata,
                    success : function (data) {
                        if(data.status == 'success') {
                            // 페이지 새로고침
                            location.reload();
                        } else {
                            alert("아이디 또는 비밀번호가 맞지 않습니다");
                        }
                    }

                })
            });
            // logout btn
            $("#btnlogout").click( function () {
                $.ajax({
                    type: "get",
                    dataType: "text",
                    url : `${root}/member/logout`,
                    success : function (){
                        // 전체 페이지 새로고침
                        location.reload();
                    }
                })
            })
        }); // close func
    </script>
</head>
<body>
<ul class="menu">
    <li>
        <a href="${root}/">Home</a>
    </li>
    <li>
        <a href="${root}/member/form">회원가입</a>
    </li>
    <li>
        <a href="${root}/member/list">회원목록</a>
    </li>
    <li>
        <a href="${root}/board/list">게시판</a>
    </li>
    <li>
        <a href="${root}/guest/list">방명록</a>
    </li>
</ul>

<%-- 로그인 모달 다이어로그 --%>
<div class="modal" id="myLoginModal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">회원 로그인</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <form id="loginfrm" >
            <!-- Modal body -->
            <div class="modal-body">
                    <table class="table table-bordered">
                        <caption align="top">
                            <label><input type="checkbox" name="saveid" ${sessionScope.saveid == null or sessionScope.saveid == 'no'?"" : "checked"}>&nbsp;아이디 저장</label>
                        </caption>
                        <tr>
                            <th class="table-success" width="80">ID</th>
                            <td>
                                <input type="text" name="myid" class="form-control" required = "required" style="width: 150px" value="${sessionScope.saveid!=null and sessionScope.saveid == 'yes' ? sessionScope.loginid:''}">
                            </td>
                        </tr>
                        <tr>
                            <th class="table-success" width="80">PW</th>
                            <td>
                                <input type="password" name="pass" class="form-control" required = "required" style="width: 150px">
                            </td>
                        </tr>
                    </table>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="submit" class="btn btn-sm btn-danger">LOGIN</button>
                <button type="button" class="btn btn-sm btn-danger" data-bs-dismiss = "modal" id="btnclose">close</button>
            </div>
            </form>
        </div>
    </div>
</div>

<div class="loginarea">
    <c:if test="${sessionScope.loginok==null}">
        <button type="button" id="btnlogin" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#myLoginModal">LOGIN</button>
    </c:if>
    <c:if test="${sessionScope.loginok!= null}">
        <b style="font-size: 20px">${sessionScope.loginid}님</b>
        <button type="button" id="btnlogout" class="btn btn-success" style="margin-left: 20px;">LOGOUT</button>
    </c:if>
</div>
</body>
</html>
