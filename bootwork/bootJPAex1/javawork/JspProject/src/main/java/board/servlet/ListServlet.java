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
import java.util.List;

@WebServlet("/board/list")
public class ListServlet extends HttpServlet {
    SimpleBoardDao dao = new SimpleBoardDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        // 총 갯수
        int totalCount = dao.getTotalCount();
        // 페이징에 필요한 목록 가져오기
        List<SimpleBoardDto> list = null;
        // 페이징에 필요한 변수들
        int perPage = 5; // 한페이지당 보여질 글의 갯수
        int perBlock = 3; // 현재 block에 보여질 페이지의 갯수
        int start; // db에서 가져올 시작 번호
        int startPage; // 각 block에 보여질 시작페이지
        int endPage; // 각 block에 보여질 끝페이지
        int totalPage; // 총 페이지 수
        int currentPage; // 현재 페이지
        int no; // 각 페이지에 보여질 시작번호

        // 현재 페이지를 읽어오는데 null일 경우 1로 초기값 지정
        if(request.getParameter("currentPage")==null){
            currentPage = 1;
        } else
            currentPage = Integer.parseInt(request.getParameter("currentPage"));

        // 총 페이지 수
        totalPage = totalCount/perPage+(totalCount%perPage>0?1:0);

        // 각 block 당 시작페이지 구하기
        startPage = (currentPage-1)/perBlock*perBlock+1;
        endPage = startPage + perBlock-1;
        // endPage 가 totalPage보다 커서는 안됨
        if(endPage > totalPage)
            endPage = totalPage;
        // db에서 가져올 글의 시작번호
        // ex) 1페이지 : 0, 2페이지 : 5~
        // 각 페이지당 5개만 보여질경우 현재 페이지에 따라서 시작번호가 달라질 수 있도록 공식 설정
        start = (currentPage-1)*perPage;

        // 각 페이지에 출력할 시작번호
        // 총 갯수가 20개일 경우, 1페이지 : 20 2페이지:15...
        no = totalCount-(currentPage-1)*perPage;

        // list = dao.getAllDatas(0,10);
        list = dao.getAllDatas(start, perPage);

        // request에 저장
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("list", list);

        // 페이지 출력 시 필요한 변수들을 모두 request에 저장한다
        request.setAttribute("currentPage",currentPage);
        request.setAttribute("startPage",startPage);
        request.setAttribute("endPage",endPage);
        request.setAttribute("totalPage",totalPage);
        request.setAttribute("no",no);

        RequestDispatcher rd = request.getRequestDispatcher("../day0514/boardlist.jsp");
        rd.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}