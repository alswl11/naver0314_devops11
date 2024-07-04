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

        #home1 {
            margin-top: 150px;
            background-color: #ff6320;
            width: 100%;
            height: 90%;
        }

        #home2 {
            width: 100%;
            padding-top: 100px;
        }

        .container {
            display: flex;
            justify-content: space-between;
        }

        .card {
            border: 2px solid #ff6320;
            width: 300px;
            height: auto;
            border-radius: 25px;
            margin-bottom: 20px;
        }

        .card h2 {
            text-align: center;
            margin-top: 10px;
            margin-bottom: 20px;
        }

        .card-content {
            text-align: center;
        }

        .topbtn {
            width: 100px;
            float: right;
            margin-right: 30px;
        }

        .exhibition-description {
            height: 440px;
            width: 380px;
            margin-top: 50px;
            margin-left: 35px;
            margin-right: 20px;
        }

        .contact-info {
            text-align: left;
            margin-left: 20px;
            margin-top: 50px;
            color: dimgray;
        }
        .visit {
            font-weight: bold;
            /*padding-left: 30px;*/
            font-size: 1.4em;
        }
        .visit2 {
            padding-left: 20px;
        }

        li {
            list-style: none;
        }

        button {
            background: transparent;
            border: none;
        }
    </style>
</head>
<body>
<br><br>
<div style="width: 100%; height: 100%;">
    <table>
        <tr>
            <button type="button" class="topbtn" id="mypage" onclick="location.href = 'mypage.jsp'">MYPAGE</button>
            <button type="button" class="topbtn" id="location" onclick="location.href='location.jsp'">LOCATION</button>
            <button type="button" class="topbtn" id="ticketing" onclick="location.href= 'ticketing.jsp'">TICKETING</button>
        </tr>
        <script>
            $("#mypage").click(function () {
                location.href = "mypage.jsp";
            });
        </script>
    </table>
    <div id="home1">
        <p style=" padding-top: 240px; padding-left: 30px;font-size: 140px;">Exhibition</p>
    </div>
    <div id="home2">
        <br><br>
        <p style="font-size: 3em; margin-bottom: 20px" align="center">전시 안내</p>
        <table align="center">
            <tr>
                <td><img src="../image/exhi/jungYoungsun.png" class="exhibition-description"></td>
                <td><img src="../image/exhi/8.png" class="exhibition-description" align="right"></td>
                <td><img src="../image/exhi/4.png" class="exhibition-description"></td>
            </tr>
            <br><br>
            <tr>
               <td><img src="../image/exhi/7.png" class="exhibition-description"></td>
                <td><img src="../image/exhi/5.png" class="exhibition-description"></td>
                <td><img src="../image/exhi/6.png" class="exhibition-description"></td>
            </tr>
            <br><br>
        </table>

        <div style="height: 100px"></div>
        <div style="background-color: beige">
            <br><br>
<%--            <div class="container" align="center">--%>
            <div style="padding-left: 30px" align="left">
                <text class="visit">PLAN YOUR VISIT</text>
                <text class="visit2">관람안내</text>
                <hr>
                <h8>1. 별도의 공지가 없는 한, 전시장 내 사진 및 영상 촬영은 무음 카메라로 가능합니다.&nbsp;(삼각대, 셀카봉, 플래시 사용과 상업적 목적의 촬영을 금지합니다.)</h8><br>
                <h8>2. 전시장 내에서는 음료를 포함한 모든 음식물은 반입이 불가합니다.</h8><br>
                <h8>3. 전시 작품이나 설치물을 만지지 마십시오.</h8><br>
                <h8>4. 어린이를 동반할 경우 전시장 내에서 뛰거나, 큰소리로 감상을 방해하거나, 작품을 만지지 않도록 보호자의 각별한 주의를 부탁드립니다.</h8><br>
                <h8>5. 물품 보관소가 따로 마련되어 있지 않습니다. 캐리어와 유모차 같은 이동이 어려운 물품의 경우 검표대에서 별도로 보관을 도와드리고 있습니다.</h8><br>
                <h8>6. 현장 매표소에서도 티켓 예매가 가능하며, 구매한 다일 바로 사용 가능합니다.</h8><br>
                <h8>7. 현장 상황에 따라 온라인 예매 여부와 상관없이 대기 시간이 있을 수 있습니다.</h8><br>
                <h8>8. 관람료는 전시에 따라 상이하므로 전시별 상세 페이지를 확인 바랍니다.</h8><br>
                <h8>9. 단체 괄람은 별도로 운영 중인 정책이 없으니 참고 바랍니다.</h8><br>
                <br><br>
                <text style="color: dimgray">* 전시장 현장 매표소에서 티켓을 발권한 이후에는 취소 및 환불이 불가합니다</text><br>
                <text style="color: dimgray">* 티켓 발권 후 조기에 입장이 마감될 경우, 훼손하지 않은 상태의 티켓은 전시 종료일까지는 언제는 사용 가능합니다.</text>
                <br><br>
                <button style="font-size:1.2em; background-color: #ff6320;" onclick="location.href='ticketing.jsp'">예매하러 가기  -></button><br><br>
                <text align="center">관람 시간</text>
                <hr width="30%">
                <text>월, 화, 목, 금, 일요일</text><br>
                <text>10:00 - 18:00</text><br>
                <text>수, 토요일</text><br>
                <text>10:00 - 21:00</text><br><br><br>
            </div>
            <p style="border: 1.6px solid black"></p>
        </div>
        <%--        <div style="border: 1px solid #ff6320; margin-top: 30px"></div>--%>
        <div class="contact-info">
            <h6> 대표자: 김성희, 사업자등록번호: 138‒83‒00313</h6>
            <h6>대표전화: 02‒3701‒9500,</h6>
            <h6> 국립현대미술관 서울</h6>
            <h6> 서울 종로구 삼청로 30</h6>
            <h6>© 2021 National Museum of Modern and Contemporary Art, Korea</h6><br><br>
        </div>
    </div>
</div>
</body>
</html>
