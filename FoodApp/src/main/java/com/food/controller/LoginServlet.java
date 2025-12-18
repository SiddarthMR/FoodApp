package com.food.controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.food.DAO.UserDAO;
import com.food.DAOImpl.UserDAOImpl;
import com.food.model.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDAO userDAO = new UserDAOImpl();
        User user = userDAO.getUser(email);

       

       
        if (user != null && password.equals(user.getPassword())) {
        	 HttpSession session = req.getSession();

            session.setAttribute("loggedInUser", user);
            resp.sendRedirect("home");
        } else {
            req.setAttribute("errorMessage", "Invalid email or password");
            req.getRequestDispatcher("failure.jsp").forward(req,resp);
        }
    }
}
