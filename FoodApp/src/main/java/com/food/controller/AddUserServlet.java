package com.food.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.food.DAO.UserDAO;
import com.food.DAOImpl.UserDAOImpl;
import com.food.model.User;

@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phonenumber = request.getParameter("phonenumber");
        String password = request.getParameter("password");
        String address = request.getParameter("address");

        User user = new User(username, email, phonenumber, password, address);

        UserDAO dao = new UserDAOImpl();
        int status = dao.addUser(user);

        if (status > 0) {
            response.sendRedirect("signUp.jsp?msg=Registration Successful!");
        } else {
            response.sendRedirect("signUp.jsp?msg=Registration Failed");
        }
    }
}
