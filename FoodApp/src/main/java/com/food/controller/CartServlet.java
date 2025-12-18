package com.food.controller;           

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.food.model.Cart;
import com.food.model.CartItem;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
        }

        String action = request.getParameter("action");

        if ("add".equals(action)) {

            int itemId = Integer.parseInt(request.getParameter("itemId"));
            int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));
            String restaurantName = request.getParameter("restaurantName");
            String name = request.getParameter("name");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));

            CartItem item = new CartItem(
                    itemId,
                    restaurantId,
                    restaurantName,
                    name,
                    quantity,
                    price
            );

            cart.addItem(item);
        }

        else if ("update".equals(action)) {
            int itemId = Integer.parseInt(request.getParameter("itemId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            cart.updateItem(itemId, quantity);
        }

        else if ("remove".equals(action)) {
            int itemId = Integer.parseInt(request.getParameter("itemId"));
            cart.removeItem(itemId);
        }

        else if ("clear".equals(action)) {
            cart.clear();
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
    }
}
