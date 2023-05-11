package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.JobDAO;

@WebServlet("/delete")
public class DeleteServ extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// super.doGet(req, resp);

		try {

			int id = Integer.parseInt(req.getParameter("id"));

			JobDAO dao = new JobDAO(DBconnect.getConn());
			boolean f = dao.deleteJob(id);

			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("message", "Changes saved successfully");
				session.setAttribute("script",
						"<script>\n" + "Swal.fire({\n" + "    icon: 'success',\n"
								+ "    title: 'Changes saved successfully!',\n" + "    showConfirmButton: false,\n"
								+ "    timer: 1500\n" + "});\n" + "</script>");
			} else {
				session.setAttribute("message", "Error occurred while updating the job");
			}

			// Redirect to the JSP page
			resp.sendRedirect("Viewjob.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
