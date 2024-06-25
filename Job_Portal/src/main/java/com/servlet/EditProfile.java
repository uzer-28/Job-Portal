package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.db.DBconnect;
import com.entity.User;

@WebServlet("/editUser")
public class EditProfile extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt(req.getParameter("id"));
		System.out.println("id:"+id);
		String name = req.getParameter("name");
		String qualification = req.getParameter("qualification");
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		
		try {
			User user = new User(id, name, email, qualification, "user", pass);
			UserDAO dao = new UserDAO(DBconnect.getConnection());
			
			boolean res = dao.editUser(user);
			HttpSession session = req.getSession();
			
			if(res) {
				session.setAttribute("success", "Profile updated successfully.");
				req.setAttribute("id", id);
				RequestDispatcher rs = req.getRequestDispatcher("editProfile.jsp");
				rs.forward(req, resp);
			}
			else {
				session.setAttribute("error", "Something went wrong");
				req.setAttribute("id", id);
				RequestDispatcher rs = req.getRequestDispatcher("editProfile.jsp");
				rs.forward(req, resp);
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	}
	
	


