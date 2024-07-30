package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

@WebServlet("/MemberFixServlet")
public class MemberFixServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int point = Integer.parseInt(request.getParameter("point"));
		
		MemberDao mDao = new MemberDao();
		try {
			mDao.update(id, pw, name, point);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("MemberControl.jsp").forward(request, response);
		
	}

}
