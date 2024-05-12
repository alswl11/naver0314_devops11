<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/07
  Time: 11:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //loginok 세션 제거
    session.removeAttribute("loginok");
    // 메인으로 이동
    response.sendRedirect("sessionmain.jsp");
%>