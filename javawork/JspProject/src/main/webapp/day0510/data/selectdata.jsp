<%@ page import="data.dao.ShopDao" %>
<%@ page import="data.dto.ShopDto" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %><%--
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
    // dto 선언하고
    ShopDto dto = dao.getSangpum(shopidx);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    // json 반환
    JSONObject ob = new JSONObject();
    ob.put("shopidx",dto.getShopidx());
    ob.put("sname", dto.getSname());
    ob.put("sprice",dto.getSprice());
    ob.put("scount",dto.getScount());
    ob.put("scolor",dto.getScolor());
    ob.put("sphoto",dto.getSphoto());
    ob.put("wirteday", sdf.format(dto.getWriteday()));
%>
<%=ob.toString()%>
