<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>

<style>
body {
    font-family: Arial;
    background: #111;
    color: white;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding-top: 40px;
}
form {
    width: 350px;
    background: #222;
    padding: 30px;
    border-radius: 10px;
}
input {
    width: 100%;
    padding: 12px;
    margin: 8px 0;
    border-radius: 6px;
    border: none;
}
button {
    width: 100%;
    padding: 12px;
    background: orange;
    border: none;
    border-radius: 6px;
    font-weight: bold;
    font-size: 16px;
}
button:hover {
    background: #ff4500;
}
</style>
</head>

<body>

<h2>Create Account</h2>

<%
String msg = request.getParameter("msg");
if (msg != null) {
%>
    <p style="color:lime;"><%= msg %></p>
<%
}
%>

<form action="AddUserServlet" method="post">

    <input type="text" name="username" placeholder="Full Name" required>

    <input type="email" name="email" placeholder="Email" required>

    <input type="text" name="phonenumber" placeholder="Phone Number" required>

    <input type="password" name="password" placeholder="Password" required>

    <input type="text" name="address" placeholder="Address" required>

    <button type="submit">Register</button>
</form>

<form action="index.jsp" method="get">
    <button class="back-btn">← Back</button>
</form>

</body>
</html>
