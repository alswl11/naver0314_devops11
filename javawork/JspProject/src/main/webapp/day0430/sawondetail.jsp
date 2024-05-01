<%@ page import="data.dao.SawonDao" %>
<%@ page import="java.util.List" %>
<%@ page import="data.dto.SawonDto" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/04/30
  Time: 11:35 AM
  To change this template use File | Settings | File Templates.
--%>
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
</head>
<%
    int num = Integer.parseInt(request.getParameter("num"));
    SawonDao dao = new SawonDao();
    SawonDto dto = dao.getData(num);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

%>
<body>
<div style="margin: 10px; width: 500px">
    <table>
        <caption align="top">
            <h2><b><%=dto.getName()%>의 사원 정보</b></h2>
        </caption>
        <tr>
            <td width="250">
                <img style="width: 230px;" src='<%=dto.getPhoto().equals("no")?"../image/noimage1.png":dto.getPhoto()%>'>
            </td>
            <td>
                <h5>나이 : <%=dto.getAge()%>세</h5>
                <h5>입사일 : <%=dto.getBirthday()%></h5>
                <h5>부서명 : <%=dto.getBuseo()%></h5>
                <h5>성별 : <%=dto.getGender()%></h5>
                <h5>주소 : <%=dto.getAddr()%></h5>
            </td>
        </tr>
        <tr height="60">
            <td colspan="2" align="center">
                <button type="button" class="btn btn-sm btn-warning" style="width: 80px;" onclick="location.href= 'sawonform.jsp'">사원 추가</button>
                <button type="button" class="btn btn-sm btn-warning" style="width: 80px;" onclick="location.href= 'sawonlist.jsp'">사원 목록</button>
                <button type="button" class="btn btn-sm btn-warning" style="width: 80px;" onclick="location.href= 'sawonupdateform.jsp?num=<%=dto.getNum()%>'">사원 수정</button>
                <button type="button" class="btn btn-sm btn-warning" style="width: 80px;" id="delsawon" num="<%=dto.getNum()%>" sawonname="<%=dto.getName()%>">사원 삭제</button>

            </td>
        </tr>
    </table>
</div>
<script type="text/javascript">
   $("#delsawon").click(function (){
       let num = $(this).attr("num");
       let sawonname = $(this).attr("sawonname");
       let a = confirm(sawonname + "의 사원정보를 삭제할까요?");
       if(a) {
           location.href = "sawondelete.jsp?num="+num;
       }
   });
</script>
</body>
</html>
