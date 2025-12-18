<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="com.food.DAO.OrderDAO" %>
<%@ page import="com.food.DAO.OrderItemDAO" %>
<%@ page import="com.food.DAOImpl.OrderDAOImpl" %>
<%@ page import="com.food.DAOImpl.OrderItemDAOImpl" %>
<%@ page import="com.food.model.orderTable" %>
<%@ page import="com.food.model.orderItem" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Summary</title>

<style>
    body {
        background: #fafafa;
        font-family: Arial, sans-serif;
        padding: 20px;
    }
    h1 {
        margin-bottom: 10px;
    }
    table {
        width: 70%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    th, td {
        padding: 12px;
        border: 1px solid #ccc;
        text-align: left;
    }
    th {
        background: #333;
        color: white;
    }
    .restaurant-row {
        background: #222;
        color: white;
        font-weight: bold;
    }
    .total-row {
        background: #eee;
        font-weight: bold;
    }
    .back-btn {
        background:#ff4444;
        color:white;
        padding:8px 15px;
        text-decoration:none;
        border-radius:6px;
    }
</style>
</head>

<body>

<h1>Order Summary</h1>

<a href="home.jsp" class="back-btn">Back to Home</a>

<%
    int orderId = Integer.parseInt(request.getParameter("orderId"));

    OrderDAO orderDAO = new OrderDAOImpl();
    OrderItemDAO orderItemDAO = new OrderItemDAOImpl();

    // Order-level details
    orderTable order = orderDAO.getOrderWithNames(orderId);

    // Order items
    ArrayList<orderItem> items = orderItemDAO.getOrderItemsByOrderId(orderId);

    String currentRestaurant = "";
%>

<!-- 🔹 ORDER HEADER DETAILS -->
<table>
<tr>
    <th>Order ID</th>
    <td><%= order.getOrderId() %></td>
</tr>
<tr>
    <th>Customer Name</th>
    <td><%= order.getUserName() %></td>
</tr>
<tr>
    <th>Order Date</th>
    <td><%= order.getOrderDate() %></td>
</tr>
<tr>
    <th>Payment Mode</th>
    <td><%= order.getPaymentMode() %></td>
</tr>
<tr>
    <th>Status</th>
    <td><%= order.getStatus() %></td>
</tr>
</table>

<!-- 🔹 ORDER ITEMS -->
<table>
<tr>
    <th>Item Name</th>
    <th>Quantity</th>
    <th>Subtotal</th>
</tr>

<%
    for (orderItem oi : items) {

        if (!oi.getRestaurantName().equals(currentRestaurant)) {
            currentRestaurant = oi.getRestaurantName();
%>
<tr class="restaurant-row">
    <td colspan="3">
        Restaurant: <%= currentRestaurant %>
    </td>
</tr>
<%
        }
%>

<tr>
    <td><%= oi.getMenuName() %></td>
    <td><%= oi.getQuantity() %></td>
    <td>₹ <%= oi.getSubTotal() %></td>
</tr>

<%
    }
%>

<tr class="total-row">
    <td colspan="2" align="right">Total Amount</td>
    <td>₹ <%= order.getTotalAmount() %></td>
</tr>

</table>

</body>
</html>
