package board.servlet;

import data.dao.SimpleBoardDao;
import data.dto.SimpleBoardDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet("/board/updateform")
public class UpdateFormServlet extends HttpServlet {
    SimpleBoardDao dao = new SimpleBoardDao();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //num,currentPage 를 읽는다
        int num=Integer.parseInt(request.getParameter("num"));
        int currentPage=Integer.parseInt(request.getParameter("currentPage"));
        //dto 가져오기
        SimpleBoardDto dto=dao.getData(num);

        //request 에 저장
        request.setAttribute("dto", dto);
        request.setAttribute("currentPage", currentPage);//최종수정후 상세페이지로 이동시 필요함

        RequestDispatcher rd=request.getRequestDispatcher("../day0514/updateform.jsp");
        rd.forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}