<%@ page import="data.dao.ShopDao" %><%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/10
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // shopidx 읽고
    int shopidx = Integer.parseInt(request.getParameter("shopidx"));
    // dao 선언하고
    ShopDao dao = new ShopDao();

    dao.deleteShop(shopidx);
%>