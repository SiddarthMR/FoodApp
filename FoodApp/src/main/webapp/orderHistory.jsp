<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.food.model.OrderHistory" %>

<!DOCTYPE html>
<html>
<head>
<title>Your Orders</title>

<style>
body {
    font-family: Arial;
    background: #f8f8f8;
}

table {
    width: 90%;
    margin: 20px auto;
    border-collapse: collapse;
    background: white;
}

th, td {
    border: 1px solid #ccc;
    padding: 12px;
    text-align: center;
}

th {
    background: #ff4444;
    color: white;
}

h2 {
    text-align: center;
    margin-top: 30px;
}

a.btn {
    background: #ff4444;
    color: white;
    padding: 8px 15px;
    text-decoration: none;
    border-radius: 6px;
}
</style>

</head>
<body>

<h2>Your Order History</h2>
<div style="text-align:center; margin-bottom: 20px;">
    <a href="home.jsp" class="btn">Back to Home</a>
</div>

<table>
    <tr>
        <th>Order ID</th>
        <th>Restaurant</th>
        <th>Menu Item</th>
        <th>Date</th>
        <th>Total</th>
        <th>Status</th>
        <th>Payment</th>
    </tr>

    <%
        List<OrderHistory> list = (List<OrderHistory>) request.getAttribute("orderList");

        if (list != null && !list.isEmpty()) {
            for (OrderHistory oh : list) {
    %>

    <tr>
        <td><%= oh.getOrderId() %></td>
        <td><%= oh.getRestaurantName() %></td>
        <td><%=oh.getMenuName() %></td>
        <td><%= oh.getOrderDate() %></td>
        <td>₹ <%= oh.getTotalAmount() %></td>
        <td><%= oh.getStatus() %></td>
        <td><%= oh.getPaymentMode() %></td>
    </tr>

    <%
            }
        } else {
    %>
        <tr><td colspan="6">No previous orders found.</td></tr>
    <%
        }
    %>

</table>

</body>
</html>
