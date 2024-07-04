<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/10
  Time: 11:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dao" class="data.dao.ShopDao"></jsp:useBean>
<jsp:useBean id="dto" class="data.dto.ShopDto"></jsp:useBean>
<jsp:setProperty name="dto" property="*"></jsp:setProperty> <%--이름이 같은 데이터를 dto에 넣는다--%>

<%
    dao.insertShop(dto);
%>