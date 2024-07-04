<%@ page import="data.dao.SawonDao" %>
<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/04/30
  Time: 3:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int num = Integer.parseInt(request.getParameter("num"));
    SawonDao dao = new SawonDao();
    dao.deleteSawon(num);
    response.sendRedirect("sawonlist.jsp");
%>
