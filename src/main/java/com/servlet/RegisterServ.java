package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/signup")
public class RegisterServ extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		
		String name = req.getParameter("name");
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String qualification = req.getParameter("qualification");
		
		UserDAO dao = null;
		try {
			dao = new UserDAO(DBconnect.getConn());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		User u = new User(name, username, email, password, qualification, "User");
		
		// password validator
		boolean containsSpecialChar = !password.matches("[a-zA-Z0-9 ]*");
        boolean containsUppercase = !password.equals(password.toLowerCase());
        boolean containsLowercase = !password.equals(password.toUpperCase());
		if(containsSpecialChar && containsUppercase && containsLowercase){
			
			boolean f = dao.addUser(u);
		
			HttpSession session = req.getSession();
			if(f) {
				session.setAttribute("status", "Successful");
				resp.sendRedirect("SignUp.jsp");
			} else {
				session.setAttribute("status", "Failed");
				resp.sendRedirect("SignUp.jsp");
			}
			
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("password", "invalid");
			resp.sendRedirect("SignUp.jsp");
		}
	}

}





/*
 * boolean containsSpecialChar = !password.matches("[a-zA-Z0-9 ]*");
        boolean containsUppercase = !password.equals(password.toLowerCase());
        boolean containsLowercase = !password.equals(password.toUpperCase());
		if(containsSpecialChar && containsUppercase && containsLowercase){} else {
			HttpSession session = req.getSession();
			session.setAttribute("password", "invalid");
			resp.sendRedirect("SignUp.jsp");
		}*/
