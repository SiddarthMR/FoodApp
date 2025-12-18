<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.food.model.Menu, com.food.model.User" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant Menu</title>

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


h2 {
    margin: 25px;
}


.menu-list {
    max-width: 1200px;
    margin: auto;
    padding: 25px;
    display: grid;
    grid-template-columns: repeat(4, minmax(0, 1fr));
    gap: 25px;
}


.menu-item {
    background: rgba(255,255,255,0.95);
    color: #000;
    padding: 15px;
    border-radius: 14px;
    text-align: center;
    box-shadow: 0 8px 18px rgba(0,0,0,0.35);
    transition: transform 0.3s ease;
}

.menu-item:hover {
    transform: translateY(-8px);
}

.menu-item img {
    width: 100%;
    height: 180px;
    object-fit: cover;
    border-radius: 12px;
}

.menu-item h3 {
    margin: 10px 0;
}


.menu-item form {
    margin-top: 10px;
}

.menu-item input[type="number"] {
    width: 60px;
    padding: 5px;
    margin: 5px 0;
}

.menu-item button {
    display: block;
    width: 100%;
    margin-top: 10px;
    padding: 10px;
    background: #ff4444;
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
}

.menu-item button:hover {
    background: #cc0000;
}

/* ===== RESPONSIVE ===== */
@media (max-width: 1024px) {
    .menu-list {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 600px) {
    .menu-list {
        grid-template-columns: 1fr;
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
            <a href="cart.jsp">Cart</a>
            <a href="orderHistory">Orders</a>
            <a href="logout">Logout</a>
        <% } else { %>
            <a href="login.jsp">Login</a>
            <a href="register.jsp">Register</a>
        <% } %>
    </nav>
</header>

<h2>Menu List from <%= request.getAttribute("restaurantName") %></h2>

<section class="menu-list">

<%
    List<Menu> menuList = (List<Menu>) request.getAttribute("menuList");

    if (menuList != null && !menuList.isEmpty()) {
        for (Menu m : menuList) {
%>

    <div class="menu-item">
        <img src="images/<%= m.getImgPath() %>" alt="<%= m.getName() %>">

        <h3><%= m.getName() %></h3>
        <p><b>Price:</b> ₹<%= m.getPrice() %></p>

        <form action="cart" method="post">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="itemId" value="<%= m.getMenuId() %>">
            <input type="hidden" name="name" value="<%= m.getName() %>">
            <input type="hidden" name="price" value="<%= m.getPrice() %>">
            <input type="hidden" name="restaurantId" value="<%= request.getAttribute("restaurantId") %>">
            <input type="hidden" name="restaurantName" value="<%= request.getAttribute("restaurantName") %>">

            Quantity:
            <input type="number" name="quantity" value="1" min="1">

            <button type="submit">Add to Cart</button>
        </form>
    </div>

<%
        }
    } else {
%>

    <p>No menu items available.</p>

<%
    }
%>

</section>

</body>
</html>
