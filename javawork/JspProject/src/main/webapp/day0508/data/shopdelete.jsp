<%@ page import="data.dao.ShopDao" %><%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/09
  Time: 1:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //shopidx int 로 읽기
    int shopidx=Integer.parseInt(request.getParameter("shopidx"));
    //dao
    ShopDao dao=new ShopDao();
    //delete 메서드 호출
    dao.deleteShop(shopidx);
%>
