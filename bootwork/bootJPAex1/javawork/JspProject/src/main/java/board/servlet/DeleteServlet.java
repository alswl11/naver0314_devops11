package board.servlet;

import data.dao.SimpleBoardDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet("/board/delete")
public class DeleteServlet extends HttpServlet {
    SimpleBoardDao dao = new SimpleBoardDao();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

        // num, currentPage 읽기
        int num = Integer.parseInt(request.getParameter("num"));
        int currentPage = Integer.parseInt(request.getParameter("currentPage"));

        // 삭제
        dao.deleteBoard(num);
        response.sendRedirect("./list?currentPage="+currentPage);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}