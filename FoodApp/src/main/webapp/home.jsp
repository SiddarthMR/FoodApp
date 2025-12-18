<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.food.model.User, com.food.model.Restaurant, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Delivery</title>

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

/* ===== NAV ===== */
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


.restaurant-list {
    max-width: 1200px;
    margin: auto;
    padding: 25px;
    display: grid;
    grid-template-columns: repeat(4, minmax(0, 1fr));
    gap: 25px;
}

/* ===== CARD ===== */
.restaurant {
    background: rgba(255,255,255,0.95);
    color: #000;
    padding: 15px;
    border-radius: 14px;
    text-align: center;
    box-shadow: 0 8px 18px rgba(0,0,0,0.35);
    transition: transform 0.3s ease;
}

.restaurant:hover {
    transform: translateY(-8px);
}

.restaurant img {
    width: 100%;
    height: 180px;
    object-fit: cover;
    border-radius: 12px;
}

.restaurant h3 {
    margin: 10px 0;
}


.restaurant a {
    display: inline-block;
    margin-top: 10px;
    padding: 10px 18px;
    background: #ff4444;
    color: white;
    text-decoration: none;
    border-radius: 8px;
}

.restaurant a:hover {
    background: #cc0000;
}


@media (max-width: 1024px) {
    .restaurant-list {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 600px) {
    .restaurant-list {
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

<h2>Featured Restaurants</h2>

<section class="restaurant-list">

<%
    List<Restaurant> restaurantList =
        (List<Restaurant>) session.getAttribute("restaurantList");

    if (restaurantList != null && !restaurantList.isEmpty()) {
        for (Restaurant r : restaurantList) {
%>

    <div class="restaurant">
        <img src="images/restaurant/<%= r.getImagePath() %>"
             alt="<%= r.getRestaurantName() %>">

        <h3><%= r.getRestaurantName() %></h3>

        <p><b>Cuisine:</b> <%= r.getCuisineType() %></p>
        <p><b>Delivery:</b> <%= r.getDeliveryTime() %></p>

        <!-- IMPORTANT: Send ONLY ID -->
        <a href="viewMenu?restaurantId=<%= r.getRestaurantId() %>">
            View Menu
        </a>
    </div>

<%
        }
    } else {
%>

    <p>No restaurants available.</p>

<%
    }
%>

</section>

</body>
</html>
