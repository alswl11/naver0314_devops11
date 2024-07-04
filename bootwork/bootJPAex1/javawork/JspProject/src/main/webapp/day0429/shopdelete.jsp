<%@ page import="data.dao.ShopDao" %>
<%@ page import="data.dto.ShopDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // shopidx int로 읽기
    int shopidx = Integer.parseInt(request.getParameter("shopidx"));

    // dao 선언
    ShopDao dao = new ShopDao();
    // delete 메서드 호출
    dao.deleteShop(shopidx);

    // 목록 shplist.jsp로 이동
     response.sendRedirect("shoplist.jsp");


%>
