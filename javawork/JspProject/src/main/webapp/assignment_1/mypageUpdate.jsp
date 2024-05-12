<%@ page import="data.dto.UserDto" %>
<%@ page import="data.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    request.setCharacterEncoding("utf-8");

%>


<jsp:useBean id="dto" class="data.dto.UserDto"></jsp:useBean>
<jsp:useBean id="dao" class="data.dao.UserDao"></jsp:useBean>
<jsp:setProperty name="dto" property="*"></jsp:setProperty>

<%
//    // 수정된 내용을 세션에 저장
//    session.setAttribute("updatedUserInfo", dto);
//    dao.updeteUserInfo(dto);
//    response.sendRedirect("mypage.jsp");
//
////    dao.updeteUserInfo(dto);
////    response.sendRedirect("mypage.jsp");
////    response.sendRedirect("home.jsp");



    // 세션에 수정된 사용자 정보 저장
    session.setAttribute("updatedUserInfo", dto);
    // 사용자가 수정한 내용을 받아와서 UserDto 객체에 저장
    dto.setUserID(request.getParameter("userID"));
    dto.setName(request.getParameter("name"));
    dto.setPh(request.getParameter("ph"));
    dto.setEmail(request.getParameter("email"));

    // UserDao를 사용하여 DB에 사용자 정보 업데이트
//    UserDao dao = new UserDao();
//    dao.updateUserInfo(updatedDto);
    dao.updeteUserInfo(dto);

    // 마이페이지로 이동
    response.sendRedirect("mypage.jsp");
%>