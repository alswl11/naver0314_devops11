<%@ page import="data.dto.UserDto" %>
<%@ page import="data.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");

    // 데이터 읽기
    String userID = request.getParameter("userID");
    String userPW = request.getParameter("userPW");
    String name = request.getParameter("name");
    String ph = request.getParameter("ph");
    String email = request.getParameter("email");

    // dto에 데이터 넣기
    UserDto dto = new UserDto();
    dto.setUserID(userID);
    dto.setUserPW(userPW);
    dto.setName(name);
    dto.setPh(ph);
    dto.setEmail(email);

    // dao 선언 + 메소드 호출
    UserDao dao = new UserDao();
    dao.signupUser(dto);

    response.sendRedirect("home.jsp");

    // alert 창 띄워도 좋을 듯!
%>
