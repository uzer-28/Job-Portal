package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JobDAO;
import com.db.DBconnect;

@WebServlet("/deletePost")
public class DeletePostServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		try {
			JobDAO dao = new JobDAO(DBconnect.getConnection());
			boolean res = dao.deletePost(id);
			
			HttpSession session = req.getSession();
			
			if(res) {
				session.setAttribute("success", "Post deleted successfully.");
				resp.sendRedirect("viewjobs.jsp");
			}
			else {
				session.setAttribute("error", "Something went wrong.");
				resp.sendRedirect("viewjobs.jsp");
			}
		} 
		catch (Exception e) {		
			e.printStackTrace();
		}
	}

	
}
