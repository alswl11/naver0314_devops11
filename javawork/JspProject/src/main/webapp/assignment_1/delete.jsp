<%@ page import="data.dto.UserDto" %>
<%@ page import="data.dao.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/07
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String userID = request.getParameter("userID");
    UserDao dao = new UserDao();
    dao.deleteUser(userID);

    // 세션에 저장된 사용자 정보도 삭제
    session.removeAttribute("userID");

    response.sendRedirect("home.jsp");
%>
