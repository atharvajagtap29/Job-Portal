package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.JobDAO;
import com.entity.Job;

@WebServlet("/updatejob")
public class UpdateServ extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// super.doPost(req, resp);

		try {

			int id = Integer.parseInt(req.getParameter("id"));
			String title = req.getParameter("job_title");
			String location = req.getParameter("job_location");
			String qualification = req.getParameter("job_qualification");
			String status = req.getParameter("status");
			String desc = req.getParameter("job_description");
			String category = req.getParameter("job_category");

			Job j = new Job();
			j.setId(id);
			j.setTitle(title);
			j.setLocation(location);
			j.setQualification(qualification);
			j.setStatus(status);
			j.setDescription(desc);
			j.setCategory(category);

			JobDAO dao = new JobDAO(DBconnect.getConn());
//			boolean f = dao.updateJob(j);
//
//			//RequestDispatcher rd = req.getRequestDispatcher("Viewjob.jsp");
//			HttpSession session = req.getSession();
//
//			if (f) {
//
////				PrintWriter out = resp.getWriter();
////				out.println("hey man");
//				session.setAttribute("message", "Changes saved successfully");
//				resp.sendRedirect("Viewjob.jsp");
//
////				req.setAttribute("message", "Changes saved successfully");
////				resp.sendRedirect("Viewjob.jsp");
//
//			} else {
//
//				session.setAttribute("message", "Error occurred");
//				resp.sendRedirect("Viewjob.jsp");
//
////				req.setAttribute("message", "Error occurred");
////				resp.sendRedirect("Viewjob.jsp");
//
//			}

//			JobDAO dao = new JobDAO(DBconnect.getConn());
//			boolean f = dao.updateJob(j);
//			HttpSession session = req.getSession();
//
//			if (f) {
//				session.setAttribute("message", "Changes saved successfully");
//				String alertMessage = "Changes saved successfully";
//				String alertType = "success";
//				String redirectUrl = "EditJobs.jsp";
//				String script = "<script src=\"https://cdn.jsdelivr.net/npm/sweetalert2@10\"></script>\n" + "<script>\n"
//						+ "Swal.fire({\n" + "    title: '" + alertMessage + "',\n" + "    icon: '" + alertType + "',\n"
//						+ "    showConfirmButton: false,\n" + "    timer: 1500\n" + "}).then(function() {\n"
//						+ "    window.location.href = '" + redirectUrl + "';\n" + "});\n" + "</script>";
//				session.setAttribute("script", script);
//			} else {
//				session.setAttribute("message", "Error occurred");
//				resp.sendRedirect("EditJobs.jsp");
//			}

			// rd.forward(req, resp);

			// Update the job
			boolean isUpdated = dao.updateJob(j);

			// Set the message and script in the session
			HttpSession session = req.getSession();
			if (isUpdated) {
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
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		doGet(req, resp);
	}
}
