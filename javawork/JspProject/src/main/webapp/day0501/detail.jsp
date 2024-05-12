<%@ page import="data.dao.StudentDao" %>
<%@ page import="data.dto.StudentDto" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.NumberFormat" %><%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/01
  Time: 2:12 PM
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
    int num  = Integer.parseInt(request.getParameter("num"));
    StudentDao dao = new StudentDao();
    StudentDto dto = dao.getData(num);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    int sum = dto.getJava()+dto.getSpring()+dto.getHtml();
    double avg = sum/3.0;
    NumberFormat nf = NumberFormat.getInstance();
    nf.setMaximumFractionDigits(2);
%>
<body>
<div style="margin: 15px; width: 500px">
    <h2 class="table-info" style="width: 250px; background-color: beige" ><b><%=dto.getName()%> 학생의 상세정보</b></h2>
                <h5>등록일 : <%=sdf.format(dto.getWriteday())%></h5>
                <h5>이름 : <%=dto.getName()%></h5>
                <h5>혈액형 : <%=dto.getBlood()%></h5>
                <h5>운전면허 여부 : <%=dto.getLicense()%></h5>
                <h5>JAVA 점수 : <%=dto.getJava()%></h5>
                <h5>SPRING 점수 : <%=dto.getSpring()%></h5>
                <h5>HTML 점수 : <%=dto.getHtml()%></h5>
                <h5>총점 : <%=sum%>점</h5>
                <h5>평균 : <%=nf.format(avg)%>점</h5>

    <button type="button" class="btn btn-outline-success" onclick="location.href='list.jsp'">목록</button>
    <button type="button" class="btn btn-outline-success" onclick="location.href='updateform.jsp?num=<%=dto.getNum()%>'">학생 정보 수정</button>
    <button type="button" class="btn btn-outline-success" id="delstu" num = "<%=dto.getNum()%>" snmae = "<%=dto.getName()%>">학생 정보 삭제</button>
    <button type="button" class="btn btn-outline-success" onclick="location.href='writeform.jsp'">학생 정보 추가</button>
</div>
<script>
    $("#delstu").click(function (){
        let num = $(this).attr("num");
        let sname = $(this).attr("sname");

        let a = confirm(sname + " 학생의 정보를 삭제하려면 확인을 눌러주세요");
        if(a) {
            location.href = "detail.jsp";
        }
    })
</script>
</body>
</html>
