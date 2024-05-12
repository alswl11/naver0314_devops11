<%--
  Created by IntelliJ IDEA.
  User: parkminji
  Date: 2024/05/07
  Time: 11:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String myid = request.getParameter("myid");
    String mypass = request.getParameter("mypass");
    String save = request.getParameter("save");

    if (mypass.equals("1234")) {
// 세선에 저장
        session.setAttribute("myid", myid);
        session.setAttribute("loginok", "yes");
        session.setAttribute("saveok", save == null ? "no" : "yes");
// 세션 유효시간 지정 (생략 시 기본 30분 유지)
        session.setMaxInactiveInterval(60 * 60 * 3); // 3시간동안 유지
// 메인으로 이동
        response.sendRedirect("sessionmain.jsp");
    } else {%>
<script>
    alert("비밀범호가 맞지 않습니다");
    history.back();
</script>
<%
    }
%>
