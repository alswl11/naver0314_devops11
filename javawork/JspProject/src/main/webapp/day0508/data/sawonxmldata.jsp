<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<%@ page import="java.util.List" %>
<%@ page import="data.dto.SawonDto" %>
<%@ page import="data.dao.SawonDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/xml;charset=UTF-8" language="java" %>
<%
    //전체 사원 데이터 가져오기
    SawonDao dao = new SawonDao();
    List<SawonDto> list = dao.getAllSawon();
%>

<sawonlist>
    <%
        for(SawonDto dto : list){%>
    <sawon num="<%=dto.getNum()%>">
        <name><%=dto.getName()%></name>
        <buseo><%=dto.getBuseo()%></buseo>
        <age><%=dto.getAge()%></age>
        <addr><%=dto.getAddr()%></addr>
        <photo><%=dto.getPhoto()%></photo>
        <gender><%=dto.getGender()%></gender>
        <birthday><%=dto.getBirthday()%></birthday>
    </sawon>
    <%}
    %>
</sawonlist>
