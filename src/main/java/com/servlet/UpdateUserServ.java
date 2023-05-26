package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/update_user")
public class UpdateUserServ extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// super.doPost(req, resp);

		int id = Integer.parseInt(req.getParameter("id"));
		String name = req.getParameter("name");
		String uname = req.getParameter("uname");
		String email = req.getParameter("email");
		String qual = req.getParameter("qual");

		UserDAO dao = new UserDAO(DBconnect.getConn());

		User u = new User();
		u.setId(id);
		u.setName(name);
		u.setUsername(uname);
		u.setEmail(email);
		u.setQualification(qual);

		boolean f = dao.updateUser(u);

		if (f) {
			HttpSession session = req.getSession();
			session.setAttribute("success", "Successful");
			resp.sendRedirect("useredit.jsp");
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("error", "Failed");
			resp.sendRedirect("useredit.jsp");
		}

	}
}
