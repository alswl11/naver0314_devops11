<%@ page import="data.dao.ExhiDao" %>
<%@ page import="data.dto.ExhiDto" %>
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
        .ex_name {
            font-weight: bold;
            margin-left: 20px;
            text-align: center;
        }
        .ex_img {
            /*margin-top: 10px;*/
            margin-left: 40px;
            height: 350px;
            width: 300px;
            float: left;
            margin-bottom: 15px;
        }
        .title {
            background-color: #ff6320;
            font-weight: bold;
            margin-left: 30px;
            font-size: 3em;
            width: 350px;
        }


    </style>
</head>
<body>
<br><br>
<table>
    <tr>
        <button type="button" class="topbtn" id="mypage" style="width: 100px; float: right; margin-right: 30px" onclick="location.href = 'mypage.jsp'">MYPAGE</button>
        <button type="button" class="topbtn" id="location" style="width: 100px; float: right; margin-right: 30px" onclick="location.href='location.jsp'">LOCATION</button>
        <button type="button" class="topbtn" id="ticketing" style="width: 100px; float: right; margin-right: 30px; background-color: #ff6320" onclick="location.href='location.jsp'">TICKETING</button>
        <button type="button" class="topbtn" id="home" style="width: 100px; float: right; margin-right: 30px" onclick="location.href= 'home.jsp'">HOME</button>

    </tr>
</table>
<hr style="font-weight: bold; margin-top: 80px">
<hr style="font-weight: bold; margin-top: 20px">
<text class="title">&nbsp;진행중인 전시회&nbsp;</text>

<br><br><br>
<table class="exhi" style="table-layout: fixed">
    <tr >
        <td>
            <img class="ex_img" src="../image/exhi/jungYoungsun.png" onclick="redirectToExhiScript(1)">
            <p class="ex_name">정영선: 이 땅에 숨쉬는 모든 것을 위하여</p>
        </td>
        <td>
            <img src="../image/exhi/2.png" class="ex_img" onclick="redirectToExhiScript('2')">
            <p class="ex_name">백 투 더 퓨처: 한국 현대미술의 덩시대성 탐험기</p>
        </td>
        <td>
            <img src="../image/exhi/3.png" class="ex_img" onclick="redirectToExhiScript('3')">
            <p class="ex_name">가변하는 소장품</p>
        </td>
        <td>
            <img src="../image/exhi/4.png" class="ex_img" onclick="redirectToExhiScript('4')">
            <p class="ex_name">보이는 수장고: MMCA 이건희 컬렉션 해외 명작전</p>
        </td>
    </tr>
    <tr>
        <td style="height: 60px"></td>
    </tr>
    <tr>
        <td>
            <img class="ex_img" src="../image/exhi/5.png" onclick="redirectToExhiScript('5')">
            <p class="ex_name">미니어처 라이프</p>
        </td>
        <td>
            <img src="../image/exhi/6.png" class="ex_img" onclick="redirectToExhiScript('6')">
            <p class="ex_name">힙노시스: 롱 플레잉 스토리</p>
        </td>

        <td>
            <img src="../image/exhi/7.png" class="ex_img" onclick="redirectToExhiScript('7')">
            <p class="ex_name">유토피아: 노웨어, 나우 히어</p>
        </td>
        <td>
            <img src="../image/exhi/8.png" class="ex_img" onclick="redirectToExhiScript('8')">
            <p class="ex_name">이경준 사진전: 원 스텝 어웨이</p>
        </td>
    </tr>
</table>
<script>
    function redirectToExhiScript(num) {
        window.location.href = 'exhi_scripts.jsp?num=' + num;
    }
</script>

</body>
</html>
