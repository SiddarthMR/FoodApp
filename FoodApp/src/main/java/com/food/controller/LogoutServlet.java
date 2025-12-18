package com.food.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // Invalidate session to log out
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }

        // Use a new session to store logout message temporarily
        HttpSession newSession = request.getSession(true);
        newSession.setAttribute("logoutMessage", "Logout Successful!");

        // Redirect to index.jsp
        response.sendRedirect("index.jsp");
    }
}
