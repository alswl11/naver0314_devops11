<%@ page import="data.dao.ShopDao" %>
<%@ page import="data.dto.ShopDto" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Black+Han+Sans&family=Bungee+Spice&family=Diphylleia&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Nanum+Pen+Script&family=Song+Myung&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <style>
        body * {
            font-family: "Song Myung";
        }
    </style>
</head>
<%
    // shopidx int 타입으로 읽기
    int shopidx = Integer.parseInt(request.getParameter("shopidx"));
    // dao 선언
    ShopDao dao = new ShopDao();
    // dto 데이터 가져오기
    ShopDto dto = dao.getSangpum(shopidx);
    // 날짜 포맷 양식 지정
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<body>
<div style="margin: 10px; width: 500px">
    <h2><b>상품명 : <%=dto.getSname()%></b></h2>
    <span style="font-size: 14px; color: gray">
        등록일 : <%=sdf.format(dto.getWriteday())%>
    </span>
    <table>
        <tr>
            <td width="300">
                <img src="<%=dto.getSphoto()%>" style="border: 10px groove orange; margin: 10px; width: 270px">
            </td>
            <td>
                <h5>가격 : <%=dto.getSprice()%>원</h5>
                <h5 style="background-color: <%=dto.getScolor()%>">색상 : <%=dto.getScolor()%>색</h5>
                <h5>수량 : <%=dto.getScount()%>개</h5>
                <h5>총 금액 : <%=dto.getScount()*dto.getSprice()%>원</h5>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="button" class="btn btn-outline-danger btn-sm" style="width: 80px" onclick="location.href = 'shoplist.jsp'">목록</button>
                <button type="button" class="btn btn-outline-danger btn-sm" style="width: 80px" onclick="location.href = 'shopupdateform.jsp?shopidx=<%=dto.getShopidx()%>'">수정</button>
                <button type="button" class="btn btn-outline-danger btn-sm" style="width: 80px" onclick="location.href = 'shopdelete.jsp?shopidx=<%=dto.getShopidx()%>'">삭제1</button>
                <button type="button" class="btn btn-outline-danger btn-sm" style="width: 80px" shopidx="<%=shopidx%>" id ="delshop">삭제2</button>
                <button type="button" class="btn btn-outline-danger btn-sm" style="width: 80px" onclick="location.href = 'shopform.jsp'">추가</button>
            </td>
        </tr>
    </table>
</div>
<script>
    // 삭제2 btn
    $("#delshop").click(function () {
        let shopidx = $(this).attr("shopidx");
        let a = confirm(`\${shopidx}번 상품을 삭제할까요?`);
        if(a) {
            location.href = "shopdelete.jsp?shopidx=" + shopidx;
        }
    });
</script>
</body>
</html>
