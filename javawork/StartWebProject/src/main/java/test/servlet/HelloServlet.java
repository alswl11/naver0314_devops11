//package test.servlet;
//
//public class HelloServlet {
// package test.servlet;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.jsp.JspWriter;
//
//    /**
//     * Servlet implementation class HelloServlet
//     */
//    @WebServlet("/hello.do")
//    public class HelloServlet extends HttpServlet {
//
//        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            // TODO Auto-generated method stub
//            //response.getWriter().append("Served at: ").append(request.getContextPath());
//            PrintWriter out=response.getWriter();
//            out.append("<h2>Hello Servlet!!</h2>");
//        }
//
//        /**
//         * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//         */
//        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//            // TODO Auto-generated method stub
//            doGet(request, response);
//        }
//
//    }
//}
