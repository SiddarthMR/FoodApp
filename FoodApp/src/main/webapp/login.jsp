<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<style>
@charset "UTF-8";

body {
    margin: 0;
    padding: 0;
    background: #111; /* Dark background */
    font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}


form {
    background: #ffffff10; /* Light transparent white */
    padding: 30px 40px;
    border-radius: 12px;
    backdrop-filter: blur(10px);
    box-shadow: 0 0 20px #000;
    color: white;
}


.message {
    text-align: center;
    font-weight: bold;
    margin-bottom: 15px;
    font-size: 16px;
    color: #00ff00; /* green for success */
}


table {
    width: 100%;
}

td {
    padding: 10px 0;
    font-size: 16px;
    color: #eee;
}


input[type="text"], 
input[type="password"] {
    width: 100%;
    padding: 10px;
    border-radius: 6px;
    border: none;
    outline: none;
    background: #fff;
    color: #000;
    font-size: 16px;
}


input[type="submit"] {
    width: 100%;
    padding: 10px;
    background: #ff6600;
    color: white;
    font-size: 18px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: .3s;
}

input[type="submit"]:hover {
    background: #ff3300;
    transform: scale(1.05);
}
</style>

</head>
<body>

<form action="login" method="post">

  

    <table>
        <tr>
            <td>Email:</td>
            <td><input type="text" name="email" /></td>
        </tr>

        <tr>
            <td>Password:</td>
            <td><input type="password" name="password" /></td>
        </tr>

        <tr>
            <td></td>
            <td><input type="submit" value="Login" /></td>
        </tr>
    </table>
</form>

</body>
</html>
