<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.food.DAO.OrderItemDAO" %>
<%@ page import="com.food.DAOImpl.OrderItemDAOImpl" %>
<%@ page import="com.food.model.orderItem" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success</title>

<style>
    body { font-family: Arial, sans-serif; background: #f7f7f7; padding: 20px; }
    h1 { color: green; }
    table { width: 80%; border-collapse: collapse; margin-top: 20px; }
    th, td { border: 1px solid #ccc; padding: 12px; text-align: left; }
    th { background-color: #333; color: #fff; }
    tr:nth-child(even) { background-color: #f2f2f2; }
</style>
</head>

<body>

<h1>Order Placed Successfully! 🎉</h1>

<%
    // Get orderId from URL
    int orderId = Integer.parseInt(request.getParameter("orderId"));

    // Fetch order items from DAO
    OrderItemDAO dao = new OrderItemDAOImpl();
    ArrayList<orderItem> items = dao.getOrderItemsByOrderId(orderId);
%>

<h2>Your Order ID: <%= orderId %></h2>

<table>
    <tr>
        <th>Menu Name</th>
        <th>Restaurant Name</th>
        <th>Quantity</th>
        <th>Subtotal</th>
    </tr>

    <% for (orderItem oi : items) { %>
        <tr>
            <td><%= oi.getMenuName() != null ? oi.getMenuName() : "N/A" %></td>
            <td><%= oi.getRestaurantName() != null ? oi.getRestaurantName() : "N/A" %></td>
            <td><%= oi.getQuantity() %></td>
            <td>₹ <%= oi.getSubTotal() %></td>
        </tr>
    <% } %>
</table>

<br><br>

<form action="orderDetails.jsp" method="get">
    <input type="hidden" name="orderId" value="<%= orderId %>">
    <button type="submit" 
            style="padding:10px 20px; background:green; color:white; border:none; cursor:pointer;">
        Proceed to Pay
    </button>
</form>

</body>
</html>
