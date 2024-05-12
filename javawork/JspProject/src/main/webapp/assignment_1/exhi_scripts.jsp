<%@ page import="data.dto.ExhiDto" %>
<%@ page import="data.dao.ExhiDao" %>
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

        .ex_img {
            /*margin-top: 50px;*/
            /*margin-left: 100px;*/
            width: 400px;
            height: 500px;
        }

        .div_ex {
            /*width: 60%;*/
            height: auto;
            margin-top: 50px;
            margin-left: 100px;

        }
        .ex_name{
            /*background-color: #ff6320;*/
            margin-left: 50px;
            width: auto;
            font-size: 2em;
            padding-bottom: 10px;
        }
        th, td {
            vertical-align: bottom;
        }
        .ex_sc {
            /*background-color: gray;*/
            width: 92%;
            color: dimgray;
            font-size: 1.1em;
        }
        .btn_res {
            margin-left: 50%;
            margin-top: 20px;
            background-color: #ff6320;
            font-size: 1.3em;
        }
        .ds {
            color: #ff6320;
        }
        .ds2 {
            color: darkslategray;
        }
    </style>
</head>
<body>
<br><br>
<%
    int num = Integer.parseInt(request.getParameter("num"));
    ExhiDao exhi_dao = new ExhiDao();
    ExhiDto exhi_dto = exhi_dao.getExhiData(num);
%>

<table>
    <tr>
        <button type="button" class="topbtn" id="mypage" style="width: 100px; float: right; margin-right: 30px"
                onclick="location.href = 'mypage.jsp'">MYPAGE
        </button>
        <button type="button" class="topbtn" id="location" style="width: 100px; float: right; margin-right: 30px"
                onclick="location.href='location.jsp'">LOCATION
        </button>
        <button type="text" class="topbtn" id="ticketing"
                style="width: 100px; float: right; margin-right: 30px; background-color: #ff6320">TICKETING
        </button>
        <button type="button" class="topbtn" id="home" style="width: 100px; float: right; margin-right: 30px"
                onclick="location.href= 'home.jsp'">HOME
        </button>
    </tr>
</table>
<hr style="font-weight: bold; margin-top: 80px">
<hr style="font-weight: bold; margin-top: 20px">
<div class="div_ex">
    <table>
        <tr>
            <td>
                <img src="<%=exhi_dto.getImg_addr()%>" class="ex_img">
            </td>
            <td>
                <div class="ex_name" style="border-bottom: 2px solid #ff6320;">
                    <%=exhi_dto.getExhi_name()%>
                </div>
            </td>
        </tr>
    </table>
    <br><br>
    <div class="ex_sc"><%=exhi_dto.getExhi_explain()%></div>
</div>
<br>
<hr style="margin-left: 25px; margin-right: 25px">
<table>
    <tr>
        <td style="padding-left: 80px; padding-right: 80px; padding-bottom: 20px; padding-top: 20px">
            <text class="ds">기간</text><br>
            <text class="ds2">: <%=exhi_dto.getPeriod()%></text>
        </td>
        <td style="padding-left: 80px; padding-right: 80px; padding-bottom: 20px">
            <text class="ds">작가</text><br>
            <text class="ds2">: <%=exhi_dto.getAuthor()%></text>
        </td>
        <td style="padding-left: 80px; padding-right: 80px; padding-bottom: 20px">
            <text class="ds">작품수</text><br>
            <text class="ds2">: <%=exhi_dto.getCount()%></text>
        </td>

    </tr>
    <tr>
        <td style="padding-left: 80px; padding-right: 80px; padding-top: 20px">
            <div>
                <text class="ds">주최/후훤</text><br>
                <text class="ds2">: <%=exhi_dto.getSupport()%></text>
            </div>
        </td>
        <td style="padding-left: 80px; padding-right: 80px; padding-top: 20px">
            <div>
                <text class="ds">관람료</text><br>
                <text class="ds2">: <%=exhi_dto.getFee()%></text>
            </div>
        </td>
        <td style="padding-left: 80px; padding-right: 80px; padding-top: 20px">
            <text class="ds">장소</text><br>
            <text class="ds2">: <%=exhi_dto.getLocation()%></text>
        </td>
    </tr>
</table>
<br><br>
<hr style="margin-left: 25px; margin-right: 25px">
<button type="button" id="bookingBtn" style="background-color: #ff6320; margin-left: 50%" >예매하기</button>
<!-- 예매하기 버튼을 누르면 하단에 예매 영역이 나타나도록 수정 -->
<%
    // 수량 및 관람료 설정
    int quantity = 1; // 기본 수량
    int fee = Integer.parseInt(exhi_dto.getFee()); // 관람료
    int total = (fee == 0) ? 0:quantity*fee; // 관람료가 0원이면 총 금액도 0원, 아니면 수량 * 관람료
%>
<div align="center" style="padding-top: 30px">
    <div id="bookingSection" style="display: none; width : 50%; border: 1px solid #ff6320" align="center">
        <div align="center"><br><br>
            <label for="quantity" class="ds">수량: </label>
            <input type="number" id="quantity" name="quantity" min="1" max="10" value="<%=quantity%>" step="1">
        </div>
        <br>
        <div align="center">
            <label for="total" class="ds">총 금액:</label>
            <input type="text" id="total" name="total" value="<%=total%>" readonly>
        </div>
        <div align="center"><br><br>
            <button type="button" style="background-color: #ff6320">구매하기</button>
        </div>
        <br><br>
    </div>
</div>

<script>
    // 예매하기 버튼 클릭 시 예매 영역 토글
    $("#bookingBtn").click(function () {
        $("#bookingSection").toggle();
    });

    // 수량 변경 시 총 금액 계산
    $("#quantity").on("input", function () {
        var quantity = $(this).val();
        var total = <%=fee%> === 0 ? 0 : quantity * <%=fee%>;
        $("#total").val(total);
    });
</script>
<div style="height: 200px"></div>

</body>

</html>
