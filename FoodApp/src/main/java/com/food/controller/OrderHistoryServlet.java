package com.food.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.food.DAO.OrderHistoryDAO;
import com.food.DAOImpl.OrderHistoryDAOImpl;
import com.food.model.OrderHistory;
import com.food.model.User;

@WebServlet("/orderHistory")
public class OrderHistoryServlet extends HttpServlet {

    private OrderHistoryDAO dao;

    @Override
    public void init() {
        dao = new OrderHistoryDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("loggedInUser");

        List<OrderHistory> orderList = dao.getOrderHistoryByUser(user.getUserId());

        request.setAttribute("orderList", orderList);

        request.getRequestDispatcher("orderHistory.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("loggedInUser") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("loggedInUser");

        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
            int menuId = Integer.parseInt(request.getParameter("menuId"));
            double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
            String status = request.getParameter("status");
            String paymentMode = request.getParameter("paymentMode");

            OrderHistory oh = new OrderHistory();

            oh.setOrderId(orderId);
            oh.setUserId(user.getUserId());
            oh.setRestaurantId(restaurantId);
            oh.setMenuId(menuId);
            oh.setOrderDate(new Date());
            oh.setTotalAmount(totalAmount);
            oh.setStatus(status);
            oh.setPaymentMode(paymentMode);

            int result = dao.addOrderHistory(oh);

            if (result > 0) {
                response.sendRedirect("orderHistory");
            } else {
                response.getWriter().println("Failed to save order history!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
