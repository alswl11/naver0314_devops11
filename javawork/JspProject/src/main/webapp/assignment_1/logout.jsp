
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 세션에서 userID 속성 제거
    session.removeAttribute("userID");
    // 로그아웃 후 홈페이지(home.jsp)로 이동
    response.sendRedirect("home.jsp");
%>