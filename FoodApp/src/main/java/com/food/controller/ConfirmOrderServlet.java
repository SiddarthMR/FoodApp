package com.food.controller;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.food.DAO.*;
import com.food.DAOImpl.*;
import com.food.model.*;

@WebServlet("/confirmOrder")
public class ConfirmOrderServlet extends HttpServlet {

    private OrderDAO orderDAO;
    private OrderItemDAO orderItemDAO;
    private OrderHistoryDAO orderHistoryDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAOImpl();
        orderItemDAO = new OrderItemDAOImpl();
        orderHistoryDAO = new OrderHistoryDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) {
            resp.sendRedirect("cart.jsp");
            return;
        }

        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            resp.sendRedirect("login.jsp?error=Please login first");
            return;
        }

        int userId = user.getUserId();
        double totalAmount = cart.getTotal();
        String paymentMode = req.getParameter("paymentMode");
        if (paymentMode == null) paymentMode = "COD";

        // **Ensure all items are from the same restaurant**
        CartItem firstItem = cart.getItems().values().iterator().next();
        int restaurantId = firstItem.getRestaurantId();
        String restaurantName = firstItem.getRestaurantName();

        // Create order in orderTable
        orderTable order = new orderTable(
                restaurantId,
                userId,
                new Date(),
                totalAmount,
                "Pending",
                paymentMode
        );

        int orderId = orderDAO.addOrderAndReturnId(order);

        if (orderId <= 0) {
            resp.sendRedirect("cart.jsp?error=Order could not be placed");
            return;
        }

        // Insert each cart item into orderitem and orderhistory
        for (CartItem ci : cart.getItems().values()) {
            // OrderItem
            orderItem oi = new orderItem(
                    orderId,
                    ci.getItemId(),       // menuId
                    ci.getRestaurantId(), // restaurantId
                    ci.getName(),         // menuName
                    ci.getRestaurantName(),
                    ci.getQuantity(),
                    ci.getSubtotal()
            );
            orderItemDAO.addOrderItem(oi);

            // OrderHistory
            OrderHistory oh = new OrderHistory(
                    orderId,
                    userId,
                    ci.getRestaurantId(),
                    ci.getItemId(),
                    ci.getRestaurantName(),
                    ci.getName(),
                    new Date(),
                    ci.getSubtotal(),
                    "Completed",
                    paymentMode
            );
            orderHistoryDAO.addOrderHistory(oh);
        }

        // Clear cart after placing order
        cart.clear();
        session.setAttribute("cart", cart);

        resp.sendRedirect("success.jsp?orderId=" + orderId);
    }
}
