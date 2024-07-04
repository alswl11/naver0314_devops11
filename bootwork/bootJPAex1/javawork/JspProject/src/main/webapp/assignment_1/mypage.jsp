<%@ page import="data.dto.UserDto" %>
<%@ page import="data.dao.UserDao" %>
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

        .title {
            background-color: #ff6320;
            font-weight: bold;
            margin-left: 30px;
            font-size: 3em;
            width: 350px;
        }

        .myinfo {
            text-align: left;
            /*margin: 20px;*/
        }

        .bottom {
            border: 2px solid #ff6320;
            /*width: 30%;*/
            /*height: 250px;*/
            margin-top: 150px;
            width: auto;
            height: auto;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .topbtn-container {
            /*display: flex;*/
            /*justify-content: center;*/
            /*align-items: center;*/
        }

    </style>
</head>
<body>
<br><br>

<%
    String userID = session.getAttribute("userID") == null ? "" : session.getAttribute("userID").toString();
    UserDao dao = new UserDao();
    UserDto dto = dao.getUserData(userID);

    // 수정된 내용이 세션에 있는지 확인
    UserDto updatedUserInfo = (UserDto) session.getAttribute("updatedUserInfo");
    if (updatedUserInfo != null) {
        // 세션에 수정된 내용이 있다면 dto에 반영
        dto = updatedUserInfo;
    }
%>
<table>
    <tr>
        <button type="text" class="topbtn" id="mypage"
                style="width: 100px; float: right; margin-right: 30px; background-color: #ff6320">MYPAGE
        </button>
        <button type="button" class="topbtn" id="location" style="width: 100px; float: right; margin-right: 30px"
                onclick="location.href='location.jsp'">LOCATION
        </button>
        <button type="button" class="topbtn" id="ticketing" style="width: 100px; float: right; margin-right: 30px"
                onclick="location.href= 'ticketing.jsp'">TICKETING
        </button>
        <button type="button" class="topbtn" id="home" style="width: 100px; float: right; margin-right: 30px"
                onclick="location.href= 'home.jsp'">HOME
        </button>

    </tr>
</table>
<hr style="font-weight: bold; margin-top: 80px">
<hr style="font-weight: bold; margin-top: 20px">
<text class="title">&nbsp;마이페이지&nbsp;</text>
<br><br>

<%-- 로그인/로그아웃 버튼 위치를 조정하기 위한 컨테이너 --%>
<div class="topbtn-container">
    <form method="post" action="mypageUpdate.jsp">
        <div style="width: 40%; float:left; padding-left: 140px">
        <table class="table table-bordered">
            <% if (session.getAttribute("userID") != null) { %>
            <%-- 사용자 정보가 null이 아닐 때만 정보를 출력 --%>
            <% if (dto != null) { %>
            <div style="border-bottom: 1px solid #ff6320; width: fit-content; margin-bottom: 30px" ><h5><%=dto.getName()%>의 정보</h5></div>
            <tr>
                <td><h5 class="myinfo"> ID </h5></td>
                <td><h5 class="myinfo"><%=dto.getUserID()%>
                </h5></td>
            </tr>
            <tr>
                <td><h5 class="myinfo"> 이름</h5></td>
                <td><h5 class="myinfo"><%=dto.getName()%>
                </h5></td>
            </tr>
            <tr>
                <td><h5 class="myinfo">전화번호 </h5></td>
                <td><h5 class="myinfo"><%=dto.getPh()%>
                </h5></td>
            </tr>
            <tr>
                <td><h5 class="myinfo">이메일 </h5></td>
                <td><h5 class="myinfo"><%=dto.getEmail()%>
                </h5></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="button" onclick="location.href= 'logout.jsp'">로그아웃</button>&nbsp;&nbsp;
                    <button type="button" onclick="location.href = 'mypageupdateform.jsp'">수정하기</button>
                    <button type="button" id="deluser" userID="<%=dto.getUserID()%>">탈퇴하기</button>
                </td>
            </tr>
            <%
                } %>
            <% } else { %>
            <div class="bottom" >
                <br>
                <text type="button" class="topbtn" id="login" style="font-weight: bolder; font-size: 1.3em"
                      onclick="location.href = 'login.jsp'">&nbsp; 로그인하기 &nbsp;
                </text>
                <br>
            </div>
            <% } %>
        </table>
        </div>
        <div style="float: right; width: 50%; padding-right: 180px">
            <table class="table table-bordered" >
                <h5 style="border-bottom: 1px solid#ff6320; width: fit-content; margin-bottom: 30px">예매 내역</h5><br>
                <tr>
                    <td style="color: midnightblue">예약 번호</td>
                    <td>2405072175-1135</td>
                </tr>
                <tr>
                    <td style="color: midnightblue">전시명</td>
                    <td>이경준 사진전: 원 스텝 어웨이</td>
                </tr>
                <tr>
                    <td style="color: midnightblue">구매 일시</td>
                    <td>2024-05-07</td>
                </tr>
                <tr>
                    <td style="color: midnightblue">구매 금액</td>
                    <td>45,000</td>
                </tr>
            </table>
        </div>
    </form>
</div>
<script>
    $("#deluser").click(function () {
        let userID = $(this).attr("userID");
        let a = confirm(userID + "님의 회원 정보를 삭제하려면 확인을 눌러주세요");
        if (a) {
            location.href = "delete.jsp?userID=" + userID;
        }
    });
</script>
<div>

</div>
</body>
</html>