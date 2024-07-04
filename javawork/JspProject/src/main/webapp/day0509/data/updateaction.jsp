<%@ page import="data.dao.GuestDao" %>
<%@ page import="data.dto.GuestDto" %>
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/09
  Time: 4:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int num = Integer.parseInt(request.getParameter("num"));
    String nickname = request.getParameter("nickname");
    String content = request.getParameter("content");

    GuestDao dao = new GuestDao();
    GuestDto dto = new GuestDto();
    dto.setNum(num);
    dto.setContent(content);
    dto.setNickname(nickname);
    dao.updateGuest(dto);
%>