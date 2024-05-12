<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // amho를 읽기
    String amho = request.getParameter("amho");
    // amho가 1234면 쿠키에 amho라는 이름으로 저장
    if (amho.equals("1234")) {
        Cookie cookie = new Cookie("amho", "yes");
        cookie.setPath("/");
        cookie.setMaxAge(60);
        response.addCookie(cookie);
        // cookiemain으로 이동
        response.sendRedirect("cookiemain.jsp");
    } else { %>
<script>
    alert("암호가 맞지 않습니다");
    history.back();
</script>
<% }
%>
