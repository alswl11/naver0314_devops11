<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%-- jsp의 기능인 자바빈즈를 이용해서 자동으로 읽어보자 --%>
<%-- 단 폼태그의 name, dto의 변수명이 같은 것에 한에서만 읽어옴--%>


<%
    // 한글 엔코딩
    request.setCharacterEncoding("utf-8");
%>
<%-- jsp actiontag 이용해서 dto, dao 선언--%>
<jsp:useBean id="dto" class="data.dto.SawonDto"/>
<jsp:useBean id="dao" class="data.dao.SawonDao"/>
<%-- 자동으로 데이터 읽어서 dto에 넣기 : property에 dto의 변수명을 쓰면 해당 데이터만 일어오지만--%>
<%-- * 를 쓰면 모든 데이터를 읽어온다--%>
<jsp:setProperty name="dto" property="*"/>

<%
    // insert() 호출
    dao.insertSawon(dto);
    // 사원 목록으로 이동
    response.sendRedirect("sawonlist.jsp");
%>