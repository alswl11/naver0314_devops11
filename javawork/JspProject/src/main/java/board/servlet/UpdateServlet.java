package board.servlet;

import data.dao.SimpleBoardDao;
import data.dto.SimpleBoardDto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet("/board/update")
public class UpdateServlet extends HttpServlet {

    SimpleBoardDao dao = new SimpleBoardDao();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        // doPost로부터 호출이 되었으므로 encoding을 해줘야한다
        request.setCharacterEncoding("utf-8");

        // 데이터 읽어서 dto에 담기
        SimpleBoardDto dto = new SimpleBoardDto();
        int num = Integer.parseInt(request.getParameter("num"));
        int currentPage = Integer.parseInt(request.getParameter("currentPage"));

        dto.setNum(num);
        dto.setWriter(request.getParameter("writer"));
        dto.setSubject(request.getParameter("subject"));
        dto.setAvata(request.getParameter("avata"));
        dto.setContent(request.getParameter("content"));

        // 수정 메서드 호출
        dao.updateBoard(dto);

        response.sendRedirect("./detail?num="+num+"&currentPage="+currentPage);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}