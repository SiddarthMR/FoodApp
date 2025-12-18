package com.food.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.food.DAO.MenuDAO;
import com.food.DAOImpl.MenuDAOImpl;
import com.food.model.Menu;

@WebServlet("/viewMenu")
public class MenuServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));

        // Fetch menu items
        MenuDAO menuDAO = new MenuDAOImpl();
        ArrayList<Menu> menuList = menuDAO.getMenusByRestaurant(restaurantId);

        // Fetch restaurant NAME
        String restaurantName = menuDAO.getRestaurantNameById(restaurantId);

        // Store in session (used by Cart + ConfirmOrder)
        HttpSession session = request.getSession();
        session.setAttribute("restaurantId", restaurantId);
        session.setAttribute("restaurantName", restaurantName);

        // Send menu list to JSP
        request.setAttribute("menuList", menuList);
        request.setAttribute("restaurantId", restaurantId);
        request.setAttribute("restaurantName", restaurantName);

        // Forward to menu.jsp
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}
