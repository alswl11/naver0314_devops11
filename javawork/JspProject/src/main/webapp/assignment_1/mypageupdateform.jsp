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
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>

<body>
<br><br>

<%--<%--%>
<%--    String userID = session.getAttribute("userID") == null ? "" : session.getAttribute("userID").toString();--%>
<%--    UserDao dao = new UserDao();--%>
<%--    UserDto dto = dao.getUserData(userID);--%>
<%--%>--%>
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
<div class="topbtn-container">
    <form method="post" action="mypageUpdate.jsp">
        <table class="table table-bordered" style="width: fit-content">
            <tr>
                <td><h5 class="myinfo"> ID</h5></td>
                <td>
                    <input type="text" class="myinfo" name="userID" value="<%=dto.getUserID()%>">
                </td>
            </tr>
            <tr>
                <td><h5 class="myinfo"> 이름</h5></td>
                <td>
                    <input type="text" class="myinfo" name="name" value="<%=dto.getName()%>">
                </td>
            </tr>
            <tr>
                <td><h5 class="myinfo">전화번호 </h5></td>
                <td>
                    <input type="text" class="myinfo" name="ph" value="<%=dto.getPh()%>">
                </td>
            </tr>
            <tr>
                <td><h5 class="myinfo">이메일 </h5></td>
                <td>
                    <input type="text" class="myinfo" name="email" value="<%=dto.getEmail()%>">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-outline-secondary">저장하기
                    </button>
                    <button type="button" class="btn btn-outline-secondary" onclick="location.href = 'mypage.jsp'">취소
                    </button>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>