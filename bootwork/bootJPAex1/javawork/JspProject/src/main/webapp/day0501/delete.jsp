<%@ page import="data.dao.StudentDao" %><%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/02
  Time: 10:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //1. num 읽기
    int num=Integer.parseInt(request.getParameter("num"));
//2. dao 생성
    StudentDao dao=new StudentDao();
//3. 삭제 메서드 호출
    dao.deleteStudent(num);
//4. 목록으로 이동
    response.sendRedirect("list.jsp");
%>
