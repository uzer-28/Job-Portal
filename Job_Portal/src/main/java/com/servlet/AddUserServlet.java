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

@WebServlet("/addUser")
public class AddUserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name = req.getParameter("name");
		String qualification = req.getParameter("qualification");
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		
		try {
			User user = new User(name, email, qualification, "user", pass);
			UserDAO dao = new UserDAO(DBconnect.getConnection());
			
			boolean res = dao.addUser(user);
			HttpSession session = req.getSession();
			
			if(res) {
				session.setAttribute("success", "Registered successfully, please login!");
				resp.sendRedirect("login.jsp");
			}
			else {
				session.setAttribute("error", "Something went wrong");
				resp.sendRedirect("signup.jsp");
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	
	

}
