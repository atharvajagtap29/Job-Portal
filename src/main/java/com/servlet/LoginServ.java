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
import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/login")
public class LoginServ extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        try {
            String un = req.getParameter("uname");
            String pass = req.getParameter("pass");
            
            String adminUsername = "admin";
            String adminPass = "admin#@123";

            if (adminUsername.equals(un) && adminPass.equals(pass)) {
                HttpSession session = req.getSession(true);
                session.setAttribute("userobj", null); // Setting null for admin user
                User u = new User();
                u.setRole("Admin");
                session.setAttribute("userobj", u);
                resp.sendRedirect("Admin.jsp");
            } else {
                UserDAO dao = new UserDAO(DBconnect.getConn());
                User user = dao.login(un, pass);

                if (user != null) {
                    HttpSession session = req.getSession(true);
                    HttpSession session2 = req.getSession(true);
                    session.setAttribute("status", "success");
                    session2.setAttribute("userobj", user);
                    resp.sendRedirect("User.jsp");
                } else {
                    HttpSession session = req.getSession(true);
                    session.setAttribute("status", "failed");
                    resp.sendRedirect("Login.jsp");
                }
            }
        } catch (Exception e) {
            // Print the exception to the console for debugging
            e.printStackTrace();
            
            // Set an attribute to display an error message on the page
            HttpSession session = req.getSession(true);
            session.setAttribute("status", "error");
            resp.sendRedirect("Login.jsp");
        }
    }
}
