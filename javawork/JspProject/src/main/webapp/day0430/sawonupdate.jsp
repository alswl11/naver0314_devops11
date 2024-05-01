<%@ page import="data.dto.SawonDto" %>
<%@ page import="data.dao.SawonDao" %>
<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/04/30
  Time: 4:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    request.setCharacterEncoding("utf-8");

%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="dto" class="data.dto.SawonDto"></jsp:useBean>
<jsp:useBean id="dao" class="data.dao.SawonDao"></jsp:useBean>
<jsp:setProperty name="dto" property="*"></jsp:setProperty>

<%
    dao.updateSawon(dto);
    response.sendRedirect("sawondetail.jsp?num="+dto.getNum());

%>

