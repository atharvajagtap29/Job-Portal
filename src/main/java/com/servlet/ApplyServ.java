package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.JobDAO;

@WebServlet("/apply")
public class ApplyServ extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// super.doPost(req, resp);

		PrintWriter out = resp.getWriter();
		resp.setContentType("text/html");
//		out.println("<h1>Hey man</h1>");

		int id = Integer.parseInt(req.getParameter("id"));
//		String id = req.getParameter("id");
		String jobprofile = req.getParameter("jobprofile");
		String name = req.getParameter("fullName");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String resume = req.getParameter("resume");
		String availability = req.getParameter("availability");

		JobDAO dao = null;
		try {
			dao = new JobDAO(DBconnect.getConn());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int phoneLength = 10;

		if (phone.length() == phoneLength) {
			boolean f = dao.appliedJob(id, jobprofile, name, email, phone, resume, availability);

			if (f) {

				HttpSession session = req.getSession();
				session.setAttribute("message", "Success");
				resp.sendRedirect("Confirmation.jsp");

			} else {
				HttpSession session = req.getSession();
				session.setAttribute("messege", "Failed");
				resp.sendRedirect("Apply.jsp?id=" + id);
			}

		} else {
			HttpSession session = req.getSession();
			session.setAttribute("messege", "number");
			resp.sendRedirect("User.jsp");
		}

	}

}
