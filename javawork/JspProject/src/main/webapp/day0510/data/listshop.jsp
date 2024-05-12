<%@ page import="data.dao.ShopDao" %>
<%@ page import="java.util.List" %>
<%@ page import="data.dto.ShopDto" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.JSONArray" %><%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/10
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%
    // idx int타입으로 읽기
    int idx = Integer.parseInt(request.getParameter("idx"));
    // dao
    ShopDao dao = new ShopDao();
    // list
    List<ShopDto> list = dao.getShopDatas(idx);
    // 날짜 포멧
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    // json으로 변환
    JSONArray arr = new JSONArray();
    for(ShopDto dto:list) {
        JSONObject ob = new JSONObject();
        ob.put("shopidx",dto.getShopidx());
        ob.put("sname", dto.getSname());
        ob.put("sprice",dto.getSprice());
        ob.put("scount",dto.getScount());
        ob.put("scolor",dto.getScolor());
        ob.put("sphoto",dto.getSphoto());
        ob.put("wirteday", sdf.format(dto.getWriteday()));

        arr.add(ob);
    }
%>

<%=arr.toString()%>