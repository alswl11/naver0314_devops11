package board.servlet;

import data.dao.SimpleBoardDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/board/updatechu")
public class UpdateChuServlet extends HttpServlet {
    SimpleBoardDao dao = new SimpleBoardDao();

    protected void doGet(HttpServletRequest reqest, HttpServletResponse response) throws ServletException, IOException {
        // num 읽기
        int num = Integer.parseInt(reqest.getParameter("num"));
        // dao, chu update
        dao.updateChu(num);
        // update된 chu값 얻기
        int chu = dao.getData(num).getChu();
        // json 형식으로 문자열 만들고
        String s = "{\"chu\" : "+chu+"}";
        // request에 맘기
       reqest.setAttribute("s", s);
        // jsonchu.jsp로 forward
        RequestDispatcher rd = reqest.getRequestDispatcher("../day0514/jsonchu.jsp");
        rd.forward(reqest, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doGet(request, response);
    }
}
