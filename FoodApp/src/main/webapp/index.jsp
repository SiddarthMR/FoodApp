<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javax.servlet.http.HttpSession" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<style>
    
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

   
    body {
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        background: linear-gradient(135deg, #111, #222, #000);
        color: white;
        text-align: center;
    }

   
    h1 {
        font-size: 36px;
        font-weight: bold;
        margin-bottom: 40px;
        color: #ff8800;
        text-shadow: 0 0 10px rgba(255,136,0,0.6);
        animation: fadeIn 1.2s ease-in-out;
    }

    
    nav {
        display: flex;
        gap: 35px;
        animation: slideUp 1s ease-out;
    }

  
    nav a {
        text-decoration: none;
        padding: 14px 35px;
        font-size: 20px;
        font-weight: bold;
        border-radius: 10px;
        color: white;
        background: #ff6600;
        box-shadow: 0 4px 10px rgba(255,102,0,0.4);
        transition: 0.3s ease-in-out;
    }

  
    nav a:hover {
        background: #ff3300;
        transform: translateY(-4px) scale(1.08);
        box-shadow: 0 6px 14px rgba(255,51,0,0.6);
    }

   
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }

    @keyframes slideUp {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }

  
    .logout-message {
        margin-bottom: 20px;
        color: #00ff00;
        font-weight: bold;
        font-size: 18px;
        text-align: center;
    }
</style>

</head>
<body>

<%
    String msg = (String) session.getAttribute("logoutMessage");
    if (msg != null) {
%>
        <div class="logout-message"><%= msg %></div>
<%
        session.removeAttribute("logoutMessage");
    }
%>


<h1>Welcome to the Online Food Delivery Service!</h1>

<nav>
    <a href="signUp.jsp">Sign Up</a>
    <a href="login.jsp">Login</a>
</nav>

</body>
</html>
