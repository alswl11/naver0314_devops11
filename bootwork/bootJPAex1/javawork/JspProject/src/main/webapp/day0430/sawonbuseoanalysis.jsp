<%@ page import="java.util.Map" %>
<%@ page import="data.dao.SawonDao" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/01
  Time: 10:13 AM
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
    // dao 선언
    SawonDao dao = new SawonDao();
    // 분석 데이터 가져오기
    List<Map<String, String>> list = dao.getBuseoAnalysis();
%>
<body>
<div style="margin: 30px 100px; width: 250px">
    <table class="table table-bordered" style="width: 100%">
        <caption align="top">
            <h4><b>우리 회사 부서 분석표</b></h4>
        </caption>
        <tr class="table-info">
            <th>부서</th>
            <th>인원수</th>
            <th>나이</th>
        </tr>
        <%
            for(Map<String, String> map : list) { %>
              <tr align="center">
                  <td><%=map.get("buseo")%></td>
                  <td><%=map.get("count")%>명</td>
                  <td><%=map.get("age")%>세</td>
              </tr>
            <%
            }
        %>
        <tr>
            <td colspan="3" align="center">
                <button type="button" class="btn btn-outline-danger" onclick="history.back()">이전으로</button>
            </td>
        </tr>

    </table>

</div>
</body>
</html>
