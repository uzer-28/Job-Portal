package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDAO;
import com.db.DBconnect;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		
		User user = new User();
		HttpSession session = req.getSession();
		
		if(email.equals("admin@gmail.com") && pass.equals("admin")) {
			user.setRole("Admin");
			session.setAttribute("user", user);
			resp.sendRedirect("admin.jsp");
		}
		else {
			try {
				UserDAO dao = new UserDAO(DBconnect.getConnection());
				User user1 = dao.login(email, pass);
				
				if(user1 != null) {
					session.setAttribute("user", user1);
					resp.sendRedirect("home.jsp");
				}
				else {
					session.setAttribute("error", "Invalid Credentials.");
					resp.sendRedirect("login.jsp");
				}
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
