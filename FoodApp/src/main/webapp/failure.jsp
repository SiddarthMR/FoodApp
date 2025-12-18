<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Failed</title>

<style>
    body {
        background: #111;
        color: #fff;
        font-family: Arial, sans-serif;
        text-align: center;
        padding-top: 100px;
    }

    .box {
        width: 450px;
        margin: auto;
        padding: 30px;
        background: #222;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(255,0,0,0.5);
    }

    h1 {
        color: #ff4444;
        margin-bottom: 20px;
    }

    p {
        font-size: 18px;
        margin-bottom: 30px;
    }

    a {
        display: inline-block;
        padding: 12px 25px;
        background: #ff4444;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-size: 16px;
        transition: 0.3s;
    }

    a:hover {
        background: #cc0000;
    }
</style>

</head>
<body>

    <div class="box">
        <h1>Login Failed!</h1>

        <p>
            <% 
                String errorMsg = (String) request.getAttribute("errorMsg");
                if (errorMsg != null) {
                    out.print(errorMsg);
                } else {
                    out.print("Please Enter a Valid Email or Password.");
                }
            %>
        </p>

        <a href="login.jsp">Back to Login</a>
        <br><h3>If u don't have a Account Please Register</h3></br>
        <a href="signUp.jsp">Register</a>
    </div>

</body>
</html>
