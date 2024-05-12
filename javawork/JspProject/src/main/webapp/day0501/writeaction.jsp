<%@ page import="data.dto.StudentDto" %>
<%@ page import="data.dao.StudentDao" %>
<%@ page import="java.sql.Timestamp" %><%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/01
  Time: 2:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 한글 encoding
    request.setCharacterEncoding("utf-8");

    // 데이어 읽기 (license 경우는 체크하면 y, 안할경우 n을 저장)
    String name = request.getParameter("name");
    String blood = request.getParameter("blood");
    int java = Integer.parseInt(request.getParameter("java"));
    int spring = Integer.parseInt(request.getParameter("spring"));
    int html = Integer.parseInt(request.getParameter("html"));
    char license = request.getParameter("license")==null?'n':'y';

    // dto 선언 후 데이터 넣기
    StudentDto dto = new StudentDto();
    dto.setName(name);
    dto.setBlood(blood);
    dto.setLicense(license);
    dto.setJava(java);
    dto.setSpring(spring);
    dto.setHtml(html);

    // dao 선언 후 메서드 호출
    StudentDao dao = new StudentDao();
    dao.insertStudent(dto);

    // 목록으로 이동
    response.sendRedirect("list.jsp");

%>
