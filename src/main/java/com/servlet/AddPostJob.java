package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.JobDAO;
import com.entity.Job;

@WebServlet(urlPatterns = { "/addjob" })
public class AddPostJob extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// super.doPost(req, resp);

		PrintWriter out = resp.getWriter();
		// out.println("hie");

		try {

			String title = req.getParameter("job_title");
			String location = req.getParameter("job_location");
			String qualification = req.getParameter("job_qualification");
			String status = req.getParameter("status");
			String desc = req.getParameter("job_description");
			String category = req.getParameter("job_category");

//			out.println(title);
//			out.println(location);
//			out.println(qualification);
//			out.println(status);
//			out.println(desc);

			HttpSession session = req.getSession();

			Job j = new Job();
			j.setTitle(title);
			j.setDescription(desc);
			j.setCategory(category);
			j.setQualification(qualification);
			j.setStatus(status);
			j.setLocation(location);

			JobDAO dao = new JobDAO(DBconnect.getConn());
			boolean f = dao.addJobs(j);

			if (f) {

				session.setAttribute("msg", "Post successfully added");
				resp.sendRedirect("Addjob.jsp");

			} else {

				session.setAttribute("msg", "Error occurred");
				resp.sendRedirect("Addjob.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
