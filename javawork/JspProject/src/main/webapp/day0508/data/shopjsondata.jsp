<%@ page import="data.dao.ShopDao" %>
<%@ page import="java.util.List" %>
<%@ page import="data.dto.ShopDto" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/08
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ShopDao dao = new ShopDao();
    List<ShopDto> list = dao.getShopDatas();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    JSONArray arr = new JSONArray();
    for(ShopDto dto:list) {
        JSONObject ob = new JSONObject();
        ob.put("shopidx", dto.getShopidx());
        ob.put("sname", dto.getSname());
        ob.put("sprice", dto.getSprice());
        ob.put("scount", dto.getScount());
        ob.put("scolor", dto.getScolor());
        ob.put("sphoto", dto.getSphoto());
        ob.put("writeday", sdf.format(dto.getWriteday()));

        arr.add(ob);
    }
%>
<%=arr.toString()%>