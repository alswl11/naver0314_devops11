<%@ page import="data.dto.ShopDto" %>
<%@ page import="data.dao.ShopDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // 1. 에코딩
    request.setCharacterEncoding("utf-8");

    // 2. 5개의 상품 데이터 읽기
    String shopidx = request.getParameter("shopidx");
    String sname = request.getParameter("sname");
    String scolor = request.getParameter("scolor");
    String sphoto = request.getParameter("sphoto");
    int sprice = Integer.parseInt(request.getParameter("sprice"));
    int scount = Integer.parseInt(request.getParameter("scount"));

    // 3. dto에 넣기 - setter로 넣기 (총 6개)
    ShopDto dto = new ShopDto();
    dto.setShopidx(shopidx);
    dto.setSname(sname);
    dto.setScolor(scolor);
    dto.setSphoto(sphoto);
    dto.setSprice(sprice);
    dto.setScount(scount);

    // 4. dao 선언
    ShopDao dao = new ShopDao();

    // 5. update 메서드 호출
    dao.updateShop(dto);

    // 6. shoplist.jsp로 이동
//    response.sendRedirect("shoplist.jsp"); // url 주소 변경

    // shopdetail 페이지로 이동
    response.sendRedirect("shopdetail.jsp?shopidx=" + shopidx);
%>