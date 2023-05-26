package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.User;
import com.servlet.*;

@WebServlet("/logout")
public class LogoutServ extends HttpServlet {

	// the mapping done in anchor tag by default calls the get method so the
	// parameters are visible in URL

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// Retrieve the user object from the session
		HttpSession session = req.getSession(false);
		User user = (User) session.getAttribute("userobj");

		// Get the role value from the user object
		String role = user.getRole();

		// Use the role value as needed
		if ("Admin".equals(role)) {
			session.setAttribute("logoutRedirect", "Admin.jsp");
		} else {
			session.setAttribute("logoutRedirect", "Home.jsp");
		}

		// another session in order to retrieve and destroy the object
		HttpSession session2 = req.getSession(false);
		user = (User) session.getAttribute("userobj");
		session2.setAttribute("destroy", "index.jsp");
		session2.removeAttribute("userobj");

		// Display Sweet Alert confirmation dialog
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		out.println("<html><body>");
		out.println("<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>");
		out.println("<script type='text/javascript'>");
		out.println("Swal.fire({");
		out.println("  title: 'Are you sure you want to logout?',");
		out.println("  icon: 'warning',");
		out.println("  showCancelButton: true,");
		out.println("  confirmButtonText: 'Yes, Logout',");
		out.println("  cancelButtonText: 'No, Cancel'");

		out.println("}).then((result) => {");
		out.println("  if (result.isConfirmed) {");
		out.println("  window.location.href = '" + session2.getAttribute("destroy") + "';");

		out.println("  } else {");
		out.println("  window.location.href = '" + session.getAttribute("logoutRedirect") + "';");
		out.println("  }");
		out.println("});");
		out.println("</script>");
		out.println("</body></html>");
	}

}
