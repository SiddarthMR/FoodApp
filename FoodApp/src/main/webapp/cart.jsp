<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.food.model.Cart, com.food.model.CartItem, com.food.model.User" %>

<%
    Cart cart = (Cart) session.getAttribute("cart");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart</title>

<style>

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: url('images/food-bg.jpg') center/cover no-repeat fixed;
    color: #fff;
}

body::before {
    content: "";
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.55);
    z-index: -1;
}

header {
    background: rgba(0,0,0,0.85);
    padding: 20px 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

header h1 {
    margin: 0;
}

nav a {
    color: white;
    margin-left: 20px;
    text-decoration: none;
    font-weight: bold;
}

nav a:hover {
    color: #ff4444;
}

nav span {
    color: #ff4444;
    font-weight: bold;
}


.container {
    max-width: 1100px;
    margin: auto;
    padding: 25px;
}

h2 {
    margin-bottom: 20px;
}


table {
    width: 100%;
    border-collapse: collapse;
    background: rgba(255,255,255,0.95);
    color: #000;
    border-radius: 12px;
    overflow: hidden;
}

th {
    background: #ff4444;
    color: white;
    padding: 12px;
}

td {
    padding: 12px;
    text-align: center;
}

tr:nth-child(even) {
    background: #f2f2f2;
}

.restaurant-row td {
    background: #222;
    color: white;
    font-weight: bold;
    text-align: left;
}

/* ===== FORMS ===== */
input[type="number"] {
    width: 60px;
    padding: 5px;
}

button {
    padding: 8px 14px;
    background: #ff4444;
    border: none;
    color: white;
    border-radius: 6px;
    cursor: pointer;
}

button:hover {
    background: #cc0000;
}

/* ===== ACTIONS ===== */
.actions {
    margin-top: 20px;
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
}

select {
    padding: 6px;
    border-radius: 6px;
}


.empty {
    background: rgba(255,255,255,0.9);
    color: #000;
    padding: 25px;
    border-radius: 12px;
    text-align: center;
}


@media (max-width: 768px) {
    table, thead, tbody, th, td, tr {
        display: block;
    }

    th {
        display: none;
    }

    tr {
        margin-bottom: 15px;
        background: white;
        border-radius: 10px;
    }

    td {
        text-align: right;
        position: relative;
        padding-left: 50%;
    }

    td::before {
        content: attr(data-label);
        position: absolute;
        left: 10px;
        font-weight: bold;
    }
}
</style>
</head>

<body>

<header>
    <h1>Food Delivery</h1>
    <nav>
        <%
            User user = (User) session.getAttribute("loggedInUser");
            if (user != null) {
        %>
            <span>Welcome <%= user.getUsername() %></span>
            <a href="home">Home</a>
            <a href="orderHistory">Orders</a>
            <a href="logout">Logout</a>
        <% } else { %>
            <a href="login.jsp">Login</a>
        <% } %>
    </nav>
</header>

<div class="container">

<h2>Your Cart</h2>

<% if (cart == null || cart.getItems().isEmpty()) { %>

    <div class="empty">
        <h3>Your cart is empty 🛒</h3>
        <a href="home">
            <button style="margin-top:15px;">Browse Restaurants</button>
        </a>
    </div>

<% } else { %>

<table>
    <tr>
        <th>Item</th>
        <th>Restaurant</th>
        <th>Price</th>
        <th>Qty</th>
        <th>Subtotal</th>
        <th>Action</th>
    </tr>

<%
    String currentRestaurant = "";
    for (CartItem ci : cart.getItems().values()) {
        if (!ci.getRestaurantName().equals(currentRestaurant)) {
            currentRestaurant = ci.getRestaurantName();
%>
    <tr class="restaurant-row">
        <td colspan="6">Restaurant: <%= currentRestaurant %></td>
    </tr>
<%
        }
%>
    <tr>
        <td data-label="Item"><%= ci.getName() %></td>
        <td data-label="Restaurant"><%= ci.getRestaurantName() %></td>
        <td data-label="Price">₹<%= ci.getPrice() %></td>

        <td data-label="Qty">
            <form action="cart" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="itemId" value="<%= ci.getItemId() %>">
                <input type="number" name="quantity" value="<%= ci.getQuantity() %>" min="1">
                <button type="submit">Update</button>
            </form>
        </td>

        <td data-label="Subtotal">₹<%= ci.getSubtotal() %></td>

        <td data-label="Action">
            <form action="cart" method="post">
                <input type="hidden" name="action" value="remove">
                <input type="hidden" name="itemId" value="<%= ci.getItemId() %>">
                <button type="submit">Remove</button>
            </form>
        </td>
    </tr>
<%
    }
%>

<tr>
    <td colspan="4" style="text-align:right;"><b>Total</b></td>
    <td colspan="2"><b>₹<%= cart.getTotal() %></b></td>
</tr>
</table>

<div class="actions">

    <form action="home" method="get">
        <button>➕ Add More Items</button>
    </form>

    <form action="confirmOrder" method="post">
        <select name="paymentMode">
            <option value="COD">Cash on Delivery</option>
            <option value="Online">Online</option>
        </select>
        <button>Confirm Order</button>
    </form>

    <form action="cart" method="post">
        <input type="hidden" name="action" value="clear">
        <button>Clear Cart</button>
    </form>

</div>

<% } %>

</div>

</body>
</html>
