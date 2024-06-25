package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.JobDAO;
import com.db.DBconnect;
import com.entity.Job;

@WebServlet("/editJob")
public class EditJob extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		String title = req.getParameter("title");
		String location = req.getParameter("location");
		String category = req.getParameter("category");
		String status = req.getParameter("status");
		String description = req.getParameter("description");
		
		
		try {
			HttpSession session = req.getSession();
			JobDAO dao = new JobDAO(DBconnect.getConnection());
			Job job = new Job(id, title, category, location, description, status);
			boolean res = dao.editJob(job);
			
			if(res) {
				session.setAttribute("success", "Job updated successfully.");
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
