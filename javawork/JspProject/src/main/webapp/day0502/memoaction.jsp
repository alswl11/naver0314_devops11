<%@page import="data.dao.MemoDao"%>
<%@page import="data.dto.MemoDto"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%--<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>--%>
<%--<%@page import="com.oreilly.servlet.MultipartRequest"%>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    int uploadSize = 1024*1024*5; //5mb
    // 실제 업로드되는 경로 구하기
    // 코드가 있는 프로젝트로 업로드되는 것이 아니라
    // 톰캣 서버에 배포된 프로젝트 안의 save 폴더에 업로드 된다

    ServletContext context = request.getServletContext();
    String realFolder = context.getRealPath("/save");
    System.out.println("realFolder="+realFolder); // 실제 업로드되는 save 폴더의 경로

    MultipartRequest multi = null;
    try {
        multi = new MultipartRequest(request,realFolder,uploadSize,"utf-8",new DefaultFileRenamePolicy());
        // 마지막 인자 : 같은 이름이 업로드 될 경우 이름 변경

        // 데이터 읽기
        String title = multi.getParameter("title");
        String content = multi.getParameter("content");

        System.out.println(title);
        System.out.println(content);
        // 파일은 실제 업로드 된 파일명을 얻는다
        String uploadPhoto = multi.getParameter("upload");
        // dto 선언 후 데이터 넣기

        MemoDto dto = new MemoDto();
        dto.setTitle(title);
        dto.setUploadPhoto(uploadPhoto);
        dto.setContent(content);

        // dao 선언
        MemoDao dao = new MemoDao();

        // insert 후 목록으로 이동
        dao.insertMemo(dto);
        response.sendRedirect("memolist.jsp");

    } catch(Exception e) {%>
<script>
    alert("파일 업로드 오류 : "+e.getMessage())
</script>
<%}
%>